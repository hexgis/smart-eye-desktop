# Install script for directory: /home/danilo/dev/cpp/QGIS/python/plugins/processing/images

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/processing/./images" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/dem.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/edithelp.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/heatmap.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/interpolation.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/iterate.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/menu.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/namespace.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/otb.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/postgis.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/runalgorithm.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/saga.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/tool.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/zonalstats.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/commander.svg"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/delete.svg"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/edit.svg"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/history.svg"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/input.svg"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/minus.svg"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/networkanalysis.svg"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/output.svg"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/plus.svg"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/ftools/cmake_install.cmake")
  include("/home/danilo/dev/cpp/QGIS/python/plugins/processing/images/gdaltools/cmake_install.cmake")

endif()

