
// QGSCONFIG.H

#ifndef QGSCONFIG_H
#define QGSCONFIG_H

// Version must be specified according to
// <int>.<int>.<int>-<any text>.
// or else upgrading old project file will not work
// reliably.
#define VERSION "2.99.0-Master"

//used in vim src/core/qgis.cpp
//The way below should work but it resolves to a number like 0110 which the compiler treats as octal I think
//because debuggin it out shows the decimal number 72 which results in incorrect version status.
//As a short term fix I (Tim) am defining the version in top level cmake. It would be good to 
//reinstate this more generic approach below at some point though
//#define VERSION_INT 2990
#define VERSION_INT 29900
#define ABISYM(x) x ## 29900
//used in main.cpp and anywhere else where the release name is needed
#define RELEASE_NAME "Master"

#define QGIS_PLUGIN_SUBDIR "lib/qgis/plugins"
#define QGIS_DATA_SUBDIR "share/qgis"
#define QGIS_LIBEXEC_SUBDIR "lib/qgis"
#define QGIS_LIB_SUBDIR "lib"
#define CMAKE_INSTALL_PREFIX "/usr/local"
#define CMAKE_SOURCE_DIR "/home/danilo/dev/cpp/QGIS"

#define QGIS_SERVER_MODULE_SUBDIR "lib/qgis/server"

#define QSCINTILLA_VERSION_STR "2.9.1"

#if defined( __APPLE__ )
//used by Mac to find system or bundle resources relative to amount of bundling
#define QGIS_MACAPP_BUNDLE 
#endif

#define QT_PLUGINS_DIR "/usr/lib/x86_64-linux-gnu/qt5/plugins"
#define OSG_PLUGINS_PATH ""

/* #undef USING_NMAKE */

/* #undef USING_NINJA */

#define HAVE_POSTGRESQL

/* #undef HAVE_ORACLE */

/* #undef HAVE_OSGEARTHQT */

/* #undef SERVER_SKIP_ECW */

/* #undef HAVE_SERVER_PYTHON_PLUGINS */

/* #undef ENABLE_MODELTEST */

#endif

