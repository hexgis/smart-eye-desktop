# Install script for directory: /home/danilo/dev/cpp/QGIS/src/analysis

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/qgis" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/src/analysis/raster/qgsalignraster.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/raster/qgsaspectfilter.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/raster/qgsderivativefilter.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/raster/qgshillshadefilter.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/raster/qgskde.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/raster/qgsninecellfilter.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/raster/qgsrastercalculator.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/raster/qgsrelief.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/raster/qgsruggednessfilter.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/raster/qgsslopefilter.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/raster/qgsrastermatrix.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/raster/qgsrastercalcnode.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/raster/qgstotalcurvaturefilter.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/vector/qgsgeometryanalyzer.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/vector/qgszonalstatistics.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/vector/qgsoverlayanalyzer.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/qgsinterpolator.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/qgsgridfilewriter.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/qgsidwinterpolator.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/qgstininterpolator.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/Bezier3D.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/ParametricLine.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/CloughTocherInterpolator.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/TriangleInterpolator.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/Point3D.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/Vector3D.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/DualEdgeTriangulation.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/Node.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/TriDecorator.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/Triangulation.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/HalfEdge.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/LinTriangleInterpolator.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/NormVecDecorator.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/interpolation/Line3D.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/openstreetmap/qgsosmbase.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/openstreetmap/qgsosmdatabase.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/openstreetmap/qgsosmdownload.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/openstreetmap/qgsosmimport.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/network/qgsgraph.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/network/qgsgraphbuilderinterface.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/network/qgsgraphbuilder.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/network/qgsnetworkstrategy.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/network/qgsnetworkspeedstrategy.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/network/qgsnetworkdistancestrategy.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/network/qgsgraphdirector.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/network/qgsvectorlayerdirector.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/network/qgsgraphanalyzer.h"
    "/home/danilo/dev/cpp/QGIS/src/analysis/qgis_analysis.h"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libqgis_analysis.so.2.99.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libqgis_analysis.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/danilo/dev/cpp/QGIS/output/lib/libqgis_analysis.so.2.99.0"
    "/home/danilo/dev/cpp/QGIS/output/lib/libqgis_analysis.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libqgis_analysis.so.2.99.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libqgis_analysis.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/danilo/dev/cpp/QGIS/src/core:/home/danilo/dev/cpp/QGIS/src/gui:/home/danilo/dev/cpp/QGIS/output/lib:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

