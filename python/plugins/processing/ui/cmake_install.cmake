# Install script for directory: /home/danilo/dev/cpp/QGIS/python/plugins/processing/ui

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/processing/./ui" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/DlgAlgorithmBase.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/DlgAutofill.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/DlgConfig.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/DlgFixedTable.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/DlgGetScriptsAndModels.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/DlgHelpEdition.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/DlgHistory.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/DlgMessage.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/DlgModeler.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/DlgMultipleSelection.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/DlgNumberInput.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/DlgPostgisTableSelector.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/DlgRenderingStyles.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/DlgScriptEditor.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/ProcessingToolbox.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/resultsdockbase.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/scriptselector.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/widgetBaseSelector.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/widgetBatchPanel.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/widgetGeometryPredicateSelector.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/widgetLayerSelector.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/widgetNumberSelector.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/widgetParametersPanel.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/ui/widgetRangeSelector.ui"
    )
endif()

