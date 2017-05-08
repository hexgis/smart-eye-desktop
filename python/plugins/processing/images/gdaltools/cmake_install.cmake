# Install script for directory: /home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/processing/./images/gdaltools" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/24-to-8-bits.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/8-to-24-bits.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/contour.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/grid.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/merge.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/nearblack.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/polygonize.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/projection-add.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/projection-export.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/proximity.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/raster-clip.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/raster-info.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/raster-overview.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/rasterize.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/sieve.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/tiles.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/translate.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/vrt.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/warp.png"
    )
endif()

