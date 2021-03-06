
class QgsMapOverviewCanvas : QWidget
{
%TypeHeaderCode
#include <qgsmapoverviewcanvas.h>
%End

  public:
    QgsMapOverviewCanvas( QWidget *parent /TransferThis/ = 0, QgsMapCanvas *mapCanvas = NULL );

    ~QgsMapOverviewCanvas();

    //! renders overview and updates panning widget
    void refresh();

    //! changes background color
    void setBackgroundColor( const QColor &color );

    //! updates layer set for overview
    void setLayers( const QList<QgsMapLayer*> &layers );

    //! Returns list of layers visible in the overview
    QList<QgsMapLayer*> layers() const;

    void enableAntiAliasing( bool flag );

    void updateFullExtent();

  public slots:

    // ### QGIS 3: make protected
    //! used for overview canvas to reflect changed extent in main map canvas
    void drawExtentRect();

    // ### QGIS 3: make protected
    //! Should be called when the canvas destination CRS is changed
    void destinationCrsChanged();

  protected slots:
    void mapRenderingFinished();
    void layerRepaintRequested();

  protected:

    //! Overridden paint event
    void paintEvent( QPaintEvent *pe );

    //! Overridden resize event
    void resizeEvent( QResizeEvent *e );

    //! Overridden mouse move event
    void mouseMoveEvent( QMouseEvent *e );

    //! Overridden mouse press event
    void mousePressEvent( QMouseEvent *e );

    //! Overridden mouse release event
    void mouseReleaseEvent( QMouseEvent *e );

    //! called when panning to reflect mouse movement
    void updatePanningWidget( QPoint pos );
};

