# Install script for directory: /home/danilo/dev/cpp/QGIS/python/plugins/processing/gui

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/processing/gui" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/AlgorithmDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/AlgorithmDialogBase.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/AlgorithmExecutor.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/AutofillDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/BatchAlgorithmDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/BatchInputSelectionPanel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/BatchOutputSelectionPanel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/BatchPanel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/ConfigDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/ContextAction.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/CreateNewScriptAction.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/DeleteScriptAction.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/DirectorySelectorDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/EditRenderingStylesDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/EditScriptAction.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/ExtentSelectionPanel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/FileSelectionPanel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/FixedTableDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/FixedTablePanel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/GetScriptsAndModels.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/Help2Html.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/HelpEditionDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/HistoryDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/ListMultiselectWidget.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/MessageBarProgress.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/MessageDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/MultipleFileInputDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/MultipleInputDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/MultipleInputPanel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/NumberInputPanel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/OutputSelectionPanel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/ParametersPanel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/PointMapTool.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/PointSelectionPanel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/PostgisTableSelector.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/Postprocessing.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/ProcessingToolbox.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/ProviderActions.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/RangePanel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/RectangleMapTool.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/RenderingStyleFilePanel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/RenderingStyles.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/ResultsDock.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/ScriptEdit.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/ScriptEditorDialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/TestTools.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/ToolboxAction.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/__init__.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/menus.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/wrappers.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/wrappers_postgis.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/CMakeLists.txt"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/gui/algnames.txt"
    )
endif()

