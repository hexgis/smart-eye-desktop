# Install script for directory: /home/danilo/dev/cpp/QGIS/python/qsci_apis

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/qsci_apis" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/qsci_apis/pyqgis.pap"
    "/home/danilo/dev/cpp/QGIS/python/qsci_apis/OSGeo_GDAL-OGR-1.10.0.api"
    "/home/danilo/dev/cpp/QGIS/python/qsci_apis/OSGeo_GDAL-OGR-1.9.1.api"
    "/home/danilo/dev/cpp/QGIS/python/qsci_apis/OSGeo_GEOS-3.4.2.api"
    "/home/danilo/dev/cpp/QGIS/python/qsci_apis/PyQGIS-1.7.api"
    "/home/danilo/dev/cpp/QGIS/python/qsci_apis/PyQGIS-1.8.api"
    "/home/danilo/dev/cpp/QGIS/python/qsci_apis/PyQGIS-2.0.api"
    "/home/danilo/dev/cpp/QGIS/python/qsci_apis/PyQGIS-2.2.api"
    "/home/danilo/dev/cpp/QGIS/python/qsci_apis/PyQt4-4.7.4.api"
    "/home/danilo/dev/cpp/QGIS/python/qsci_apis/Python-2.5.api"
    "/home/danilo/dev/cpp/QGIS/python/qsci_apis/Python-2.6.api"
    "/home/danilo/dev/cpp/QGIS/python/qsci_apis/Python-2.7.api"
    "/home/danilo/dev/cpp/QGIS/python/qsci_apis/QScintilla2-2.4.5.api"
    "/home/danilo/dev/cpp/QGIS/python/qsci_apis/QScintilla2-2.7.2.api"
    )
endif()

