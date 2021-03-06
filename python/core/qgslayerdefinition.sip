/**
 * @brief The QgsLayerDefinition class holds generic methods for loading/exporting QLR files.
 *
 * QLR files are an export of the layer xml including the style and datasource location.  There is no link
 * to the QLR file once loaded.  Consider the QLR file a mini project file for layers and styles.  QLR
 * files also store the layer tree info for the exported layers, including group information.
 */
class QgsLayerDefinition
{
%TypeHeaderCode
#include <qgslayerdefinition.h>
%End
  public:
    static bool loadLayerDefinition( const QString &path, QgsProject *project, QgsLayerTreeGroup *rootGroup, QString &errorMessage /Out/ );
    static bool loadLayerDefinition( QDomDocument doc, QgsProject *project, QgsLayerTreeGroup *rootGroup, QString &errorMessage /Out/, const QgsPathResolver &pathResolver );
    static bool exportLayerDefinition( QString path, const QList<QgsLayerTreeNode*> &selectedTreeNodes, QString &errorMessage /Out/ );
    static bool exportLayerDefinition( QDomDocument doc, const QList<QgsLayerTreeNode*> &selectedTreeNodes, QString &errorMessage /Out/, const QgsPathResolver &pathResolver );

    static QDomDocument exportLayerDefinitionLayers( const QList<QgsMapLayer*> &layers, const QgsPathResolver &pathResolver );
    static QList<QgsMapLayer*> loadLayerDefinitionLayers( QDomDocument &document, const QgsPathResolver &pathResolver ) /Factory/;
    static QList<QgsMapLayer*> loadLayerDefinitionLayers( const QString &qlrfile ) /Factory/;

    /**
     * Class used to work with layer dependencies stored in a XML project or layer definition file
     */
    class DependencySorter
    {
    public:
      /** Constructor
       * @param doc The XML document containing maplayer elements
       */
      DependencySorter( const QDomDocument &doc );

      /** Constructor
       * @param fileName The filename where the XML document is stored
       */
      DependencySorter( const QString &fileName );

      /** Get the layer nodes in an order where they can be loaded incrementally without dependency break */
      QVector<QDomNode> sortedLayerNodes() const;

      /** Get the layer IDs in an order where they can be loaded incrementally without dependency break */
      QStringList sortedLayerIds() const;

      /** Whether some cyclic dependency has been detected */
      bool hasCycle() const;

      /** Whether some dependency is missing */
      bool hasMissingDependency() const;
    };
};

