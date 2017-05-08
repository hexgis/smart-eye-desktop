# Install script for directory: /home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/processing/algs/qgis" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/AddTableField.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Aspect.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/AutoincrementalField.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/BarPlot.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/BasicStatistics.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/BasicStatisticsNumbers.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/BasicStatisticsStrings.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Boundary.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/BoundingBox.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/BoxPlot.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Buffer.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Centroids.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/CheckValidity.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Clip.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ConcaveHull.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ConvexHull.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/CreateAttributeIndex.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/CreateConstantRaster.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Datasources2Vrt.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/DefineProjection.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Delaunay.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/DeleteColumn.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/DeleteDuplicateGeometries.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/DeleteHoles.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/DensifyGeometries.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/DensifyGeometriesInterval.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Difference.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Dissolve.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/DropGeometry.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/EliminateSelection.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/EquivalentNumField.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ExecuteSQL.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Explode.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ExportGeometryInfo.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ExtendLines.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ExtentFromLayer.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ExtractByAttribute.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ExtractByExpression.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ExtractByLocation.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ExtractNodes.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ExtractSpecificNodes.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/FieldPyculator.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/FieldsCalculator.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/FieldsMapper.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/FindProjection.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/FixGeometry.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/FixedDistanceBuffer.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/GeometryByExpression.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/GeometryConvert.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/GridLine.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/GridPolygon.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Gridify.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Heatmap.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Hillshade.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/HubDistanceLines.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/HubDistancePoints.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/HubLines.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/HypsometricCurves.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/IdwInterpolation.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ImportIntoPostGIS.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ImportIntoSpatialite.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Intersection.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/JoinAttributes.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/LinesIntersection.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/LinesToPolygons.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/MeanAndStdDevPlot.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/MeanCoords.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Merge.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/MergeLines.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/MultipartToSingleparts.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/NearestNeighbourAnalysis.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/OffsetLine.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/OrientedMinimumBoundingBox.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Orthogonalize.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PointDistance.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PointOnSurface.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PointsAlongGeometry.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PointsDisplacement.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PointsFromLines.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PointsFromPolygons.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PointsInPolygon.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PointsInPolygonUnique.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PointsInPolygonWeighted.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PointsLayerFromTable.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PointsToPaths.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PolarPlot.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PoleOfInaccessibility.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PolygonCentroids.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Polygonize.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PolygonsToLines.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/PostGISExecuteSQL.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/QGISAlgorithmProvider.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RandomExtract.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RandomExtractWithinSubsets.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RandomPointsAlongLines.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RandomPointsExtent.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RandomPointsLayer.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RandomPointsPolygonsFixed.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RandomPointsPolygonsVariable.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RandomSelection.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RandomSelectionWithinSubsets.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RasterCalculator.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RasterLayerHistogram.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RasterLayerStatistics.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RectanglesOvalsDiamondsFixed.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RectanglesOvalsDiamondsVariable.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RegularPoints.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Relief.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/RemoveNullGeometry.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ReprojectLayer.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ReverseLineDirection.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Ruggedness.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SaveSelectedFeatures.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SelectByAttribute.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SelectByAttributeSum.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SelectByExpression.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SelectByLocation.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ServiceAreaFromLayer.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ServiceAreaFromPoint.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SetRasterStyle.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SetVectorStyle.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ShortestPathLayerToPoint.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ShortestPathPointToLayer.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ShortestPathPointToPoint.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SimplifyGeometries.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SinglePartsToMultiparts.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SingleSidedBuffer.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Slope.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Smooth.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SnapGeometries.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SpatialIndex.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SpatialJoin.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SpatialiteExecuteSQL.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SplitLinesWithLines.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SplitWithLines.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/StatisticsByCategories.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SumLines.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/SymmetricalDifference.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/TextToFloat.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/TinInterpolation.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/TopoColors.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Translate.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/TruncateTable.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/Union.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/UniqueValues.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/VariableDistanceBuffer.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/VectorGridLines.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/VectorGridPolygons.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/VectorLayerHistogram.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/VectorLayerScatterplot.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/VectorLayerScatterplot3D.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/VectorSplit.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/VoronoiPolygons.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ZonalStatistics.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ZonalStatisticsQgis.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/__init__.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/voronoi.py"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/processing/algs/qgis/scripts" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/scripts/Frequency_analysis.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/scripts/Keep_n_biggest_parts.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/scripts/Number_of_unique_values_in_classes.py"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/cmake_install.cmake")

endif()

