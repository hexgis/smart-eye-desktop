/***************************************************************************
                         qgspalettedrendererwidget.cpp
                         -----------------------------
    begin                : February 2012
    copyright            : (C) 2012 by Marco Hugentobler
    email                : marco at sourcepole dot ch
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#include "qgspalettedrendererwidget.h"
#include "qgspalettedrasterrenderer.h"
#include "qgsrasterdataprovider.h"
#include "qgsrasterlayer.h"
#include "qgscolordialog.h"
#include "qgssettings.h"
#include "qgsproject.h"

#include <QColorDialog>
#include <QInputDialog>
#include <QFileDialog>
#include <QMessageBox>
#include <QMenu>

#ifdef ENABLE_MODELTEST
#include "modeltest.h"
#endif

QgsPalettedRendererWidget::QgsPalettedRendererWidget( QgsRasterLayer *layer, const QgsRectangle &extent ): QgsRasterRendererWidget( layer, extent )
{
  setupUi( this );

  mCalculatingProgressBar->hide();
  mCancelButton->hide();

  contextMenu = new QMenu( tr( "Options" ), this );
  contextMenu->addAction( tr( "Change color" ), this, SLOT( changeColor() ) );
  contextMenu->addAction( tr( "Change opacity" ), this, SLOT( changeOpacity() ) );
  contextMenu->addAction( tr( "Change label" ), this, SLOT( changeLabel() ) );

  mModel = new QgsPalettedRendererModel( this );
  mTreeView->setSortingEnabled( false );
  mTreeView->setModel( mModel );

#ifdef ENABLE_MODELTEST
  new ModelTest( mModel, this );
#endif

  mSwatchDelegate = new QgsColorSwatchDelegate( this );
  mTreeView->setItemDelegateForColumn( QgsPalettedRendererModel::ColorColumn, mSwatchDelegate );
  mTreeView->setColumnWidth( QgsPalettedRendererModel::ColorColumn, 50 );
  mTreeView->setContextMenuPolicy( Qt::CustomContextMenu );
  mTreeView->setSelectionMode( QAbstractItemView::ExtendedSelection );
  mTreeView->setDragEnabled( true );
  mTreeView->setAcceptDrops( true );
  mTreeView->setDropIndicatorShown( true );
  mTreeView->setDragDropMode( QAbstractItemView::InternalMove );
  mTreeView->setSelectionBehavior( QAbstractItemView::SelectRows );
  mTreeView->setDefaultDropAction( Qt::MoveAction );

  connect( mTreeView, &QTreeView::customContextMenuRequested,  [ = ]( const QPoint & ) { contextMenu->exec( QCursor::pos() ); }
         );

  btnColorRamp->setShowRandomColorRamp( true );

  connect( btnColorRamp, &QgsColorRampButton::colorRampChanged, this, &QgsPalettedRendererWidget::applyColorRamp );

  mBandComboBox->setLayer( mRasterLayer );

  if ( mRasterLayer )
  {
    QgsRasterDataProvider *provider = mRasterLayer->dataProvider();
    if ( !provider )
    {
      return;
    }
    setFromRenderer( mRasterLayer->renderer() );
  }

  connect( mBandComboBox, &QgsRasterBandComboBox::bandChanged, this, &QgsRasterRendererWidget::widgetChanged );
  connect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );
  connect( mDeleteEntryButton, &QPushButton::clicked, this, &QgsPalettedRendererWidget::deleteEntry );
  connect( mAddEntryButton, &QPushButton::clicked, this, &QgsPalettedRendererWidget::addEntry );
  connect( mLoadFromFileButton, &QPushButton::clicked, this, &QgsPalettedRendererWidget::loadColorTable );
  connect( mExportToFileButton, &QPushButton::clicked, this, &QgsPalettedRendererWidget::saveColorTable );
  connect( mClassifyButton, &QPushButton::clicked, this, &QgsPalettedRendererWidget::classify );
  connect( mButtonLoadFromLayer, &QPushButton::clicked, this, &QgsPalettedRendererWidget::loadFromLayer );

  QgsRasterDataProvider *provider = mRasterLayer->dataProvider();
  if ( provider )
  {
    mButtonLoadFromLayer->setEnabled( !provider->colorTable( mBandComboBox->currentBand() ).isEmpty() );
  }
  else
  {
    mButtonLoadFromLayer->setEnabled( false );
  }

  connect( QgsProject::instance(), static_cast < void ( QgsProject::* )( QgsMapLayer * ) >( &QgsProject::layerWillBeRemoved ), this, &QgsPalettedRendererWidget::layerWillBeRemoved );
  connect( mBandComboBox, &QgsRasterBandComboBox::bandChanged, this, &QgsPalettedRendererWidget::loadFromLayer );
}

QgsPalettedRendererWidget::~QgsPalettedRendererWidget()
{
  if ( mGatherer )
  {
    mGatherer->stop();
    mGatherer->wait(); // mGatherer is deleted when wait completes
  }
}

QgsRasterRenderer *QgsPalettedRendererWidget::renderer()
{
  QgsPalettedRasterRenderer::ClassData classes = mModel->classData();
  int bandNumber = mBandComboBox->currentBand();

  QgsPalettedRasterRenderer *r = new QgsPalettedRasterRenderer( mRasterLayer->dataProvider(), bandNumber, classes );
  if ( !btnColorRamp->isNull() )
  {
    r->setSourceColorRamp( btnColorRamp->colorRamp() );
  }
  return r;
}

void QgsPalettedRendererWidget::setFromRenderer( const QgsRasterRenderer *r )
{
  const QgsPalettedRasterRenderer *pr = dynamic_cast<const QgsPalettedRasterRenderer *>( r );
  if ( pr )
  {
    //read values and colors and fill into tree widget
    mModel->setClassData( pr->classes() );

    if ( pr->sourceColorRamp() )
    {
      whileBlocking( btnColorRamp )->setColorRamp( pr->sourceColorRamp() );
    }
    else
    {
      std::unique_ptr< QgsColorRamp > ramp( new QgsRandomColorRamp() );
      whileBlocking( btnColorRamp )->setColorRamp( ramp.get() );
    }
  }
  else
  {
    loadFromLayer();
    std::unique_ptr< QgsColorRamp > ramp( new QgsRandomColorRamp() );
    whileBlocking( btnColorRamp )->setColorRamp( ramp.get() );
  }
}

void QgsPalettedRendererWidget::setSelectionColor( const QItemSelection &selection, const QColor &color )
{
  // don't want to emit widgetChanged multiple times
  disconnect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );

  QModelIndex colorIndex;
  Q_FOREACH ( const QItemSelectionRange &range, selection )
  {
    Q_FOREACH ( const QModelIndex &index, range.indexes() )
    {
      colorIndex = mModel->index( index.row(), QgsPalettedRendererModel::ColorColumn );
      mModel->setData( colorIndex, color, Qt::EditRole );
    }
  }
  connect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );

  emit widgetChanged();
}

void QgsPalettedRendererWidget::deleteEntry()
{
  // don't want to emit widgetChanged multiple times
  disconnect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );

  QItemSelection sel = mTreeView->selectionModel()->selection();
  Q_FOREACH ( const QItemSelectionRange &range, sel )
  {
    if ( range.isValid() )
      mModel->removeRows( range.top(), range.bottom() - range.top() + 1, range.parent() );
  }

  connect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );

  emit widgetChanged();
}

void QgsPalettedRendererWidget::addEntry()
{
  disconnect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );

  QColor color( 150, 150, 150 );
  std::unique_ptr< QgsColorRamp > ramp( btnColorRamp->colorRamp() );
  if ( ramp )
  {
    color = ramp->color( 1.0 );
  }
  mModel->addEntry( color );
  connect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );
  emit widgetChanged();
}

void QgsPalettedRendererWidget::changeColor()
{
  QItemSelection sel = mTreeView->selectionModel()->selection();

  QModelIndex colorIndex = mModel->index( sel.first().top(), QgsPalettedRendererModel::ColorColumn );
  QColor currentColor = mModel->data( colorIndex, Qt::DisplayRole ).value<QColor>();

  QgsPanelWidget *panel = QgsPanelWidget::findParentPanel( qobject_cast< QWidget * >( parent() ) );
  if ( panel && panel->dockMode() )
  {
    QgsCompoundColorWidget *colorWidget = new QgsCompoundColorWidget( panel, currentColor, QgsCompoundColorWidget::LayoutVertical );
    colorWidget->setPanelTitle( tr( "Select color" ) );
    colorWidget->setAllowAlpha( true );
    connect( colorWidget, &QgsCompoundColorWidget::currentColorChanged, this, [ = ]( const QColor & color ) { setSelectionColor( sel, color ); } );
    panel->openPanel( colorWidget );
  }
  else
  {
    // modal dialog version... yuck
    QColor newColor = QgsColorDialog::getColor( currentColor, this, QStringLiteral( "Change color" ), true );
    if ( newColor.isValid() )
    {
      setSelectionColor( sel, newColor );
    }
  }
}

void QgsPalettedRendererWidget::changeOpacity()
{
  QItemSelection sel = mTreeView->selectionModel()->selection();

  QModelIndex colorIndex = mModel->index( sel.first().top(), QgsPalettedRendererModel::ColorColumn );
  QColor currentColor = mModel->data( colorIndex, Qt::DisplayRole ).value<QColor>();

  bool ok;
  double oldOpacity = ( currentColor.alpha() / 255.0 ) * 100.0;
  double opacity = QInputDialog::getDouble( this, tr( "Opacity" ), tr( "Change color opacity [%]" ), oldOpacity, 0.0, 100.0, 0, &ok );
  if ( ok )
  {
    int newOpacity = opacity / 100 * 255;

    // don't want to emit widgetChanged multiple times
    disconnect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );

    Q_FOREACH ( const QItemSelectionRange &range, sel )
    {
      Q_FOREACH ( const QModelIndex &index, range.indexes() )
      {
        colorIndex = mModel->index( index.row(), QgsPalettedRendererModel::ColorColumn );

        QColor newColor = mModel->data( colorIndex, Qt::DisplayRole ).value<QColor>();
        newColor.setAlpha( newOpacity );
        mModel->setData( colorIndex, newColor, Qt::EditRole );
      }
    }
    connect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );

    emit widgetChanged();
  }
}

void QgsPalettedRendererWidget::changeLabel()
{
  QItemSelection sel = mTreeView->selectionModel()->selection();

  QModelIndex labelIndex = mModel->index( sel.first().top(), QgsPalettedRendererModel::LabelColumn );
  QString currentLabel = mModel->data( labelIndex, Qt::DisplayRole ).toString();

  bool ok;
  QString newLabel = QInputDialog::getText( this, tr( "Label" ), tr( "Change label" ), QLineEdit::Normal, currentLabel, &ok );
  if ( ok )
  {
    // don't want to emit widgetChanged multiple times
    disconnect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );

    Q_FOREACH ( const QItemSelectionRange &range, sel )
    {
      Q_FOREACH ( const QModelIndex &index, range.indexes() )
      {
        labelIndex = mModel->index( index.row(), QgsPalettedRendererModel::LabelColumn );
        mModel->setData( labelIndex, newLabel, Qt::EditRole );
      }
    }
    connect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );

    emit widgetChanged();
  }
}

void QgsPalettedRendererWidget::applyColorRamp()
{
  std::unique_ptr< QgsColorRamp > ramp( btnColorRamp->colorRamp() );
  if ( !ramp )
  {
    return;
  }

  disconnect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );

  QgsPalettedRasterRenderer::ClassData data = mModel->classData();
  QgsPalettedRasterRenderer::ClassData::iterator cIt = data.begin();

  double numberOfEntries = data.count();
  int i = 0;

  if ( QgsRandomColorRamp *randomRamp = dynamic_cast<QgsRandomColorRamp *>( ramp.get() ) )
  {
    //ramp is a random colors ramp, so inform it of the total number of required colors
    //this allows the ramp to pregenerate a set of visually distinctive colors
    randomRamp->setTotalColorCount( numberOfEntries );
  }

  if ( numberOfEntries > 1 )
    numberOfEntries -= 1; //avoid duplicate first color

  for ( ; cIt != data.end(); ++cIt )
  {
    cIt->color = ramp->color( i / numberOfEntries );
    i++;
  }
  mModel->setClassData( data );

  connect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );
  emit widgetChanged();
}

void QgsPalettedRendererWidget::loadColorTable()
{
  QgsSettings settings;
  QString lastDir = settings.value( QStringLiteral( "lastColorMapDir" ), QDir::homePath() ).toString();
  QString fileName = QFileDialog::getOpenFileName( this, tr( "Open file" ), lastDir );
  if ( !fileName.isEmpty() )
  {
    QgsPalettedRasterRenderer::ClassData classes = QgsPalettedRasterRenderer::classDataFromFile( fileName );
    if ( !classes.isEmpty() )
    {
      disconnect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );
      mModel->setClassData( classes );
      emit widgetChanged();
      connect( mModel, &QgsPalettedRendererModel::classesChanged, this, &QgsPalettedRendererWidget::widgetChanged );
    }
    else
    {
      QMessageBox::critical( nullptr, tr( "Invalid file" ), tr( "Could not interpret file as a raster color table." ) );
    }
  }
}

void QgsPalettedRendererWidget::saveColorTable()
{
  QgsSettings settings;
  QString lastDir = settings.value( QStringLiteral( "lastColorMapDir" ), QDir::homePath() ).toString();
  QString fileName = QFileDialog::getSaveFileName( this, tr( "Save file" ), lastDir, tr( "Text (*.clr)" ) );
  if ( !fileName.isEmpty() )
  {
    if ( !fileName.endsWith( QLatin1String( ".clr" ), Qt::CaseInsensitive ) )
    {
      fileName = fileName + ".clr";
    }

    QFile outputFile( fileName );
    if ( outputFile.open( QFile::WriteOnly | QIODevice::Truncate ) )
    {
      QTextStream outputStream( &outputFile );
      outputStream << QgsPalettedRasterRenderer::classDataToString( mModel->classData() );
      outputStream.flush();
      outputFile.close();

      QFileInfo fileInfo( fileName );
      settings.setValue( QStringLiteral( "lastColorMapDir" ), fileInfo.absoluteDir().absolutePath() );
    }
    else
    {
      QMessageBox::warning( this, tr( "Write access denied" ), tr( "Write access denied. Adjust the file permissions and try again.\n\n" ) );
    }
  }
}

void QgsPalettedRendererWidget::classify()
{
  if ( mRasterLayer )
  {
    QgsRasterDataProvider *provider = mRasterLayer->dataProvider();
    if ( !provider )
    {
      return;
    }

    if ( mGatherer )
    {
      mGatherer->stop();
      return;
    }

    mGatherer = new QgsPalettedRendererClassGatherer( mRasterLayer, mBandComboBox->currentBand(), mModel->classData(), btnColorRamp->colorRamp() );

    connect( mGatherer, &QgsPalettedRendererClassGatherer::progressChanged, mCalculatingProgressBar, &QProgressBar::setValue );
    mCalculatingProgressBar->show();
    mCancelButton->show();
    connect( mCancelButton, &QPushButton::clicked, mGatherer, &QgsPalettedRendererClassGatherer::stop );

    connect( mGatherer, &QgsPalettedRendererClassGatherer::collectedClasses, this, &QgsPalettedRendererWidget::gatheredClasses );
    connect( mGatherer, &QgsPalettedRendererClassGatherer::finished, this, &QgsPalettedRendererWidget::gathererThreadFinished );
    mClassifyButton->setText( tr( "Calculating..." ) );
    mClassifyButton->setEnabled( false );
    mGatherer->start();
  }
}

void QgsPalettedRendererWidget::loadFromLayer()
{
  //read default palette settings from layer
  QgsRasterDataProvider *provider = mRasterLayer->dataProvider();
  if ( provider )
  {
    QList<QgsColorRampShader::ColorRampItem> table = provider->colorTable( mBandComboBox->currentBand() );
    if ( !table.isEmpty() )
    {
      QgsPalettedRasterRenderer::ClassData classes = QgsPalettedRasterRenderer::colorTableToClassData( provider->colorTable( mBandComboBox->currentBand() ) );
      mModel->setClassData( classes );
      emit widgetChanged();
    }
  }
}

void QgsPalettedRendererWidget::gatheredClasses()
{
  if ( !mGatherer || mGatherer->wasCanceled() )
    return;

  mModel->setClassData( mGatherer->classes() );
  emit widgetChanged();
}

void QgsPalettedRendererWidget::gathererThreadFinished()
{
  mGatherer->deleteLater();
  mGatherer = nullptr;
  mClassifyButton->setText( tr( "Add Unique Values" ) );
  mClassifyButton->setEnabled( true );
  mCalculatingProgressBar->hide();
  mCancelButton->hide();
}

void QgsPalettedRendererWidget::layerWillBeRemoved( QgsMapLayer *layer )
{
  if ( mGatherer && mRasterLayer == layer )
  {
    mGatherer->stop();
    mGatherer->wait();
  }
}

//
// QgsPalettedRendererModel
//

///@cond PRIVATE
QgsPalettedRendererModel::QgsPalettedRendererModel( QObject *parent )
  : QAbstractItemModel( parent )
{

}

void QgsPalettedRendererModel::setClassData( const QgsPalettedRasterRenderer::ClassData &data )
{
  beginResetModel();
  mData = data;
  endResetModel();
}

QModelIndex QgsPalettedRendererModel::index( int row, int column, const QModelIndex &parent ) const
{
  if ( column < 0 || column >= columnCount() )
  {
    //column out of bounds
    return QModelIndex();
  }

  if ( !parent.isValid() && row >= 0 && row < mData.size() )
  {
    //return an index for the item at this position
    return createIndex( row, column );
  }

  //only top level supported
  return QModelIndex();
}

QModelIndex QgsPalettedRendererModel::parent( const QModelIndex &index ) const
{
  Q_UNUSED( index );

  //all items are top level
  return QModelIndex();
}

int QgsPalettedRendererModel::columnCount( const QModelIndex &parent ) const
{
  if ( parent.isValid() )
    return 0;

  return 3;
}

int QgsPalettedRendererModel::rowCount( const QModelIndex &parent ) const
{
  if ( parent.isValid() )
    return 0;

  return mData.count();
}

QVariant QgsPalettedRendererModel::data( const QModelIndex &index, int role ) const
{
  if ( !index.isValid() )
    return QVariant();

  switch ( role )
  {
    case Qt::DisplayRole:
    case Qt::EditRole:
    {
      switch ( index.column() )
      {
        case ValueColumn:
          return mData.at( index.row() ).value;

        case ColorColumn:
          return mData.at( index.row() ).color;

        case LabelColumn:
          return mData.at( index.row() ).label;
      }
    }

    default:
      return QVariant();
  }

  return QVariant();
}

QVariant QgsPalettedRendererModel::headerData( int section, Qt::Orientation orientation, int role ) const
{
  switch ( orientation )
  {
    case Qt::Vertical:
      return QVariant();

    case Qt::Horizontal:
    {
      switch ( role )
      {
        case Qt::DisplayRole:
        {
          switch ( section )
          {
            case ValueColumn:
              return tr( "Value" );

            case ColorColumn:
              return tr( "Color" );

            case LabelColumn:
              return tr( "Label" );
          }
        }

      }
      break;
    }

    default:
      return QAbstractItemModel::headerData( section, orientation, role );
  }
  return QAbstractItemModel::headerData( section, orientation, role );
}

bool QgsPalettedRendererModel::setData( const QModelIndex &index, const QVariant &value, int )
{
  if ( !index.isValid() )
    return false;
  if ( index.row() >= mData.length() )
    return false;

  switch ( index.column() )
  {
    case ValueColumn:
    {
      bool ok = false;
      int newValue = value.toInt( &ok );
      if ( !ok )
        return false;

      mData[ index.row() ].value = newValue;
      emit dataChanged( index, index );
      emit classesChanged();
      return true;
    }

    case ColorColumn:
    {
      mData[ index.row() ].color = value.value<QColor>();
      emit dataChanged( index, index );
      emit classesChanged();
      return true;
    }

    case LabelColumn:
    {
      mData[ index.row() ].label = value.toString();
      emit dataChanged( index, index );
      emit classesChanged();
      return true;
    }
  }

  return false;
}

Qt::ItemFlags QgsPalettedRendererModel::flags( const QModelIndex &index ) const
{
  if ( !index.isValid() )
    return QAbstractItemModel::flags( index ) | Qt::ItemIsDropEnabled;

  Qt::ItemFlags f = QAbstractItemModel::flags( index );
  switch ( index.column() )
  {
    case ValueColumn:
    case LabelColumn:
    case ColorColumn:
      f = f | Qt::ItemIsEnabled | Qt::ItemIsSelectable | Qt::ItemIsEditable | Qt::ItemIsDragEnabled;
      break;
  }
  return f | Qt::ItemIsEnabled | Qt::ItemIsSelectable;;
}

bool QgsPalettedRendererModel::removeRows( int row, int count, const QModelIndex &parent )
{
  if ( row < 0 || row >= mData.count() )
    return false;
  if ( parent.isValid() )
    return false;

  for ( int i = row + count - 1; i >= row; --i )
  {
    beginRemoveRows( parent, i, i );
    mData.removeAt( i );
    endRemoveRows();
  }
  emit classesChanged();
  return true;
}

bool QgsPalettedRendererModel::insertRows( int row, int count, const QModelIndex & )
{
  QgsPalettedRasterRenderer::ClassData::const_iterator cIt = mData.constBegin();
  int currentMaxValue = -INT_MAX;
  for ( ; cIt != mData.constEnd(); ++cIt )
  {
    int value = cIt->value;
    currentMaxValue = qMax( value, currentMaxValue );
  }
  int nextValue = qMax( 0, currentMaxValue + 1 );

  beginInsertRows( QModelIndex(), row, row + count - 1 );
  for ( int i = row; i < row + count; ++i, ++nextValue )
  {
    mData.insert( i, QgsPalettedRasterRenderer::Class( nextValue, QColor( 200, 200, 200 ), QString::number( nextValue ) ) );
  }
  endInsertRows();
  emit classesChanged();
  return true;
}

Qt::DropActions QgsPalettedRendererModel::supportedDropActions() const
{
  return Qt::MoveAction;
}

QStringList QgsPalettedRendererModel::mimeTypes() const
{
  QStringList types;
  types << QStringLiteral( "application/x-qgspalettedrenderermodel" );
  return types;
}

QMimeData *QgsPalettedRendererModel::mimeData( const QModelIndexList &indexes ) const
{
  QMimeData *mimeData = new QMimeData();
  QByteArray encodedData;

  QDataStream stream( &encodedData, QIODevice::WriteOnly );

  // Create list of rows
  Q_FOREACH ( const QModelIndex &index, indexes )
  {
    if ( !index.isValid() || index.column() != 0 )
      continue;

    stream << index.row();
  }
  mimeData->setData( QStringLiteral( "application/x-qgspalettedrenderermodel" ), encodedData );
  return mimeData;
}

bool QgsPalettedRendererModel::dropMimeData( const QMimeData *data, Qt::DropAction action, int row, int column, const QModelIndex & )
{
  Q_UNUSED( column );
  if ( action != Qt::MoveAction ) return true;

  if ( !data->hasFormat( QStringLiteral( "application/x-qgspalettedrenderermodel" ) ) )
    return false;

  QByteArray encodedData = data->data( QStringLiteral( "application/x-qgspalettedrenderermodel" ) );
  QDataStream stream( &encodedData, QIODevice::ReadOnly );

  QVector<int> rows;
  while ( !stream.atEnd() )
  {
    int r;
    stream >> r;
    rows.append( r );
  }

  QgsPalettedRasterRenderer::ClassData newData;
  for ( int i = 0; i < rows.count(); ++i )
    newData << mData.at( rows.at( i ) );

  if ( row < 0 )
    row = mData.count();

  beginInsertRows( QModelIndex(), row, row + rows.count() - 1 );
  for ( int i = 0; i < rows.count(); ++i )
    mData.insert( row + i, newData.at( i ) );
  endInsertRows();
  emit classesChanged();
  return true;
}

void QgsPalettedRendererModel::addEntry( const QColor &color )
{
  insertRow( rowCount() );
  setData( index( mData.count() - 1, 1 ), color );
}

///@endcond PRIVATE

