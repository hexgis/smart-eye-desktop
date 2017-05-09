/***************************************************************************
                         qgssinglebandpseudocolorrendererwidget.h
                         ----------------------------------------
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

#ifndef QGSSINGLEBANDCOLORRENDERERWIDGET_H
#define QGSSINGLEBANDCOLORRENDERERWIDGET_H

#include "qgsrasterrendererwidget.h"
#include "qgscolorrampshader.h"
#include "qgsrasterrenderer.h"
#include "ui_qgssinglebandpseudocolorrendererwidgetbase.h"
#include "qgis_gui.h"

class QgsRasterMinMaxWidget;

/** \ingroup gui
 * \class QgsSingleBandPseudoColorRendererWidget
 */
class GUI_EXPORT QgsSingleBandPseudoColorRendererWidget: public QgsRasterRendererWidget,
  private Ui::QgsSingleBandPseudoColorRendererWidgetBase
{

    Q_OBJECT

  public:

    QgsSingleBandPseudoColorRendererWidget( QgsRasterLayer *layer, const QgsRectangle &extent = QgsRectangle() );

    static QgsRasterRendererWidget *create( QgsRasterLayer *layer, const QgsRectangle &extent ) { return new QgsSingleBandPseudoColorRendererWidget( layer, extent ); }
    QgsRasterRenderer *renderer() override;
    void setMapCanvas( QgsMapCanvas *canvas ) override;
    void doComputations() override;
    QgsRasterMinMaxWidget *minMaxWidget() override { return mMinMaxWidget; }

    void setFromRenderer( const QgsRasterRenderer *r );

  public slots:

    /** Executes the single band pseudo raster classficiation
     */
    void classify();
    //! called when new min/max values are loaded
    void loadMinMax( int bandNo, double min, double max );

  private:

    enum Column
    {
      ValueColumn = 0,
      ColorColumn = 1,
      LabelColumn = 2,
    };

    void populateColormapTreeWidget( const QList<QgsColorRampShader::ColorRampItem> &colorRampItems );

    /** Generate labels from the values in the color map.
     *  Skip labels which were manually edited (black text).
     *  Text of generated labels is made gray
     */
    void autoLabel();

    //! Extract the unit out of the current labels and set the unit field.
    void setUnitFromLabels();

    QMenu *contextMenu = nullptr;

  private slots:

    void applyColorRamp();
    void on_mAddEntryButton_clicked();
    void on_mDeleteEntryButton_clicked();
    void on_mLoadFromBandButton_clicked();
    void on_mLoadFromFileButton_clicked();
    void on_mExportToFileButton_clicked();
    void on_mUnitLineEdit_textEdited( const QString &text ) { Q_UNUSED( text ); autoLabel(); }
    void on_mColormapTreeWidget_itemDoubleClicked( QTreeWidgetItem *item, int column );
    void mColormapTreeWidget_itemEdited( QTreeWidgetItem *item, int column );
    void bandChanged();
    void on_mColorInterpolationComboBox_currentIndexChanged( int index );
    void on_mMinLineEdit_textChanged( const QString & ) { resetClassifyButton(); }
    void on_mMaxLineEdit_textChanged( const QString & ) { resetClassifyButton(); }
    void on_mMinLineEdit_textEdited( const QString &text ) ;
    void on_mMaxLineEdit_textEdited( const QString &text ) ;
    void on_mClassificationModeComboBox_currentIndexChanged( int index );
    void changeColor();
    void changeOpacity();

  private:

    void setLineEditValue( QLineEdit *lineEdit, double value );
    double lineEditValue( const QLineEdit *lineEdit ) const;
    void resetClassifyButton();
    QgsRasterMinMaxWidget *mMinMaxWidget = nullptr;
    bool mDisableMinMaxWidgetRefresh;
    int mMinMaxOrigin;

    void minMaxModified();
};


#endif // QGSSINGLEBANDCOLORRENDERERWIDGET_H
