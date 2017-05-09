/***************************************************************************
    qgsapplication.cpp - Accessors for application-wide data
     --------------------------------------
    Date                 : 02-Jan-2006
    Copyright            : (C) 2006 by Tom Elwertowski
    Email                : telwertowski at users dot sourceforge dot net
 ***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#include "qgsapplication.h"
#include "qgsauthmanager.h"
#include "qgsdataitemproviderregistry.h"
#include "qgsexception.h"
#include "qgsgeometry.h"
#include "qgslogger.h"
#include "qgsproject.h"
#include "qgsnetworkaccessmanager.h"
#include "qgsproviderregistry.h"
#include "qgsexpression.h"
#include "qgsactionscoperegistry.h"
#include "qgsruntimeprofiler.h"
#include "qgstaskmanager.h"
#include "qgsfieldformatterregistry.h"
#include "qgssvgcache.h"
#include "qgscolorschemeregistry.h"
#include "qgspainteffectregistry.h"
#include "qgsrasterrendererregistry.h"
#include "qgsrendererregistry.h"
#include "qgssymbollayerregistry.h"
#include "qgspluginlayerregistry.h"
#include "qgsmessagelog.h"
#include "qgsannotationregistry.h"
#include "qgssettings.h"

#include "gps/qgsgpsconnectionregistry.h"
#include "processing/qgsprocessingregistry.h"

#include <QDir>
#include <QFile>
#include <QFileInfo>
#include <QFileOpenEvent>
#include <QMessageBox>
#include <QPalette>
#include <QProcess>
#include <QIcon>
#include <QPixmap>
#include <QThreadPool>
#include <QLocale>

#ifndef Q_OS_WIN
#include <netinet/in.h>
#include <pwd.h>
#else
#include <winsock.h>
#include <windows.h>
#include <Lmcons.h>
#define SECURITY_WIN32
#include <Security.h>
#pragma comment( lib, "Secur32.lib" )
#endif

#include "qgsconfig.h"

#include <gdal.h>
#include <ogr_api.h>
#include <cpl_conv.h> // for setting gdal options
#include <sqlite3.h>

QObject *ABISYM( QgsApplication::mFileOpenEventReceiver );
QStringList ABISYM( QgsApplication::mFileOpenEventList );
QString ABISYM( QgsApplication::mPrefixPath );
QString ABISYM( QgsApplication::mPluginPath );
QString ABISYM( QgsApplication::mPkgDataPath );
QString ABISYM( QgsApplication::mLibraryPath );
QString ABISYM( QgsApplication::mLibexecPath );
QString ABISYM( QgsApplication::mThemeName );
QString ABISYM( QgsApplication::mUIThemeName );
QStringList ABISYM( QgsApplication::mDefaultSvgPaths );
QMap<QString, QString> ABISYM( QgsApplication::mSystemEnvVars );
QString ABISYM( QgsApplication::mConfigPath );
bool ABISYM( QgsApplication::mRunningFromBuildDir ) = false;
QString ABISYM( QgsApplication::mBuildSourcePath );
#ifdef _MSC_VER
QString ABISYM( QgsApplication::mCfgIntDir );
#endif
QString ABISYM( QgsApplication::mBuildOutputPath );
QStringList ABISYM( QgsApplication::mGdalSkipList );
int ABISYM( QgsApplication::mMaxThreads );
QString ABISYM( QgsApplication::mAuthDbDirPath );

QString QgsApplication::sUserName;
QString QgsApplication::sUserFullName;
QString QgsApplication::sPlatformName = QStringLiteral( "desktop" );

const char *QgsApplication::QGIS_ORGANIZATION_NAME = "HEX Tecnologias Geoespaciais";
const char *QgsApplication::QGIS_ORGANIZATION_DOMAIN = "hexgis.com";
const char *QgsApplication::QGIS_APPLICATION_NAME = "Smart Eye";

QgsApplication::ApplicationMembers *QgsApplication::sApplicationMembers = nullptr;

QgsApplication::QgsApplication( int &argc, char **argv, bool GUIenabled, const QString &customConfigPath, const QString &platformName )
  : QApplication( argc, argv, GUIenabled )
{
  sPlatformName = platformName;

  mApplicationMembers = new ApplicationMembers();

  init( customConfigPath ); // init can also be called directly by e.g. unit tests that don't inherit QApplication.
}

void QgsApplication::init( QString customConfigPath )
{
  if ( customConfigPath.isEmpty() )
  {
    if ( getenv( "QGIS_CUSTOM_CONFIG_PATH" ) )
    {
      customConfigPath = getenv( "QGIS_CUSTOM_CONFIG_PATH" );
    }
    else
    {
      customConfigPath = QStringLiteral( "%1/.qgis3/" ).arg( QDir::homePath() );
    }
  }

  qRegisterMetaType<QgsGeometry::Error>( "QgsGeometry::Error" );

  QString prefixPath( getenv( "QGIS_PREFIX_PATH" ) ? getenv( "QGIS_PREFIX_PATH" ) : applicationDirPath() );
  // QgsDebugMsg( QString( "prefixPath(): %1" ).arg( prefixPath ) );

  // check if QGIS is run from build directory (not the install directory)
  QFile f;
  // "/../../.." is for Mac bundled app in build directory
  Q_FOREACH ( const QString &path, QStringList() << "" << "/.." << "/bin" << "/../../.." )
  {
    f.setFileName( prefixPath + path + "/qgisbuildpath.txt" );
    if ( f.exists() )
      break;
  }
  if ( f.exists() && f.open( QIODevice::ReadOnly ) )
  {
    ABISYM( mRunningFromBuildDir ) = true;
    ABISYM( mBuildSourcePath ) = f.readLine().trimmed();
    ABISYM( mBuildOutputPath ) = f.readLine().trimmed();
    qDebug( "Running from build directory!" );
    qDebug( "- source directory: %s", ABISYM( mBuildSourcePath ).toUtf8().data() );
    qDebug( "- output directory of the build: %s", ABISYM( mBuildOutputPath ).toUtf8().data() );
#ifdef _MSC_VER
    ABISYM( mCfgIntDir ) = prefixPath.split( '/', QString::SkipEmptyParts ).last();
    qDebug( "- cfg: %s", ABISYM( mCfgIntDir ).toUtf8().data() );
#endif
  }

  if ( ABISYM( mRunningFromBuildDir ) )
  {
    // we run from source directory - not installed to destination (specified prefix)
    ABISYM( mPrefixPath ) = QString(); // set invalid path
#if defined(_MSC_VER) && !defined(USING_NMAKE) && !defined(USING_NINJA)
    setPluginPath( ABISYM( mBuildOutputPath ) + '/' + QString( QGIS_PLUGIN_SUBDIR ) + '/' + ABISYM( mCfgIntDir ) );
#else
    setPluginPath( ABISYM( mBuildOutputPath ) + '/' + QStringLiteral( QGIS_PLUGIN_SUBDIR ) );
#endif
    setPkgDataPath( ABISYM( mBuildSourcePath ) ); // directly source path - used for: doc, resources, svg
    ABISYM( mLibraryPath ) = ABISYM( mBuildOutputPath ) + '/' + QGIS_LIB_SUBDIR + '/';
#if defined(_MSC_VER) && !defined(USING_NMAKE) && !defined(USING_NINJA)
    ABISYM( mLibexecPath ) = ABISYM( mBuildOutputPath ) + '/' + QGIS_LIBEXEC_SUBDIR + '/' + ABISYM( mCfgIntDir ) + '/';
#else
    ABISYM( mLibexecPath ) = ABISYM( mBuildOutputPath ) + '/' + QGIS_LIBEXEC_SUBDIR + '/';
#endif
  }
  else
  {
    char *prefixPath = getenv( "QGIS_PREFIX_PATH" );
    if ( !prefixPath )
    {
#if defined(Q_OS_MACX) || defined(Q_OS_WIN)
      setPrefixPath( applicationDirPath(), true );
#elif defined(ANDROID)
      // this is  "/data/data/org.qgis.qgis" in android
      QDir myDir( QDir::homePath() );
      myDir.cdUp();
      QString myPrefix = myDir.absolutePath();
      setPrefixPath( myPrefix, true );
#else
      QDir myDir( applicationDirPath() );
      myDir.cdUp();
      QString myPrefix = myDir.absolutePath();
      setPrefixPath( myPrefix, true );
#endif
    }
    else
    {
      setPrefixPath( prefixPath, true );
    }
  }

  if ( !customConfigPath.isEmpty() )
  {
    ABISYM( mConfigPath ) = customConfigPath + '/'; // make sure trailing slash is included
  }

  ABISYM( mDefaultSvgPaths ) << qgisSettingsDirPath() + QStringLiteral( "svg/" );

  ABISYM( mAuthDbDirPath ) = qgisSettingsDirPath();
  if ( getenv( "QGIS_AUTH_DB_DIR_PATH" ) )
  {
    setAuthDatabaseDirPath( getenv( "QGIS_AUTH_DB_DIR_PATH" ) );
  }


  // store system environment variables passed to application, before they are adjusted
  QMap<QString, QString> systemEnvVarMap;
  QString passfile( QStringLiteral( "QGIS_AUTH_PASSWORD_FILE" ) ); // QString, for comparison
  Q_FOREACH ( const QString &varStr, QProcess::systemEnvironment() )
  {
    int pos = varStr.indexOf( QLatin1Char( '=' ) );
    if ( pos == -1 )
      continue;
    QString varStrName = varStr.left( pos );
    QString varStrValue = varStr.mid( pos + 1 );
    if ( varStrName != passfile )
    {
      systemEnvVarMap.insert( varStrName, varStrValue );
    }
  }
  ABISYM( mSystemEnvVars ) = systemEnvVarMap;

  // allow Qt to search for Qt plugins (e.g. sqldrivers) in our plugin directory
  QCoreApplication::addLibraryPath( pluginPath() );

  // set max. thread count to -1
  // this should be read from QgsSettings but we don't know where they are at this point
  // so we read actual value in main.cpp
  ABISYM( mMaxThreads ) = -1;
}

QgsApplication::~QgsApplication()
{
  delete mDataItemProviderRegistry;
  delete mApplicationMembers;
}

QgsApplication *QgsApplication::instance()
{
  return qobject_cast<QgsApplication *>( QCoreApplication::instance() );
}

bool QgsApplication::event( QEvent *event )
{
  bool done = false;
  if ( event->type() == QEvent::FileOpen )
  {
    // handle FileOpen event (double clicking a file icon in Mac OS X Finder)
    if ( ABISYM( mFileOpenEventReceiver ) )
    {
      // Forward event to main window.
      done = notify( ABISYM( mFileOpenEventReceiver ), event );
    }
    else
    {
      // Store filename because receiver has not registered yet.
      // If QGIS has been launched by double clicking a file icon, FileOpen will be
      // the first event; the main window is not yet ready to handle the event.
      ABISYM( mFileOpenEventList ).append( static_cast<QFileOpenEvent *>( event )->file() );
      done = true;
    }
  }
  else
  {
    // pass other events to base class
    done = QApplication::event( event );
  }
  return done;
}

bool QgsApplication::notify( QObject *receiver, QEvent *event )
{
  bool done = false;
  // Crashes  in customization (especially on Mac), if we're not in the main/UI thread, see #5597
  if ( thread() == receiver->thread() )
    emit preNotify( receiver, event, &done );

  if ( done )
    return true;

  // Send event to receiver and catch unhandled exceptions
  done = true;
  try
  {
    done = QApplication::notify( receiver, event );
  }
  catch ( QgsException &e )
  {
    QgsDebugMsg( "Caught unhandled QgsException: " + e.what() );
    if ( qApp->thread() == QThread::currentThread() )
      QMessageBox::critical( activeWindow(), tr( "Exception" ), e.what() );
  }
  catch ( std::exception &e )
  {
    QgsDebugMsg( "Caught unhandled std::exception: " + QString::fromAscii( e.what() ) );
    if ( qApp->thread() == QThread::currentThread() )
      QMessageBox::critical( activeWindow(), tr( "Exception" ), e.what() );
  }
  catch ( ... )
  {
    QgsDebugMsg( "Caught unhandled unknown exception" );
    if ( qApp->thread() == QThread::currentThread() )
      QMessageBox::critical( activeWindow(), tr( "Exception" ), tr( "unknown exception" ) );
  }

  return done;
}

QgsRuntimeProfiler *QgsApplication::profiler()
{
  return members()->mProfiler;
}

void QgsApplication::setFileOpenEventReceiver( QObject *receiver )
{
  // Set receiver for FileOpen events
  ABISYM( mFileOpenEventReceiver ) = receiver;
  // Propagate any events collected before the receiver has registered.
  if ( ABISYM( mFileOpenEventList ).count() > 0 )
  {
    QStringListIterator i( ABISYM( mFileOpenEventList ) );
    while ( i.hasNext() )
    {
      QFileOpenEvent foe( i.next() );
      QgsApplication::sendEvent( ABISYM( mFileOpenEventReceiver ), &foe );
    }
    ABISYM( mFileOpenEventList ).clear();
  }
}

void QgsApplication::setPrefixPath( const QString &prefixPath, bool useDefaultPaths )
{
  ABISYM( mPrefixPath ) = prefixPath;
#if defined(_MSC_VER)
  if ( ABISYM( mPrefixPath ).endsWith( "/bin" ) )
  {
    ABISYM( mPrefixPath ).chop( 4 );
  }
#endif
  if ( useDefaultPaths && !ABISYM( mRunningFromBuildDir ) )
  {
    setPluginPath( ABISYM( mPrefixPath ) + '/' + QStringLiteral( QGIS_PLUGIN_SUBDIR ) );
    setPkgDataPath( ABISYM( mPrefixPath ) + '/' + QStringLiteral( QGIS_DATA_SUBDIR ) );
  }
  ABISYM( mLibraryPath ) = ABISYM( mPrefixPath ) + '/' + QGIS_LIB_SUBDIR + '/';
  ABISYM( mLibexecPath ) = ABISYM( mPrefixPath ) + '/' + QGIS_LIBEXEC_SUBDIR + '/';
}

void QgsApplication::setPluginPath( const QString &pluginPath )
{
  ABISYM( mPluginPath ) = pluginPath;
}

void QgsApplication::setPkgDataPath( const QString &pkgDataPath )
{
  ABISYM( mPkgDataPath ) = pkgDataPath;
  QString mySvgPath = pkgDataPath + ( ABISYM( mRunningFromBuildDir ) ? "/images/svg/" : "/svg/" );
  // avoid duplicate entries
  if ( !ABISYM( mDefaultSvgPaths ).contains( mySvgPath ) )
    ABISYM( mDefaultSvgPaths ) << mySvgPath;
}

void QgsApplication::setDefaultSvgPaths( const QStringList &pathList )
{
  ABISYM( mDefaultSvgPaths ) = pathList;
}

void QgsApplication::setAuthDatabaseDirPath( const QString &authDbDirPath )
{
  QFileInfo fi( authDbDirPath );
  if ( fi.exists() && fi.isDir() && fi.isWritable() )
  {
    ABISYM( mAuthDbDirPath ) = fi.canonicalFilePath() + QDir::separator();
  }
}

QString QgsApplication::prefixPath()
{
  if ( ABISYM( mRunningFromBuildDir ) )
  {
    static bool sOnce = true;
    if ( sOnce )
      qWarning( "!!! prefix path was requested, but it is not valid - we do not run from installed path !!!" );
    sOnce = false;
  }

  return ABISYM( mPrefixPath );
}
QString QgsApplication::pluginPath()
{
  return ABISYM( mPluginPath );
}
QString QgsApplication::pkgDataPath()
{
  return ABISYM( mPkgDataPath );
}
QString QgsApplication::defaultThemePath()
{
  return QStringLiteral( ":/images/themes/default/" );
}
QString QgsApplication::activeThemePath()
{
  return userThemesFolder() + QDir::separator() + themeName() + QDir::separator() + "icons/";
}

QString QgsApplication::appIconPath()
{
  return iconsPath() + QStringLiteral( "qgis-icon-60x60.png" );
}

QString QgsApplication::iconPath( const QString &iconFile )
{
  // try active theme
  QString path = activeThemePath();
  if ( QFile::exists( path + iconFile ) )
    return path + iconFile;

  // use default theme
  return defaultThemePath() + iconFile;
}

QIcon QgsApplication::getThemeIcon( const QString &name )
{
  QgsApplication *app = instance();
  if ( app && app->mIconCache.contains( name ) )
    return app->mIconCache.value( name );

  QIcon icon;

  QString myPreferredPath = activeThemePath() + QDir::separator() + name;
  QString myDefaultPath = defaultThemePath() + QDir::separator() + name;
  if ( QFile::exists( myPreferredPath ) )
  {
    icon = QIcon( myPreferredPath );
  }
  else if ( QFile::exists( myDefaultPath ) )
  {
    //could still return an empty icon if it
    //doesn't exist in the default theme either!
    icon = QIcon( myDefaultPath );
  }
  else
  {
    icon = QIcon();
  }

  if ( app )
    app->mIconCache.insert( name, icon );
  return icon;
}

// TODO: add some caching mechanism ?
QPixmap QgsApplication::getThemePixmap( const QString &name )
{
  QString myPreferredPath = activeThemePath() + QDir::separator() + name;
  QString myDefaultPath = defaultThemePath() + QDir::separator() + name;
  if ( QFile::exists( myPreferredPath ) )
  {
    return QPixmap( myPreferredPath );
  }
  else
  {
    //could still return an empty icon if it
    //doesn't exist in the default theme either!
    return QPixmap( myDefaultPath );
  }
}

void QgsApplication::setThemeName( const QString &themeName )
{
  ABISYM( mThemeName ) = themeName;
}

QString QgsApplication::themeName()
{
  return ABISYM( mThemeName );
}

void QgsApplication::setUITheme( const QString &themeName )
{
  // Loop all style sheets, find matching name, load it.
  QHash<QString, QString> themes = QgsApplication::uiThemes();
  if ( themeName == QStringLiteral( "default" ) || !themes.contains( themeName ) )
  {
    setThemeName( QStringLiteral( "default" ) );
    qApp->setStyleSheet( QString() );
    return;
  }

  QString path = themes.value( themeName );
  QString stylesheetname = path + "/style.qss";
  QString autostylesheet = stylesheetname + ".auto";

  QFile file( stylesheetname );
  QFile variablesfile( path + "/variables.qss" );
  QFile fileout( autostylesheet );

  QFileInfo variableInfo( variablesfile );

  if ( variableInfo.exists() && variablesfile.open( QIODevice::ReadOnly ) )
  {
    if ( !file.open( QIODevice::ReadOnly ) || !fileout.open( QIODevice::WriteOnly | QIODevice::Text | QIODevice::Truncate ) )
    {
      return;
    }

    QString styledata = file.readAll();
    QTextStream in( &variablesfile );
    while ( !in.atEnd() )
    {
      QString line = in.readLine();
      // This is is a variable
      if ( line.startsWith( '@' ) )
      {
        int index = line.indexOf( ':' );
        QString name = line.mid( 0, index );
        QString value = line.mid( index + 1, line.length() );
        styledata.replace( name, value );
      }
    }
    variablesfile.close();
    QTextStream out( &fileout );
    out << styledata;
    fileout.close();
    file.close();
    stylesheetname = autostylesheet;
  }

  QString styleSheet = QStringLiteral( "file:///" );
  styleSheet.append( stylesheetname );
  qApp->setStyleSheet( styleSheet );
  setThemeName( themeName );
}

QHash<QString, QString> QgsApplication::uiThemes()
{
  QStringList paths = QStringList() << userThemesFolder();
  QHash<QString, QString> mapping;
  mapping.insert( QStringLiteral( "default" ), QLatin1String( "" ) );
  Q_FOREACH ( const QString &path, paths )
  {
    QDir folder( path );
    QFileInfoList styleFiles = folder.entryInfoList( QDir::Dirs | QDir::NoDotAndDotDot );
    Q_FOREACH ( const QFileInfo &info, styleFiles )
    {
      QFileInfo styleFile( info.absoluteFilePath() + "/style.qss" );
      if ( !styleFile.exists() )
        continue;

      QString name = info.baseName();
      QString path = info.absoluteFilePath();
      mapping.insert( name, path );
    }
  }
  return mapping;
}

QString QgsApplication::authorsFilePath()
{
  return ABISYM( mPkgDataPath ) + QStringLiteral( "/doc/AUTHORS" );
}

QString QgsApplication::contributorsFilePath()
{
  return ABISYM( mPkgDataPath ) + QStringLiteral( "/doc/CONTRIBUTORS" );
}
QString QgsApplication::developersMapFilePath()
{
  return ABISYM( mPkgDataPath ) + QStringLiteral( "/doc/developersmap.html" );
}

QString QgsApplication::sponsorsFilePath()
{
  return ABISYM( mPkgDataPath ) + QStringLiteral( "/doc/SPONSORS" );
}

QString QgsApplication::donorsFilePath()
{
  return ABISYM( mPkgDataPath ) + QStringLiteral( "/doc/DONORS" );
}

QString QgsApplication::translatorsFilePath()
{
  return ABISYM( mPkgDataPath ) + QStringLiteral( "/doc/TRANSLATORS" );
}

QString QgsApplication::licenceFilePath()
{
  return ABISYM( mPkgDataPath ) + QStringLiteral( "/doc/LICENSE" );
}

QString QgsApplication::helpAppPath()
{
  QString helpAppPath;
#ifdef Q_OS_MACX
  helpAppPath = applicationDirPath() + "/bin/qgis_help.app/Contents/MacOS";
#else
  helpAppPath = libexecPath();
#endif
  helpAppPath += QLatin1String( "/qgis_help" );
#ifdef Q_OS_WIN
  helpAppPath += ".exe";
#endif
  return helpAppPath;
}

QString QgsApplication::i18nPath()
{
  if ( ABISYM( mRunningFromBuildDir ) )
    return ABISYM( mBuildOutputPath ) + QStringLiteral( "/i18n" );
  else
    return ABISYM( mPkgDataPath ) + QStringLiteral( "/i18n/" );
}

QString QgsApplication::qgisMasterDatabaseFilePath()
{
  return ABISYM( mPkgDataPath ) + QStringLiteral( "/resources/qgis.db" );
}

QString QgsApplication::qgisSettingsDirPath()
{
  return ABISYM( mConfigPath );
}

QString QgsApplication::qgisUserDatabaseFilePath()
{
  return qgisSettingsDirPath() + QStringLiteral( "qgis.db" );
}

QString QgsApplication::qgisAuthDatabaseFilePath()
{
  return ABISYM( mAuthDbDirPath ) + QStringLiteral( "qgis-auth.db" );
}

QString QgsApplication::splashPath()
{
  return QStringLiteral( ":/images/splash/" );
}

QString QgsApplication::iconsPath()
{
  return ABISYM( mPkgDataPath ) + QStringLiteral( "/images/icons/" );
}

QString QgsApplication::srsDatabaseFilePath()
{
  if ( ABISYM( mRunningFromBuildDir ) )
  {
    QString tempCopy = QDir::tempPath() + "/srs.db";

    if ( !QFile( tempCopy ).exists() )
    {
      QFile f( ABISYM( mPkgDataPath ) + "/resources/srs.db" );
      if ( !f.copy( tempCopy ) )
      {
        qFatal( "Could not create temporary copy" );
      }
    }

    return tempCopy;
  }
  else
  {
    return ABISYM( mPkgDataPath ) + QStringLiteral( "/resources/srs.db" );
  }
}

QStringList QgsApplication::svgPaths()
{
  //local directories to search when looking for an SVG with a given basename
  //defined by user in options dialog
  QgsSettings settings;
  QStringList pathList = settings.value( QStringLiteral( "svg/searchPathsForSVG" ) ).toStringList();

  // maintain user set order while stripping duplicates
  QStringList paths;
  Q_FOREACH ( const QString &path, pathList )
  {
    if ( !paths.contains( path ) )
      paths.append( path );
  }
  Q_FOREACH ( const QString &path, ABISYM( mDefaultSvgPaths ) )
  {
    if ( !paths.contains( path ) )
      paths.append( path );
  }

  return paths;
}

QStringList QgsApplication::composerTemplatePaths()
{
  //local directories to search when looking for an SVG with a given basename
  //defined by user in options dialog
  QgsSettings settings;
  QStringList pathList = settings.value( QStringLiteral( "composer/searchPathsForTemplates" ) ).toStringList();

  return pathList;
}

QString QgsApplication::userStylePath()
{
  return qgisSettingsDirPath() + QStringLiteral( "symbology-ng-style.db" );
}

QRegExp QgsApplication::shortNameRegExp()
{
  return QRegExp( "^[A-Za-z][A-Za-z0-9\\._-]*" );
}

QString QgsApplication::userLoginName()
{
  if ( !sUserName.isEmpty() )
    return sUserName;

#ifdef Q_OS_WIN
  TCHAR name [ UNLEN + 1 ];
  DWORD size = UNLEN + 1;

  if ( GetUserName( ( TCHAR * )name, &size ) )
  {
    sUserName = QString( name );
  }

#else
  QProcess process;

  process.start( QStringLiteral( "whoami" ) );
  process.waitForFinished();
  sUserName = process.readAllStandardOutput().trimmed();
#endif

  if ( !sUserName.isEmpty() )
    return sUserName;

  //backup plan - use environment variables
  sUserName = qgetenv( "USER" );
  if ( !sUserName.isEmpty() )
    return sUserName;

  //last resort
  sUserName = qgetenv( "USERNAME" );
  return sUserName;
}

QString QgsApplication::userFullName()
{
  if ( !sUserFullName.isEmpty() )
    return sUserFullName;

#ifdef Q_OS_WIN
  TCHAR name [ UNLEN + 1 ];
  DWORD size = UNLEN + 1;

  //note - this only works for accounts connected to domain
  if ( GetUserNameEx( NameDisplay, ( TCHAR * )name, &size ) )
  {
    sUserFullName = QString( name );
  }

  //fall back to login name
  if ( sUserFullName.isEmpty() )
    sUserFullName = userLoginName();
#elif defined(Q_OS_ANDROID)
  sUserFullName = "Not available";
#else
  struct passwd *p = getpwuid( getuid() );

  if ( p )
  {
    QString gecosName = QString( p->pw_gecos );
    sUserFullName = gecosName.left( gecosName.indexOf( ',', 0 ) );
  }

#endif

  return sUserFullName;
}

QString QgsApplication::osName()
{
#if defined(Q_OS_ANDROID)
  return QLatin1String( "android" );
#elif defined(Q_OS_MAC)
  return QLatin1String( "osx" );
#elif defined(Q_OS_WIN)
  return QLatin1String( "windows" );
#elif defined(Q_OS_LINUX)
  return QStringLiteral( "linux" );
#else
  return QLatin1String( "unknown" );
#endif
}

QString QgsApplication::platform()
{
  return sPlatformName;
}

QString QgsApplication::locale()
{
  QgsSettings settings;
  bool overrideLocale = settings.value( QStringLiteral( "locale/overrideFlag" ), false ).toBool();
  if ( overrideLocale )
  {
    return settings.value( QStringLiteral( "locale/userLocale" ), QString() ).toString();
  }
  else
  {
    return QLocale::system().name().left( 2 );
  }
}

QString QgsApplication::userThemesFolder()
{
  return qgisSettingsDirPath() + QStringLiteral( "/themes" );
}

QString QgsApplication::defaultStylePath()
{
  return ABISYM( mPkgDataPath ) + QStringLiteral( "/resources/symbology-ng-style.xml" );
}

QString QgsApplication::defaultThemesFolder()
{
  return ABISYM( mPkgDataPath ) + QStringLiteral( "/resources/themes" );
}

QString QgsApplication::libraryPath()
{
  return ABISYM( mLibraryPath );
}

QString QgsApplication::libexecPath()
{
  return ABISYM( mLibexecPath );
}

QgsApplication::endian_t QgsApplication::endian()
{
  return ( htonl( 1 ) == 1 ) ? XDR : NDR;
}

void QgsApplication::initQgis()
{
  // set the provider plugin path (this creates provider registry)
  QgsProviderRegistry::instance( pluginPath() );

  instance()->mDataItemProviderRegistry = new QgsDataItemProviderRegistry();

  // create project instance if doesn't exist
  QgsProject::instance();

  // Make sure we have a NAM created on the main thread.
  QgsNetworkAccessManager::instance();

  // initialize authentication manager and connect to database
  QgsAuthManager::instance()->init( pluginPath() );
}

void QgsApplication::exitQgis()
{
  delete QgsAuthManager::instance();

  //Ensure that all remaining deleteLater QObjects are actually deleted before we exit.
  //This isn't strictly necessary (since we're exiting anyway) but doing so prevents a lot of
  //LeakSanitiser noise which hides real issues
  QgsApplication::sendPostedEvents( nullptr, QEvent::DeferredDelete );

  delete QgsProviderRegistry::instance();

  //delete all registered functions from expression engine (see above comment)
  QgsExpression::cleanRegisteredFunctions();

  // tear-down GDAL/OGR
  OGRCleanupAll();
  GDALDestroyDriverManager();
}

QString QgsApplication::showSettings()
{
  QString myEnvironmentVar( getenv( "QGIS_PREFIX_PATH" ) );
  QString myState = tr( "Application state:\n"
                        "QGIS_PREFIX_PATH env var:\t\t%1\n"
                        "Prefix:\t\t%2\n"
                        "Plugin Path:\t\t%3\n"
                        "Package Data Path:\t%4\n"
                        "Active Theme Name:\t%5\n"
                        "Active Theme Path:\t%6\n"
                        "Default Theme Path:\t%7\n"
                        "SVG Search Paths:\t%8\n"
                        "User DB Path:\t%9\n"
                        "Auth DB Path:\t%10\n" )
                    .arg( myEnvironmentVar,
                          prefixPath(),
                          pluginPath(),
                          pkgDataPath(),
                          themeName(),
                          activeThemePath(),
                          defaultThemePath(),
                          svgPaths().join( tr( "\n\t\t", "match indentation of application state" ) ),
                          qgisMasterDatabaseFilePath() )
                    .arg( qgisAuthDatabaseFilePath() );
  return myState;
}

QString QgsApplication::reportStyleSheet()
{
  //
  // Make the style sheet desktop preferences aware by using qappliation
  // palette as a basis for colors where appropriate
  //
//  QColor myColor1 = palette().highlight().color();
  QColor myColor1( Qt::lightGray );
  QColor myColor2 = myColor1;
  myColor2 = myColor2.lighter( 110 ); //10% lighter
  QString myStyle;
  myStyle = "p.glossy{ background-color: qlineargradient(x1:0, y1:0, x2:0, y2:1, "
            "  stop: 0 " + myColor1.name()  + ","
            "  stop: 0.1 " + myColor2.name() + ","
            "  stop: 0.5 " + myColor1.name()  + ","
            "  stop: 0.9 " + myColor2.name() + ","
            "  stop: 1 " + myColor1.name() + ");"
            "  color: black;"
            "  padding-left: 4px;"
            "  padding-top: 20px;"
            "  padding-bottom: 8px;"
            "  border: 1px solid #6c6c6c;"
            "}"
            "p.subheaderglossy{ background-color: qlineargradient(x1:0, y1:0, x2:0, y2:1, "
            "  stop: 0 " + myColor1.name()  + ","
            "  stop: 0.1 " + myColor2.name() + ","
            "  stop: 0.5 " + myColor1.name()  + ","
            "  stop: 0.9 " + myColor2.name() + ","
            "  stop: 1 " + myColor1.name() + ");"
            "  font-weight: bold;"
            "  font-size: medium;"
            "  line-height: 1.1em;"
            "  width: 100%;"
            "  color: black;"
            "  padding-left: 4px;"
            "  padding-right: 4px;"
            "  padding-top: 20px;"
            "  padding-bottom: 8px;"
            "  border: 1px solid #6c6c6c;"
            "}"
            "th.glossy{ background-color: qlineargradient(x1:0, y1:0, x2:0, y2:1, "
            "  stop: 0 " + myColor1.name()  + ","
            "  stop: 0.1 " + myColor2.name() + ","
            "  stop: 0.5 " + myColor1.name()  + ","
            "  stop: 0.9 " + myColor2.name() + ","
            "  stop: 1 " + myColor1.name() + ");"
            "  color: black;"
            "  border: 1px solid #6c6c6c;"
            "}"
            ".overview{"
            "  font: 1.82em;"
            "  font-weight: bold;"
            "}"
            "body{"
            "  background: white;"
            "  color: black;"
            "  font-family: 'Lato', 'Ubuntu', 'Lucida Grande', 'Segoe UI', 'Arial', sans-serif;"
            "  width: 100%;"
            "}"
            "h1{  background-color: #F6F6F6;"
            "  color: #589632; " // from http://qgis.org/en/site/getinvolved/styleguide.html
            "  font-size: x-large;  "
            "  font-weight: normal;"
            "  background: none;"
            "  padding: 0.75em 0 0;"
            "  margin: 0;"
            "  line-height: 3em;"
            "}"
            "h2{  background-color: #F6F6F6;"
            "  color: #589632; "  // from http://qgis.org/en/site/getinvolved/styleguide.html
            "  font-size: medium;  "
            "  font-weight: normal;"
            "  background: none;"
            "  padding: 0.75em 0 0;"
            "  margin: 0;"
            "  line-height: 1.1em;"
            "}"
            "h3{  background-color: #F6F6F6;"
            "  color: #93b023;"  // from http://qgis.org/en/site/getinvolved/styleguide.html
            "  font-weight: bold;"
            "  font-size: large;"
            "  text-align: right;"
            "  border-bottom: 5px solid #DCEB5C;"
            "}"
            "h4{  background-color: #F6F6F6;"
            "  color: #93b023;"  // from http://qgis.org/en/site/getinvolved/styleguide.html
            "  font-weight: bold;"
            "  font-size: medium;"
            "  text-align: right;"
            "}"
            "h5{    background-color: #F6F6F6;"
            "   color: #93b023;"  // from http://qgis.org/en/site/getinvolved/styleguide.html
            "   font-weight: bold;"
            "   font-size: small;"
            "   text-align: right;"
            "}"
            "a{  color: #729FCF;"
            "  font-family: arial,sans-serif;"
            "  font-size: small;"
            "}"
            "label{  background-color: #FFFFCC;"
            "  border: 1px solid black;"
            "  margin: 1px;"
            "  padding: 0px 3px; "
            "  font-size: small;"
            "}"
            ".section {"
            "  font-weight: bold;"
            "  padding-top:25px;"
            "}"
            ".list-view .highlight {"
            "  text-align: right;"
            "  border: 0px;"
            "  width: 20%;"
            "  padding-right: 15px;"
            "  padding-left: 20px;"
            "  font-weight: bold;"
            "}"
            ".tabular-view{ "
            "  border-collapse: collapse;"
            "  width: 95%;"
            "}"
            ".tabular-view th, .tabular-view td { "
            "  border:10px solid black;"
            "}"
            ".tabular-view .odd-row{"
            "  background-color: #f9f9f9;"
            "}"
            "hr {"
            "  border: 0;"
            "  height: 0;"
            "  border-top: 1px solid black;"
            "}";
  return myStyle;
}

void QgsApplication::registerOgrDrivers()
{
  if ( 0 >= OGRGetDriverCount() )
  {
    OGRRegisterAll();
  }
}

QString QgsApplication::absolutePathToRelativePath( const QString &aPath, const QString &targetPath )
{
  QString aPathUrl = aPath;
  QString tPathUrl = targetPath;
#if defined( Q_OS_WIN )
  const Qt::CaseSensitivity cs = Qt::CaseInsensitive;

  aPathUrl.replace( '\\', '/' );
  if ( aPathUrl.startsWith( "//" ) )
  {
    // keep UNC prefix
    aPathUrl = "\\\\" + aPathUrl.mid( 2 );
  }

  tPathUrl.replace( '\\', '/' );
  if ( tPathUrl.startsWith( "//" ) )
  {
    // keep UNC prefix
    tPathUrl = "\\\\" + tPathUrl.mid( 2 );
  }
#else
  const Qt::CaseSensitivity cs = Qt::CaseSensitive;
#endif

  QStringList targetElems = tPathUrl.split( '/', QString::SkipEmptyParts );
  QStringList aPathElems = aPathUrl.split( '/', QString::SkipEmptyParts );

  targetElems.removeAll( QStringLiteral( "." ) );
  aPathElems.removeAll( QStringLiteral( "." ) );

  // remove common part
  int n = 0;
  while ( !aPathElems.isEmpty() &&
          !targetElems.isEmpty() &&
          aPathElems[0].compare( targetElems[0], cs ) == 0 )
  {
    aPathElems.removeFirst();
    targetElems.removeFirst();
    n++;
  }

  if ( n == 0 )
  {
    // no common parts; might not even be a file
    return aPathUrl;
  }

  if ( !targetElems.isEmpty() )
  {
    // go up to the common directory
    for ( int i = 0; i < targetElems.size(); i++ )
    {
      aPathElems.insert( 0, QStringLiteral( ".." ) );
    }
  }
  else
  {
    // let it start with . nevertheless,
    // so relative path always start with either ./ or ../
    aPathElems.insert( 0, QStringLiteral( "." ) );
  }

  return aPathElems.join( QStringLiteral( "/" ) );
}

QString QgsApplication::relativePathToAbsolutePath( const QString &rpath, const QString &targetPath )
{
  // relative path should always start with ./ or ../
  if ( !rpath.startsWith( QLatin1String( "./" ) ) && !rpath.startsWith( QLatin1String( "../" ) ) )
  {
    return rpath;
  }

  QString rPathUrl = rpath;
  QString targetPathUrl = targetPath;

#if defined(Q_OS_WIN)
  rPathUrl.replace( '\\', '/' );
  targetPathUrl.replace( '\\', '/' );

  bool uncPath = targetPathUrl.startsWith( "//" );
#endif

  QStringList srcElems = rPathUrl.split( '/', QString::SkipEmptyParts );
  QStringList targetElems = targetPathUrl.split( '/', QString::SkipEmptyParts );

#if defined(Q_OS_WIN)
  if ( uncPath )
  {
    targetElems.insert( 0, "" );
    targetElems.insert( 0, "" );
  }
#endif

  // append source path elements
  targetElems << srcElems;
  targetElems.removeAll( QStringLiteral( "." ) );

  // resolve ..
  int pos;
  while ( ( pos = targetElems.indexOf( QStringLiteral( ".." ) ) ) > 0 )
  {
    // remove preceding element and ..
    targetElems.removeAt( pos - 1 );
    targetElems.removeAt( pos - 1 );
  }

#if !defined(Q_OS_WIN)
  // make path absolute
  targetElems.prepend( QLatin1String( "" ) );
#endif

  return targetElems.join( QStringLiteral( "/" ) );
}

void QgsApplication::skipGdalDriver( const QString &driver )
{
  if ( ABISYM( mGdalSkipList ).contains( driver ) || driver.isEmpty() )
  {
    return;
  }
  ABISYM( mGdalSkipList ) << driver;
  applyGdalSkippedDrivers();
}

void QgsApplication::restoreGdalDriver( const QString &driver )
{
  if ( !ABISYM( mGdalSkipList ).contains( driver ) )
  {
    return;
  }
  int myPos = ABISYM( mGdalSkipList ).indexOf( driver );
  if ( myPos >= 0 )
  {
    ABISYM( mGdalSkipList ).removeAt( myPos );
  }
  applyGdalSkippedDrivers();
}

void QgsApplication::applyGdalSkippedDrivers()
{
  ABISYM( mGdalSkipList ).removeDuplicates();
  QString myDriverList = ABISYM( mGdalSkipList ).join( QStringLiteral( " " ) );
  QgsDebugMsg( "Gdal Skipped driver list set to:" );
  QgsDebugMsg( myDriverList );
  CPLSetConfigOption( "GDAL_SKIP", myDriverList.toUtf8() );
  GDALAllRegister(); //to update driver list and skip missing ones
}

bool QgsApplication::createThemeFolder()
{
  QString folder = userThemesFolder();
  QDir myDir( folder );
  if ( !myDir.exists() )
  {
    myDir.mkpath( folder );
  }

  copyPath( defaultThemesFolder(), userThemesFolder() );
  return true;
}

void QgsApplication::copyPath( const QString &src, const QString &dst )
{
  QDir dir( src );
  if ( ! dir.exists() )
    return;

  Q_FOREACH ( const QString &d, dir.entryList( QDir::Dirs | QDir::NoDotAndDotDot ) )
  {
    QString dst_path = dst + QDir::separator() + d;
    dir.mkpath( dst_path );
    copyPath( src + QDir::separator() + d, dst_path );
  }

  Q_FOREACH ( const QString &f, dir.entryList( QDir::Files ) )
  {
    QFile::copy( src + QDir::separator() + f, dst + QDir::separator() + f );
  }
}

QVariantMap QgsApplication::customVariables()
{
  //read values from QgsSettings
  QgsSettings settings;

  QVariantMap variables;

  //check if settings contains any variables
  if ( settings.contains( QStringLiteral( "/variables/values" ) ) )
  {
    QList< QVariant > customVariableVariants = settings.value( QStringLiteral( "variables/values" ) ).toList();
    QList< QVariant > customVariableNames = settings.value( QStringLiteral( "variables/names" ) ).toList();
    int variableIndex = 0;
    for ( QList< QVariant >::const_iterator it = customVariableVariants.constBegin();
          it != customVariableVariants.constEnd(); ++it )
    {
      if ( variableIndex >= customVariableNames.length() )
      {
        break;
      }

      QVariant value = ( *it );
      QString name = customVariableNames.at( variableIndex ).toString();

      variables.insert( name, value );
      variableIndex++;
    }
  }

  return variables;
}

void QgsApplication::setCustomVariables( const QVariantMap &variables )
{
  QgsSettings settings;

  QList< QVariant > customVariableValues;
  QList< QVariant > customVariableNames;

  QVariantMap::const_iterator it = variables.constBegin();
  for ( ; it != variables.constEnd(); ++it )
  {
    customVariableNames << it.key();
    customVariableValues << it.value();
  }

  settings.setValue( QStringLiteral( "variables/names" ), customVariableNames );
  settings.setValue( QStringLiteral( "variables/values" ), customVariableValues );

  emit instance()->customVariablesChanged();
}

void QgsApplication::setCustomVariable( const QString &name, const QVariant &value )
{
  // save variable to settings
  QgsSettings settings;

  QList< QVariant > customVariableVariants = settings.value( QStringLiteral( "variables/values" ) ).toList();
  QList< QVariant > customVariableNames = settings.value( QStringLiteral( "variables/names" ) ).toList();

  customVariableVariants << value;
  customVariableNames << name;

  settings.setValue( QStringLiteral( "variables/names" ), customVariableNames );
  settings.setValue( QStringLiteral( "variables/values" ), customVariableVariants );

  emit instance()->customVariablesChanged();
}

QString QgsApplication::nullRepresentation()
{
  ApplicationMembers *appMembers = members();
  if ( appMembers->mNullRepresentation.isNull() )
  {
    appMembers->mNullRepresentation = QgsSettings().value( QStringLiteral( "qgis/nullValue" ), QStringLiteral( "NULL" ) ).toString();
  }
  return appMembers->mNullRepresentation;
}

void QgsApplication::setNullRepresentation( const QString &nullRepresentation )
{
  ApplicationMembers *appMembers = members();
  if ( !appMembers || appMembers->mNullRepresentation == nullRepresentation )
    return;

  appMembers->mNullRepresentation = nullRepresentation;
  QgsSettings().setValue( QStringLiteral( "qgis/nullValue" ), nullRepresentation );

  QgsApplication *app = instance();
  if ( app )
    emit app->nullRepresentationChanged();
}

QgsActionScopeRegistry *QgsApplication::actionScopeRegistry()
{
  return members()->mActionScopeRegistry;
}

bool QgsApplication::createDatabase( QString *errorMessage )
{
  // set a working directory up for gdal to write .aux.xml files into
  // for cases where the raster dir is read only to the user
  // if the env var is already set it will be used preferentially
  QString myPamPath = qgisSettingsDirPath() + QStringLiteral( "gdal_pam/" );
  QDir myDir( myPamPath );
  if ( !myDir.exists() )
  {
    myDir.mkpath( myPamPath ); //fail silently
  }

#if defined(Q_OS_WIN)
  CPLSetConfigOption( "GDAL_PAM_PROXY_DIR", myPamPath.toUtf8() );
#else
  //under other OS's we use an environment var so the user can
  //override the path if he likes
  int myChangeFlag = 0; //whether we want to force the env var to change
  setenv( "GDAL_PAM_PROXY_DIR", myPamPath.toUtf8(), myChangeFlag );
#endif

  // Check qgis.db and make private copy if necessary
  QFile qgisPrivateDbFile( QgsApplication::qgisUserDatabaseFilePath() );

  // first we look for ~/.qgis/qgis.db
  if ( !qgisPrivateDbFile.exists() )
  {
    // if it doesn't exist we copy it in from the global resources dir
    QString qgisMasterDbFileName = QgsApplication::qgisMasterDatabaseFilePath();
    QFile masterFile( qgisMasterDbFileName );

    // Must be sure there is destination directory ~/.qgis
    QDir().mkpath( QgsApplication::qgisSettingsDirPath() );

    //now copy the master file into the users .qgis dir
    bool isDbFileCopied = masterFile.copy( qgisPrivateDbFile.fileName() );

    if ( !isDbFileCopied )
    {
      if ( errorMessage )
      {
        *errorMessage = tr( "[ERROR] Can not make qgis.db private copy" );
      }
      return false;
    }
  }
  else
  {
    // migrate if necessary
    sqlite3 *db = nullptr;
    if ( sqlite3_open( QgsApplication::qgisUserDatabaseFilePath().toUtf8().constData(), &db ) != SQLITE_OK )
    {
      if ( errorMessage )
      {
        *errorMessage = tr( "Could not open qgis.db" );
      }
      return false;
    }

    char *errmsg = nullptr;
    int res = sqlite3_exec( db, "SELECT epsg FROM tbl_srs LIMIT 0", nullptr, nullptr, &errmsg );
    if ( res == SQLITE_OK )
    {
      // epsg column exists => need migration
      if ( sqlite3_exec( db,
                         "ALTER TABLE tbl_srs RENAME TO tbl_srs_bak;"
                         "CREATE TABLE tbl_srs ("
                         "srs_id INTEGER PRIMARY KEY,"
                         "description text NOT NULL,"
                         "projection_acronym text NOT NULL,"
                         "ellipsoid_acronym NOT NULL,"
                         "parameters text NOT NULL,"
                         "srid integer,"
                         "auth_name varchar,"
                         "auth_id varchar,"
                         "is_geo integer NOT NULL,"
                         "deprecated boolean);"
                         "CREATE INDEX idx_srsauthid on tbl_srs(auth_name,auth_id);"
                         "INSERT INTO tbl_srs(srs_id,description,projection_acronym,ellipsoid_acronym,parameters,srid,auth_name,auth_id,is_geo,deprecated) SELECT srs_id,description,projection_acronym,ellipsoid_acronym,parameters,srid,'','',is_geo,0 FROM tbl_srs_bak;"
                         "DROP TABLE tbl_srs_bak", nullptr, nullptr, &errmsg ) != SQLITE_OK
         )
      {
        if ( errorMessage )
        {
          *errorMessage = tr( "Migration of private qgis.db failed.\n%1" ).arg( QString::fromUtf8( errmsg ) );
        }
        sqlite3_free( errmsg );
        sqlite3_close( db );
        return false;
      }
    }
    else
    {
      sqlite3_free( errmsg );
    }

    if ( sqlite3_exec( db, "DROP VIEW vw_srs", nullptr, nullptr, &errmsg ) != SQLITE_OK )
    {
      QgsDebugMsg( QString( "vw_srs didn't exists in private qgis.db: %1" ).arg( errmsg ) );
    }

    if ( sqlite3_exec( db,
                       "CREATE VIEW vw_srs AS"
                       " SELECT"
                       " a.description AS description"
                       ",a.srs_id AS srs_id"
                       ",a.is_geo AS is_geo"
                       ",coalesce(b.name,a.projection_acronym) AS name"
                       ",a.parameters AS parameters"
                       ",a.auth_name AS auth_name"
                       ",a.auth_id AS auth_id"
                       ",a.deprecated AS deprecated"
                       " FROM tbl_srs a"
                       " LEFT OUTER JOIN tbl_projection b ON a.projection_acronym=b.acronym"
                       " ORDER BY coalesce(b.name,a.projection_acronym),a.description", nullptr, nullptr, &errmsg ) != SQLITE_OK
       )
    {
      if ( errorMessage )
      {
        *errorMessage = tr( "Update of view in private qgis.db failed.\n%1" ).arg( QString::fromUtf8( errmsg ) );
      }
      sqlite3_free( errmsg );
      sqlite3_close( db );
      return false;
    }

    sqlite3_close( db );
  }
  return true;
}

void QgsApplication::setMaxThreads( int maxThreads )
{
  QgsDebugMsg( QString( "maxThreads: %1" ).arg( maxThreads ) );

  // make sure value is between 1 and #cores, if not set to -1 (use #cores)
  // 0 could be used to disable any parallel processing
  if ( maxThreads < 1 || maxThreads > QThread::idealThreadCount() )
    maxThreads = -1;

  // save value
  ABISYM( mMaxThreads ) = maxThreads;

  // if -1 use #cores
  if ( maxThreads == -1 )
    maxThreads = QThread::idealThreadCount();

  // set max thread count in QThreadPool
  QThreadPool::globalInstance()->setMaxThreadCount( maxThreads );
  QgsDebugMsg( QString( "set QThreadPool max thread count to %1" ).arg( QThreadPool::globalInstance()->maxThreadCount() ) );
}

QgsTaskManager *QgsApplication::taskManager()
{
  return members()->mTaskManager;
}

QgsColorSchemeRegistry *QgsApplication::colorSchemeRegistry()
{
  return members()->mColorSchemeRegistry;
}

QgsPaintEffectRegistry *QgsApplication::paintEffectRegistry()
{
  return members()->mPaintEffectRegistry;
}

QgsRendererRegistry *QgsApplication::rendererRegistry()
{
  return members()->mRendererRegistry;
}

QgsRasterRendererRegistry *QgsApplication::rasterRendererRegistry()
{
  return members()->mRasterRendererRegistry;
}

QgsDataItemProviderRegistry *QgsApplication::dataItemProviderRegistry()
{
  return instance()->mDataItemProviderRegistry;
}

QgsSvgCache *QgsApplication::svgCache()
{
  return members()->mSvgCache;
}

QgsSymbolLayerRegistry *QgsApplication::symbolLayerRegistry()
{
  return members()->mSymbolLayerRegistry;
}

QgsGPSConnectionRegistry *QgsApplication::gpsConnectionRegistry()
{
  return members()->mGpsConnectionRegistry;
}

QgsPluginLayerRegistry *QgsApplication::pluginLayerRegistry()
{
  return members()->mPluginLayerRegistry;
}

QgsMessageLog *QgsApplication::messageLog()
{
  return members()->mMessageLog;
}

QgsProcessingRegistry *QgsApplication::processingRegistry()
{
  return members()->mProcessingRegistry;
}

QgsAnnotationRegistry *QgsApplication::annotationRegistry()
{
  return members()->mAnnotationRegistry;
}

QgsFieldFormatterRegistry *QgsApplication::fieldFormatterRegistry()
{
  return members()->mFieldFormatterRegistry;
}

QgsApplication::ApplicationMembers::ApplicationMembers()
{
  // don't use initializer lists or scoped pointers - as more objects are added here we
  // will need to be careful with the order of creation/destruction
  mMessageLog = new QgsMessageLog();
  mProfiler = new QgsRuntimeProfiler();
  mTaskManager = new QgsTaskManager();
  mActionScopeRegistry = new QgsActionScopeRegistry();
  mFieldFormatterRegistry = new QgsFieldFormatterRegistry();
  mSvgCache = new QgsSvgCache();
  mColorSchemeRegistry = new QgsColorSchemeRegistry();
  mColorSchemeRegistry->addDefaultSchemes();
  mPaintEffectRegistry = new QgsPaintEffectRegistry();
  mSymbolLayerRegistry = new QgsSymbolLayerRegistry();
  mRendererRegistry = new QgsRendererRegistry();
  mRasterRendererRegistry = new QgsRasterRendererRegistry();
  mGpsConnectionRegistry = new QgsGPSConnectionRegistry();
  mPluginLayerRegistry = new QgsPluginLayerRegistry();
  mProcessingRegistry = new QgsProcessingRegistry();
  mAnnotationRegistry = new QgsAnnotationRegistry();
}

QgsApplication::ApplicationMembers::~ApplicationMembers()
{
  delete mActionScopeRegistry;
  delete mAnnotationRegistry;
  delete mColorSchemeRegistry;
  delete mFieldFormatterRegistry;
  delete mGpsConnectionRegistry;
  delete mMessageLog;
  delete mPaintEffectRegistry;
  delete mPluginLayerRegistry;
  delete mProcessingRegistry;
  delete mProfiler;
  delete mRasterRendererRegistry;
  delete mRendererRegistry;
  delete mSvgCache;
  delete mSymbolLayerRegistry;
  delete mTaskManager;
}

QgsApplication::ApplicationMembers *QgsApplication::members()
{
  if ( instance() )
  {
    return instance()->mApplicationMembers;
  }
  else
  {
    static QMutex sMemberMutex( QMutex::Recursive );
    QMutexLocker lock( &sMemberMutex );
    if ( !sApplicationMembers )
      sApplicationMembers = new ApplicationMembers();
    return sApplicationMembers;
  }
}
