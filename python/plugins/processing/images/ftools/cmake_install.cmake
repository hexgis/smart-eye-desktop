# Install script for directory: /home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/processing/./images/ftools" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/basic_statistics.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/buffer.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/centroids.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/check_geometry.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/clip.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/convex_hull.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/delaunay.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/difference.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/dissolve.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/eliminate.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/export_geometry.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/extract_nodes.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/intersect.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/join_attributes.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/join_location.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/layer_extent.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/lines_intersection.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/matrix.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/mean.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/merge_shapes.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/multi_to_single.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/neighbour.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/random_points.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/random_selection.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/regular_points.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/select_location.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/simplify.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/single_to_multi.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/split_layer.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/sub_selection.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/sum_lines.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/sum_points.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/sym_difference.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/to_lines.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/union.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/unique.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/vector_grid.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/voronoi.png"
    )
endif()

