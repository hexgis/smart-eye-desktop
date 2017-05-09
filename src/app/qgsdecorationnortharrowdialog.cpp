/***************************************************************************
 *   Copyright (C) 2003 by Tim Sutton                                      *
 *   tim@linfiniti.com                                                     *
 *                                                                         *
 *   This is a plugin generated from the QGIS plugin template              *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 ***************************************************************************/

#include "qgsdecorationnortharrowdialog.h"
#include "qgsdecorationnortharrow.h"
#include "qgslogger.h"
#include "qgshelp.h"
#include "qgssettings.h"
#include "qgssvgcache.h"

#include <QPainter>
#include <cmath>
#include <QDialogButtonBox>
#include <QPushButton>
#include <QSvgRenderer>

QgsDecorationNorthArrowDialog::QgsDecorationNorthArrowDialog( QgsDecorationNorthArrow &deco, QWidget *parent )
  : QDialog( parent )
  , mDeco( deco )
{
  setupUi( this );

  QgsSettings settings;
  restoreGeometry( settings.value( QStringLiteral( "Windows/DecorationNorthArrow/geometry" ) ).toByteArray() );

  QPushButton *applyButton = buttonBox->button( QDialogButtonBox::Apply );
  connect( applyButton, &QAbstractButton::clicked, this, &QgsDecorationNorthArrowDialog::apply );

  // signal/slot connection defined in 'designer' causes the slider to
  // be moved to reflect the change in the spinbox.
  spinAngle->setValue( mDeco.mRotationInt );

  // placement
  cboPlacement->addItem( tr( "Top left" ), QgsDecorationItem::TopLeft );
  cboPlacement->addItem( tr( "Top right" ), QgsDecorationItem::TopRight );
  cboPlacement->addItem( tr( "Bottom left" ), QgsDecorationItem::BottomLeft );
  cboPlacement->addItem( tr( "Bottom right" ), QgsDecorationItem::BottomRight );
  cboPlacement->setCurrentIndex( cboPlacement->findData( mDeco.placement() ) );
  spinHorizontal->setValue( mDeco.mMarginHorizontal );
  spinVertical->setValue( mDeco.mMarginVertical );
  wgtUnitSelection->setUnits( QgsUnitTypes::RenderUnitList() << QgsUnitTypes::RenderMillimeters << QgsUnitTypes::RenderPercentage << QgsUnitTypes::RenderPixels );
  wgtUnitSelection->setUnit( mDeco.mMarginUnit );

  // enabled
  grpEnable->setChecked( mDeco.enabled() );

  // automatic
  cboxAutomatic->setChecked( mDeco.mAutomatic );

  pbnChangeColor->setAllowAlpha( true );
  pbnChangeColor->setColor( mDeco.mColor );
  pbnChangeColor->setContext( QStringLiteral( "gui" ) );
  pbnChangeColor->setColorDialogTitle( tr( "Select north arrow fill color" ) );

  pbnChangeOutlineColor->setAllowAlpha( true );
  pbnChangeOutlineColor->setColor( mDeco.mOutlineColor );
  pbnChangeOutlineColor->setContext( QStringLiteral( "gui" ) );
  pbnChangeOutlineColor->setColorDialogTitle( tr( "Select north arrow outline color" ) );

  connect( pbnChangeColor, &QgsColorButton::colorChanged, this, [ = ]( QColor ) { drawNorthArrow(); } );
  connect( pbnChangeOutlineColor, &QgsColorButton::colorChanged, this, [ = ]( QColor ) { drawNorthArrow(); } );

  drawNorthArrow();
}

QgsDecorationNorthArrowDialog::~QgsDecorationNorthArrowDialog()
{
  QgsSettings settings;
  settings.setValue( QStringLiteral( "Windows/DecorationNorthArrow/geometry" ), saveGeometry() );
}

void QgsDecorationNorthArrowDialog::on_buttonBox_helpRequested()
{
  QgsHelp::openHelp( QStringLiteral( "introduction/general_tools.html#north-arrow" ) );
}

void QgsDecorationNorthArrowDialog::on_buttonBox_accepted()
{
  apply();
  accept();
}

void QgsDecorationNorthArrowDialog::on_buttonBox_rejected()
{
  reject();
}


void QgsDecorationNorthArrowDialog::on_spinAngle_valueChanged( int spinAngle )
{
  Q_UNUSED( spinAngle );
}

void QgsDecorationNorthArrowDialog::on_sliderRotation_valueChanged( int rotationValue )
{
  Q_UNUSED( rotationValue );

  drawNorthArrow();
}

void QgsDecorationNorthArrowDialog::apply()
{
  mDeco.mColor = pbnChangeColor->color();
  mDeco.mOutlineColor = pbnChangeOutlineColor->color();
  mDeco.mRotationInt = sliderRotation->value();
  mDeco.setPlacement( static_cast< QgsDecorationItem::Placement>( cboPlacement->currentData().toInt() ) );
  mDeco.mMarginUnit = wgtUnitSelection->unit();
  mDeco.setEnabled( grpEnable->isChecked() );
  mDeco.mAutomatic = cboxAutomatic->isChecked();
  mDeco.mMarginHorizontal = spinHorizontal->value();
  mDeco.mMarginVertical = spinVertical->value();
  mDeco.update();
}

void QgsDecorationNorthArrowDialog::drawNorthArrow()
{
  int rotation = spinAngle->value();

  QSize size( 64, 64 );
  QSvgRenderer svg;

  const QByteArray &svgContent = QgsApplication::svgCache()->svgContent( QStringLiteral( ":/images/north_arrows/default.svg" ), size.width(), pbnChangeColor->color(), pbnChangeOutlineColor->color(), 1.0, 1.0 );
  svg.load( svgContent );

  if ( svg.isValid() )
  {
    QPixmap  myPainterPixmap( size.height(), size.width() );
    myPainterPixmap.fill();

    QPainter myQPainter;
    myQPainter.begin( &myPainterPixmap );

    myQPainter.setRenderHint( QPainter::SmoothPixmapTransform );

    double centerXDouble = size.width() / 2.0;
    double centerYDouble = size.height() / 2.0;
    //save the current canvas rotation
    myQPainter.save();
    //myQPainter.translate( (int)centerXDouble, (int)centerYDouble );

    //rotate the canvas
    myQPainter.rotate( rotation );
    //work out how to shift the image so that it appears in the center of the canvas
    //(x cos a + y sin a - x, -x sin a + y cos a - y)
    const double PI = 3.14159265358979323846;
    double myRadiansDouble = ( PI / 180 ) * rotation;
    int xShift = static_cast<int>( (
                                     ( centerXDouble * cos( myRadiansDouble ) ) +
                                     ( centerYDouble * sin( myRadiansDouble ) )
                                   ) - centerXDouble );
    int yShift = static_cast<int>( (
                                     ( -centerXDouble * sin( myRadiansDouble ) ) +
                                     ( centerYDouble * cos( myRadiansDouble ) )
                                   ) - centerYDouble );

    //draw the pixmap in the proper position
    myQPainter.translate( xShift, yShift );
    svg.render( &myQPainter, QRectF( 0, 0, size.width(), size.height() ) );

    //unrotate the canvas again
    myQPainter.restore();
    myQPainter.end();

    pixmapLabel->setPixmap( myPainterPixmap );
  }
  else
  {
    QPixmap  myPainterPixmap( 200, 200 );
    myPainterPixmap.fill();
    QPainter myQPainter;
    myQPainter.begin( &myPainterPixmap );
    QFont myQFont( QStringLiteral( "time" ), 12, QFont::Bold );
    myQPainter.setFont( myQFont );
    myQPainter.setPen( Qt::red );
    myQPainter.drawText( 10, 20, tr( "Pixmap not found" ) );
    myQPainter.end();
    pixmapLabel->setPixmap( myPainterPixmap );
  }
}

//
// Called when the widget has been resized.
//

void QgsDecorationNorthArrowDialog::resizeEvent( QResizeEvent *resizeEvent )
{
  Q_UNUSED( resizeEvent );
  drawNorthArrow();
}
