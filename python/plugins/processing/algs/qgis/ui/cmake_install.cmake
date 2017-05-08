# Install script for directory: /home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/processing/./algs/qgis/ui" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/FieldsCalculatorDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/FieldsMappingPanel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/HeatmapWidgets.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/InterpolationDataWidget.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/RasterCalculatorWidgets.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/ReliefColorsWidget.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/__init__.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/AddNewExpressionDialog.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/DlgFieldsCalculator.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/ExpressionWidget.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/PredefinedExpressionDialog.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/RasterResolutionWidget.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/interpolationdatawidgetbase.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/reliefcolorswidgetbase.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/qgis/ui/widgetFieldsMapping.ui"
    )
endif()

