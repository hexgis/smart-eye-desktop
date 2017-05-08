# Install script for directory: /home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/processing/./algs/gdal" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/AssignProjection.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ClipByExtent.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ClipByMask.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ColorRelief.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/GdalAlgorithm.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/GdalAlgorithmDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/GdalAlgorithmProvider.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/GdalUtils.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/GridAverage.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/GridDataMetrics.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/GridInvDist.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/GridNearest.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/__init__.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/aspect.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/buildvrt.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/contour.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/extractprojection.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/fillnodata.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/gdal2tiles.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/gdal2xyz.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/gdaladdo.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/gdalcalc.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/gdaltindex.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/hillshade.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/information.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/merge.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/nearblack.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/offsetcurve.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ogr2ogr.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ogr2ogrbuffer.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ogr2ogrclip.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ogr2ogrclipextent.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ogr2ogrdissolve.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ogr2ogrpointsonlines.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ogr2ogrtabletopostgislist.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ogr2ogrtopostgis.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ogr2ogrtopostgislist.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ogrinfo.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ogrsql.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/onesidebuffer.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/pct2rgb.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/polygonize.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/proximity.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/rasterize.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/rasterize_over.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/retile.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/rgb2pct.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/roughness.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/sieve.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/slope.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/tpi.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/translate.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/tri.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/warp.py"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/gdal/ui/cmake_install.cmake")

endif()

