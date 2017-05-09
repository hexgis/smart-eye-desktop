/***************************************************************************
    qgisexpressionbuilderwidget.cpp - A generic expression string builder widget.
     --------------------------------------
    Date                 :  29-May-2011
    Copyright            : (C) 2011 by Nathan Woodrow
    Email                : woodrow.nathan at gmail dot com
 ***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#include "qgsexpressionbuilderwidget.h"
#include "qgslogger.h"
#include "qgsexpression.h"
#include "qgsmessageviewer.h"
#include "qgsapplication.h"
#include "qgspythonrunner.h"
#include "qgsgeometry.h"
#include "qgsfeature.h"
#include "qgsfeatureiterator.h"
#include "qgsvectorlayer.h"
#include "qgssettings.h"

#include <QMenu>
#include <QFile>
#include <QTextStream>
#include <QDir>
#include <QInputDialog>
#include <QComboBox>
#include <QGraphicsOpacityEffect>
#include <QPropertyAnimation>


QgsExpressionBuilderWidget::QgsExpressionBuilderWidget( QWidget *parent )
  : QWidget( parent )
  , mAutoSave( true )
  , mLayer( nullptr )
  , highlighter( nullptr )
  , mExpressionValid( false )
{
  setupUi( this );

  mValueGroupBox->hide();
  mLoadGroupBox->hide();
//  highlighter = new QgsExpressionHighlighter( txtExpressionString->document() );

  mModel = new QStandardItemModel();
  mProxyModel = new QgsExpressionItemSearchProxy();
  mProxyModel->setDynamicSortFilter( true );
  mProxyModel->setSourceModel( mModel );
  expressionTree->setModel( mProxyModel );
  expressionTree->setSortingEnabled( true );
  expressionTree->sortByColumn( 0, Qt::AscendingOrder );

  expressionTree->setContextMenuPolicy( Qt::CustomContextMenu );
  connect( this, &QgsExpressionBuilderWidget::expressionParsed, this, &QgsExpressionBuilderWidget::setExpressionState );
  connect( expressionTree, &QWidget::customContextMenuRequested, this, &QgsExpressionBuilderWidget::showContextMenu );
  connect( expressionTree->selectionModel(), &QItemSelectionModel::currentChanged,
           this, &QgsExpressionBuilderWidget::currentChanged );

  connect( btnLoadAll, &QAbstractButton::pressed, this, &QgsExpressionBuilderWidget::loadAllValues );
  connect( btnLoadSample, &QAbstractButton::pressed, this, &QgsExpressionBuilderWidget::loadSampleValues );

  Q_FOREACH ( QPushButton *button, mOperatorsGroupBox->findChildren<QPushButton *>() )
  {
    connect( button, &QAbstractButton::pressed, this, &QgsExpressionBuilderWidget::operatorButtonClicked );
  }

  txtSearchEdit->setPlaceholderText( tr( "Search" ) );

  mValuesModel = new QStringListModel();
  mProxyValues = new QSortFilterProxyModel();
  mProxyValues->setSourceModel( mValuesModel );
  mValuesListView->setModel( mProxyValues );
  txtSearchEditValues->setPlaceholderText( tr( "Search" ) );

  QgsSettings settings;
  splitter->restoreState( settings.value( QStringLiteral( "Windows/QgsExpressionBuilderWidget/splitter" ) ).toByteArray() );
  editorSplit->restoreState( settings.value( QStringLiteral( "Windows/QgsExpressionBuilderWidget/editorsplitter" ) ).toByteArray() );
  functionsplit->restoreState( settings.value( QStringLiteral( "Windows/QgsExpressionBuilderWidget/functionsplitter" ) ).toByteArray() );

  txtExpressionString->setFoldingVisible( false );

  updateFunctionTree();

  if ( QgsPythonRunner::isValid() )
  {
    QgsPythonRunner::eval( QStringLiteral( "qgis.user.expressionspath" ), mFunctionsPath );
    updateFunctionFileList( mFunctionsPath );
  }
  else
  {
    tab_2->hide();
  }

  // select the first item in the function list
  // in order to avoid a blank help widget
  QModelIndex firstItem = mProxyModel->index( 0, 0, QModelIndex() );
  expressionTree->setCurrentIndex( firstItem );

  lblAutoSave->setText( QLatin1String( "" ) );
  txtExpressionString->setWrapMode( QsciScintilla::WrapWord );
}


QgsExpressionBuilderWidget::~QgsExpressionBuilderWidget()
{
  QgsSettings settings;
  settings.setValue( QStringLiteral( "Windows/QgsExpressionBuilderWidget/splitter" ), splitter->saveState() );
  settings.setValue( QStringLiteral( "Windows/QgsExpressionBuilderWidget/editorsplitter" ), editorSplit->saveState() );
  settings.setValue( QStringLiteral( "Windows/QgsExpressionBuilderWidget/functionsplitter" ), functionsplit->saveState() );

  delete mModel;
  delete mProxyModel;
  delete mValuesModel;
  delete mProxyValues;
}

void QgsExpressionBuilderWidget::setLayer( QgsVectorLayer *layer )
{
  mLayer = layer;

  //TODO - remove existing layer scope from context

  if ( mLayer )
    mExpressionContext << QgsExpressionContextUtils::layerScope( mLayer );
}

void QgsExpressionBuilderWidget::currentChanged( const QModelIndex &index, const QModelIndex & )
{
  txtSearchEditValues->setText( QLatin1String( "" ) );

  // Get the item
  QModelIndex idx = mProxyModel->mapToSource( index );
  QgsExpressionItem *item = dynamic_cast<QgsExpressionItem *>( mModel->itemFromIndex( idx ) );
  if ( !item )
    return;

  if ( item->getItemType() == QgsExpressionItem::Field && mFieldValues.contains( item->text() ) )
  {
    const QStringList &values = mFieldValues[item->text()];
    mValuesModel->setStringList( values );
  }

  mLoadGroupBox->setVisible( item->getItemType() == QgsExpressionItem::Field && mLayer );
  mValueGroupBox->setVisible( item->getItemType() == QgsExpressionItem::Field && mLayer );

  // Show the help for the current item.
  QString help = loadFunctionHelp( item );
  txtHelpText->setText( help );
}

void QgsExpressionBuilderWidget::on_btnRun_pressed()
{
  if ( !cmbFileNames->currentItem() )
    return;

  QString file = cmbFileNames->currentItem()->text();
  saveFunctionFile( file );
  runPythonCode( txtPython->text() );
}

void QgsExpressionBuilderWidget::runPythonCode( const QString &code )
{
  if ( QgsPythonRunner::isValid() )
  {
    QString pythontext = code;
    QgsPythonRunner::run( pythontext );
  }
  updateFunctionTree();
  loadFieldNames();
  loadRecent( mRecentKey );
}

void QgsExpressionBuilderWidget::saveFunctionFile( QString fileName )
{
  QDir myDir( mFunctionsPath );
  if ( !myDir.exists() )
  {
    myDir.mkpath( mFunctionsPath );
  }

  if ( !fileName.endsWith( QLatin1String( ".py" ) ) )
  {
    fileName.append( ".py" );
  }

  fileName = mFunctionsPath + QDir::separator() + fileName;
  QFile myFile( fileName );
  if ( myFile.open( QIODevice::WriteOnly | QFile::Truncate ) )
  {
    QTextStream myFileStream( &myFile );
    myFileStream << txtPython->text() << endl;
    myFile.close();
  }
}

void QgsExpressionBuilderWidget::updateFunctionFileList( const QString &path )
{
  mFunctionsPath = path;
  QDir dir( path );
  dir.setNameFilters( QStringList() << QStringLiteral( "*.py" ) );
  QStringList files = dir.entryList( QDir::Files );
  cmbFileNames->clear();
  Q_FOREACH ( const QString &name, files )
  {
    QFileInfo info( mFunctionsPath + QDir::separator() + name );
    if ( info.baseName() == QLatin1String( "__init__" ) ) continue;
    QListWidgetItem *item = new QListWidgetItem( QgsApplication::getThemeIcon( QStringLiteral( "console/iconTabEditorConsole.png" ) ), info.baseName() );
    cmbFileNames->addItem( item );
  }
  if ( !cmbFileNames->currentItem() )
    cmbFileNames->setCurrentRow( 0 );
}

void QgsExpressionBuilderWidget::newFunctionFile( const QString &fileName )
{
  QList<QListWidgetItem *> items = cmbFileNames->findItems( fileName, Qt::MatchExactly );
  if ( !items.isEmpty() )
    return;

  QString templatetxt;
  QgsPythonRunner::eval( QStringLiteral( "qgis.user.expressions.template" ), templatetxt );
  txtPython->setText( templatetxt );
  cmbFileNames->insertItem( 0, fileName );
  cmbFileNames->setCurrentRow( 0 );
  saveFunctionFile( fileName );
}

void QgsExpressionBuilderWidget::on_btnNewFile_pressed()
{
  bool ok;
  QString text = QInputDialog::getText( this, tr( "Enter new file name" ),
                                        tr( "File name:" ), QLineEdit::Normal,
                                        QLatin1String( "" ), &ok );
  if ( ok && !text.isEmpty() )
  {
    newFunctionFile( text );
  }
}

void QgsExpressionBuilderWidget::on_cmbFileNames_currentItemChanged( QListWidgetItem *item, QListWidgetItem *lastitem )
{
  if ( lastitem )
  {
    QString filename = lastitem->text();
    saveFunctionFile( filename );
  }
  QString path = mFunctionsPath + QDir::separator() + item->text();
  loadCodeFromFile( path );
}

void QgsExpressionBuilderWidget::loadCodeFromFile( QString path )
{
  if ( !path.endsWith( QLatin1String( ".py" ) ) )
    path.append( ".py" );

  txtPython->loadScript( path );
}

void QgsExpressionBuilderWidget::loadFunctionCode( const QString &code )
{
  txtPython->setText( code );
}

void QgsExpressionBuilderWidget::on_expressionTree_doubleClicked( const QModelIndex &index )
{
  QModelIndex idx = mProxyModel->mapToSource( index );
  QgsExpressionItem *item = dynamic_cast<QgsExpressionItem *>( mModel->itemFromIndex( idx ) );
  if ( !item )
    return;

  // Don't handle the double click it we are on a header node.
  if ( item->getItemType() == QgsExpressionItem::Header )
    return;

  // Insert the expression text or replace selected text
  txtExpressionString->insertText( item->getExpressionText() );
  txtExpressionString->setFocus();
}

void QgsExpressionBuilderWidget::loadFieldNames()
{
  // TODO We should really return a error the user of the widget that
  // the there is no layer set.
  if ( !mLayer )
    return;

  loadFieldNames( mLayer->fields() );
}

void QgsExpressionBuilderWidget::loadFieldNames( const QgsFields &fields )
{
  if ( fields.isEmpty() )
    return;

  QStringList fieldNames;
  //Q_FOREACH ( const QgsField& field, fields )
  fieldNames.reserve( fields.count() );
  for ( int i = 0; i < fields.count(); ++i )
  {
    QString fieldName = fields.at( i ).name();
    fieldNames << fieldName;
    registerItem( QStringLiteral( "Fields and Values" ), fieldName, " \"" + fieldName + "\" ", QLatin1String( "" ), QgsExpressionItem::Field, false, i );
  }
//  highlighter->addFields( fieldNames );
}

void QgsExpressionBuilderWidget::loadFieldsAndValues( const QMap<QString, QStringList> &fieldValues )
{
  QgsFields fields;
  Q_FOREACH ( const QString &fieldName, fieldValues.keys() )
  {
    fields.append( QgsField( fieldName ) );
  }
  loadFieldNames( fields );
  mFieldValues = fieldValues;
}

void QgsExpressionBuilderWidget::fillFieldValues( const QString &fieldName, int countLimit )
{
  // TODO We should really return a error the user of the widget that
  // the there is no layer set.
  if ( !mLayer )
    return;

  // TODO We should thread this so that we don't hold the user up if the layer is massive.

  int fieldIndex = mLayer->fields().lookupField( fieldName );

  if ( fieldIndex < 0 )
    return;

  QList<QVariant> values;
  QStringList strValues;
  mLayer->uniqueValues( fieldIndex, values, countLimit );
  Q_FOREACH ( const QVariant &value, values )
  {
    QString strValue;
    if ( value.isNull() )
      strValue = QStringLiteral( "NULL" );
    else if ( value.type() == QVariant::Int || value.type() == QVariant::Double || value.type() == QVariant::LongLong )
      strValue = value.toString();
    else
      strValue = '\'' + value.toString().replace( '\'', QLatin1String( "''" ) ) + '\'';
    strValues.append( strValue );
  }
  mValuesModel->setStringList( strValues );
  mFieldValues[fieldName] = strValues;
}

void QgsExpressionBuilderWidget::registerItem( const QString &group,
    const QString &label,
    const QString &expressionText,
    const QString &helpText,
    QgsExpressionItem::ItemType type, bool highlightedItem, int sortOrder )
{
  QgsExpressionItem *item = new QgsExpressionItem( label, expressionText, helpText, type );
  item->setData( label, Qt::UserRole );
  item->setData( sortOrder, QgsExpressionItem::CUSTOM_SORT_ROLE );

  // Look up the group and insert the new function.
  if ( mExpressionGroups.contains( group ) )
  {
    QgsExpressionItem *groupNode = mExpressionGroups.value( group );
    groupNode->appendRow( item );
  }
  else
  {
    // If the group doesn't exist yet we make it first.
    QgsExpressionItem *newgroupNode = new QgsExpressionItem( QgsExpression::group( group ), QLatin1String( "" ), QgsExpressionItem::Header );
    newgroupNode->setData( group, Qt::UserRole );
    //Recent group should always be last group
    newgroupNode->setData( group.startsWith( QLatin1String( "Recent (" ) ) ? 2 : 1, QgsExpressionItem::CUSTOM_SORT_ROLE );
    newgroupNode->appendRow( item );
    newgroupNode->setBackground( QBrush( QColor( "#eee" ) ) );
    mModel->appendRow( newgroupNode );
    mExpressionGroups.insert( group, newgroupNode );
  }

  if ( highlightedItem )
  {
    //insert a copy as a top level item
    QgsExpressionItem *topLevelItem = new QgsExpressionItem( label, expressionText, helpText, type );
    topLevelItem->setData( label, Qt::UserRole );
    item->setData( 0, QgsExpressionItem::CUSTOM_SORT_ROLE );
    QFont font = topLevelItem->font();
    font.setBold( true );
    topLevelItem->setFont( font );
    mModel->appendRow( topLevelItem );
  }

}

bool QgsExpressionBuilderWidget::isExpressionValid()
{
  return mExpressionValid;
}

void QgsExpressionBuilderWidget::saveToRecent( const QString &collection )
{
  QgsSettings settings;
  QString location = QStringLiteral( "/expressions/recent/%1" ).arg( collection );
  QStringList expressions = settings.value( location ).toStringList();
  expressions.removeAll( this->expressionText() );

  expressions.prepend( this->expressionText() );

  while ( expressions.count() > 20 )
  {
    expressions.pop_back();
  }

  settings.setValue( location, expressions );
  this->loadRecent( collection );
}

void QgsExpressionBuilderWidget::loadRecent( const QString &collection )
{
  mRecentKey = collection;
  QString name = tr( "Recent (%1)" ).arg( collection );
  if ( mExpressionGroups.contains( name ) )
  {
    QgsExpressionItem *node = mExpressionGroups.value( name );
    node->removeRows( 0, node->rowCount() );
  }

  QgsSettings settings;
  QString location = QStringLiteral( "/expressions/recent/%1" ).arg( collection );
  QStringList expressions = settings.value( location ).toStringList();
  int i = 0;
  Q_FOREACH ( const QString &expression, expressions )
  {
    this->registerItem( name, expression, expression, expression, QgsExpressionItem::ExpressionNode, false, i );
    i++;
  }
}

void QgsExpressionBuilderWidget::updateFunctionTree()
{
  mModel->clear();
  mExpressionGroups.clear();
  // TODO Can we move this stuff to QgsExpression, like the functions?
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "+" ), QStringLiteral( " + " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "-" ), QStringLiteral( " - " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "*" ), QStringLiteral( " * " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "/" ), QStringLiteral( " / " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "%" ), QStringLiteral( " % " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "^" ), QStringLiteral( " ^ " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "=" ), QStringLiteral( " = " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "~" ), QStringLiteral( " ~ " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( ">" ), QStringLiteral( " > " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "<" ), QStringLiteral( " < " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "<>" ), QStringLiteral( " <> " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "<=" ), QStringLiteral( " <= " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( ">=" ), QStringLiteral( " >= " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "||" ), QStringLiteral( " || " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "IN" ), QStringLiteral( " IN " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "LIKE" ), QStringLiteral( " LIKE " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "ILIKE" ), QStringLiteral( " ILIKE " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "IS" ), QStringLiteral( " IS " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "OR" ), QStringLiteral( " OR " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "AND" ), QStringLiteral( " AND " ) );
  registerItem( QStringLiteral( "Operators" ), QStringLiteral( "NOT" ), QStringLiteral( " NOT " ) );

  QString casestring = QStringLiteral( "CASE WHEN condition THEN result END" );
  registerItem( QStringLiteral( "Conditionals" ), QStringLiteral( "CASE" ), casestring );

  registerItem( QStringLiteral( "Fields and Values" ), QStringLiteral( "NULL" ), QStringLiteral( "NULL" ) );

  // Load the functions from the QgsExpression class
  int count = QgsExpression::functionCount();
  for ( int i = 0; i < count; i++ )
  {
    QgsExpression::Function *func = QgsExpression::Functions()[i];
    QString name = func->name();
    if ( name.startsWith( '_' ) ) // do not display private functions
      continue;
    if ( func->isDeprecated() ) // don't show deprecated functions
      continue;
    if ( func->isContextual() )
    {
      //don't show contextual functions by default - it's up the the QgsExpressionContext
      //object to provide them if supported
      continue;
    }
    if ( func->params() != 0 )
      name += '(';
    else if ( !name.startsWith( '$' ) )
      name += QLatin1String( "()" );
    registerItemForAllGroups( func->groups(), func->name(), ' ' + name + ' ', func->helpText() );
  }

  loadExpressionContext();
}

void QgsExpressionBuilderWidget::setGeomCalculator( const QgsDistanceArea &da )
{
  mDa = da;
}

QString QgsExpressionBuilderWidget::expressionText()
{
  return txtExpressionString->text();
}

void QgsExpressionBuilderWidget::setExpressionText( const QString &expression )
{
  txtExpressionString->setText( expression );
}

void QgsExpressionBuilderWidget::setExpressionContext( const QgsExpressionContext &context )
{
  mExpressionContext = context;
  updateFunctionTree();
  loadFieldNames();
  loadRecent( mRecentKey );
}

void QgsExpressionBuilderWidget::on_txtExpressionString_textChanged()
{
  QString text = expressionText();

  // If the string is empty the expression will still "fail" although
  // we don't show the user an error as it will be confusing.
  if ( text.isEmpty() )
  {
    lblPreview->setText( QLatin1String( "" ) );
    lblPreview->setStyleSheet( QLatin1String( "" ) );
    txtExpressionString->setToolTip( QLatin1String( "" ) );
    lblPreview->setToolTip( QLatin1String( "" ) );
    emit expressionParsed( false );
    return;
  }

  QgsExpression exp( text );

  if ( mLayer )
  {
    // Only set calculator if we have layer, else use default.
    exp.setGeomCalculator( &mDa );

    if ( !mExpressionContext.feature().isValid() )
    {
      // no feature passed yet, try to get from layer
      QgsFeature f;
      mLayer->getFeatures( QgsFeatureRequest().setLimit( 1 ) ).nextFeature( f );
      mExpressionContext.setFeature( f );
    }
  }

  QVariant value = exp.evaluate( &mExpressionContext );
  if ( !exp.hasEvalError() )
  {
    lblPreview->setText( QgsExpression::formatPreviewString( value ) );
  }

  if ( exp.hasParserError() || exp.hasEvalError() )
  {
    QString tooltip = QStringLiteral( "<b>%1:</b><br>%2" ).arg( tr( "Parser Error" ), exp.parserErrorString() );
    if ( exp.hasEvalError() )
      tooltip += QStringLiteral( "<br><br><b>%1:</b><br>%2" ).arg( tr( "Eval Error" ), exp.evalErrorString() );

    lblPreview->setText( tr( "Expression is invalid <a href=""more"">(more info)</a>" ) );
    lblPreview->setStyleSheet( QStringLiteral( "color: rgba(255, 6, 10,  255);" ) );
    txtExpressionString->setToolTip( tooltip );
    lblPreview->setToolTip( tooltip );
    emit expressionParsed( false );
    return;
  }
  else
  {
    lblPreview->setStyleSheet( QLatin1String( "" ) );
    txtExpressionString->setToolTip( QLatin1String( "" ) );
    lblPreview->setToolTip( QLatin1String( "" ) );
    emit expressionParsed( true );
  }
}

void QgsExpressionBuilderWidget::loadExpressionContext()
{
  QStringList variableNames = mExpressionContext.filteredVariableNames();
  Q_FOREACH ( const QString &variable, variableNames )
  {
    registerItem( QStringLiteral( "Variables" ), variable, " @" + variable + ' ',
                  QgsExpression::variableHelpText( variable, true, mExpressionContext.variable( variable ) ),
                  QgsExpressionItem::ExpressionNode,
                  mExpressionContext.isHighlightedVariable( variable ) );
  }

  // Load the functions from the expression context
  QStringList contextFunctions = mExpressionContext.functionNames();
  Q_FOREACH ( const QString &functionName, contextFunctions )
  {
    QgsExpression::Function *func = mExpressionContext.function( functionName );
    QString name = func->name();
    if ( name.startsWith( '_' ) ) // do not display private functions
      continue;
    if ( func->params() != 0 )
      name += '(';
    registerItemForAllGroups( func->groups(), func->name(), ' ' + name + ' ', func->helpText() );
  }
}

void QgsExpressionBuilderWidget::registerItemForAllGroups( const QStringList &groups, const QString &label, const QString &expressionText, const QString &helpText, QgsExpressionItem::ItemType type, bool highlightedItem, int sortOrder )
{
  Q_FOREACH ( const QString &group, groups )
  {
    registerItem( group, label, expressionText, helpText, type, highlightedItem, sortOrder );
  }
}

void QgsExpressionBuilderWidget::showEvent( QShowEvent *e )
{
  QWidget::showEvent( e );
  txtExpressionString->setFocus();
}

void QgsExpressionBuilderWidget::on_txtSearchEdit_textChanged()
{
  mProxyModel->setFilterWildcard( txtSearchEdit->text() );
  if ( txtSearchEdit->text().isEmpty() )
  {
    expressionTree->collapseAll();
  }
  else
  {
    expressionTree->expandAll();
    QModelIndex index = mProxyModel->index( 0, 0 );
    if ( mProxyModel->hasChildren( index ) )
    {
      QModelIndex child = mProxyModel->index( 0, 0, index );
      expressionTree->selectionModel()->setCurrentIndex( child, QItemSelectionModel::ClearAndSelect );
    }
  }
}

void QgsExpressionBuilderWidget::on_txtSearchEditValues_textChanged()
{
  mProxyValues->setFilterCaseSensitivity( Qt::CaseInsensitive );
  mProxyValues->setFilterWildcard( txtSearchEditValues->text() );
}

void QgsExpressionBuilderWidget::on_lblPreview_linkActivated( const QString &link )
{
  Q_UNUSED( link );
  QgsMessageViewer *mv = new QgsMessageViewer( this );
  mv->setWindowTitle( tr( "More info on expression error" ) );
  mv->setMessageAsHtml( txtExpressionString->toolTip() );
  mv->exec();
}

void QgsExpressionBuilderWidget::on_mValuesListView_doubleClicked( const QModelIndex &index )
{
  // Insert the item text or replace selected text
  txtExpressionString->insertText( ' ' + index.data( Qt::DisplayRole ).toString() + ' ' );
  txtExpressionString->setFocus();
}

void QgsExpressionBuilderWidget::operatorButtonClicked()
{
  QPushButton *button = dynamic_cast<QPushButton *>( sender() );

  // Insert the button text or replace selected text
  txtExpressionString->insertText( ' ' + button->text() + ' ' );
  txtExpressionString->setFocus();
}

void QgsExpressionBuilderWidget::showContextMenu( QPoint pt )
{
  QModelIndex idx = expressionTree->indexAt( pt );
  idx = mProxyModel->mapToSource( idx );
  QgsExpressionItem *item = dynamic_cast<QgsExpressionItem *>( mModel->itemFromIndex( idx ) );
  if ( !item )
    return;

  if ( item->getItemType() == QgsExpressionItem::Field && mLayer )
  {
    QMenu *menu = new QMenu( this );
    menu->addAction( tr( "Load top 10 unique values" ), this, SLOT( loadSampleValues() ) );
    menu->addAction( tr( "Load all unique values" ), this, SLOT( loadAllValues() ) );
    menu->popup( expressionTree->mapToGlobal( pt ) );
  }
}

void QgsExpressionBuilderWidget::loadSampleValues()
{
  QModelIndex idx = mProxyModel->mapToSource( expressionTree->currentIndex() );
  QgsExpressionItem *item = dynamic_cast<QgsExpressionItem *>( mModel->itemFromIndex( idx ) );
  // TODO We should really return a error the user of the widget that
  // the there is no layer set.
  if ( !mLayer || !item )
    return;

  mValueGroupBox->show();
  fillFieldValues( item->text(), 10 );
}

void QgsExpressionBuilderWidget::loadAllValues()
{
  QModelIndex idx = mProxyModel->mapToSource( expressionTree->currentIndex() );
  QgsExpressionItem *item = dynamic_cast<QgsExpressionItem *>( mModel->itemFromIndex( idx ) );
  // TODO We should really return a error the user of the widget that
  // the there is no layer set.
  if ( !mLayer || !item )
    return;

  mValueGroupBox->show();
  fillFieldValues( item->text(), -1 );
}

void QgsExpressionBuilderWidget::on_txtPython_textChanged()
{
  lblAutoSave->setText( QStringLiteral( "Saving..." ) );
  if ( mAutoSave )
  {
    autosave();
  }
}

void QgsExpressionBuilderWidget::autosave()
{
  // Don't auto save if not on function editor that would be silly.
  if ( tabWidget->currentIndex() != 1 )
    return;

  QListWidgetItem *item = cmbFileNames->currentItem();
  if ( !item )
    return;

  QString file = item->text();
  saveFunctionFile( file );
  lblAutoSave->setText( QStringLiteral( "Saved" ) );
  QGraphicsOpacityEffect *effect = new QGraphicsOpacityEffect();
  lblAutoSave->setGraphicsEffect( effect );
  QPropertyAnimation *anim = new QPropertyAnimation( effect, "opacity" );
  anim->setDuration( 2000 );
  anim->setStartValue( 1.0 );
  anim->setEndValue( 0.0 );
  anim->setEasingCurve( QEasingCurve::OutQuad );
  anim->start( QAbstractAnimation::DeleteWhenStopped );
}

void QgsExpressionBuilderWidget::setExpressionState( bool state )
{
  mExpressionValid = state;
}

QString QgsExpressionBuilderWidget::helpStylesheet() const
{
  //start with default QGIS report style
  QString style = QgsApplication::reportStyleSheet();

  //add some tweaks
  style += " .functionname {color: #0a6099; font-weight: bold;} "
           " .argument {font-family: monospace; color: #bf0c0c; font-style: italic; } "
           " td.argument { padding-right: 10px; }";

  return style;
}

QString QgsExpressionBuilderWidget::loadFunctionHelp( QgsExpressionItem *expressionItem )
{
  if ( !expressionItem )
    return QLatin1String( "" );

  QString helpContents = expressionItem->getHelpText();

  // Return the function help that is set for the function if there is one.
  if ( helpContents.isEmpty() )
  {
    QString name = expressionItem->data( Qt::UserRole ).toString();

    if ( expressionItem->getItemType() == QgsExpressionItem::Field )
      helpContents = QgsExpression::helpText( QStringLiteral( "Field" ) );
    else
      helpContents = QgsExpression::helpText( name );
  }

  return "<head><style>" + helpStylesheet() + "</style></head><body>" + helpContents + "</body>";
}





QgsExpressionItemSearchProxy::QgsExpressionItemSearchProxy()
{
  setFilterCaseSensitivity( Qt::CaseInsensitive );
}

bool QgsExpressionItemSearchProxy::filterAcceptsRow( int source_row, const QModelIndex &source_parent ) const
{
  QModelIndex index = sourceModel()->index( source_row, 0, source_parent );
  QgsExpressionItem::ItemType itemType = QgsExpressionItem::ItemType( sourceModel()->data( index, QgsExpressionItem::ITEM_TYPE_ROLE ).toInt() );

  int count = sourceModel()->rowCount( index );
  bool matchchild = false;
  for ( int i = 0; i < count; ++i )
  {
    if ( filterAcceptsRow( i, index ) )
    {
      matchchild = true;
      break;
    }
  }

  if ( itemType == QgsExpressionItem::Header && matchchild )
    return true;

  if ( itemType == QgsExpressionItem::Header )
    return false;

  return QSortFilterProxyModel::filterAcceptsRow( source_row, source_parent );
}

bool QgsExpressionItemSearchProxy::lessThan( const QModelIndex &left, const QModelIndex &right ) const
{
  int leftSort = sourceModel()->data( left, QgsExpressionItem::CUSTOM_SORT_ROLE ).toInt();
  int rightSort = sourceModel()->data( right,  QgsExpressionItem::CUSTOM_SORT_ROLE ).toInt();
  if ( leftSort != rightSort )
    return leftSort < rightSort;

  QString leftString = sourceModel()->data( left, Qt::DisplayRole ).toString();
  QString rightString = sourceModel()->data( right, Qt::DisplayRole ).toString();

  //ignore $ prefixes when sorting
  if ( leftString.startsWith( '$' ) )
    leftString = leftString.mid( 1 );
  if ( rightString.startsWith( '$' ) )
    rightString = rightString.mid( 1 );

  return QString::localeAwareCompare( leftString, rightString ) < 0;
}
