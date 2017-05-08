# Install script for directory: /home/danilo/dev/cpp/QGIS/python/plugins/db_manager

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/db_manager/." TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/LICENSE"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/TODO"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/__init__.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_manager.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_manager_plugin.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_model.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_tree.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/dlg_add_geometry_column.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/dlg_create_constraint.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/dlg_create_index.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/dlg_create_table.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/dlg_db_error.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/dlg_export_vector.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/dlg_field_properties.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/dlg_import_vector.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/dlg_query_builder.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/dlg_sql_layer_window.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/dlg_sql_window.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/dlg_table_properties.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/info_viewer.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/layer_preview.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/sql_dictionary.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/sqledit.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/table_viewer.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/resources_rc.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/metadata.txt"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/db_manager/ui" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/ui_DlgAddGeometryColumn.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/ui_DlgCreateConstraint.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/ui_DlgCreateIndex.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/ui_DlgCreateTable.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/ui_DlgDbError.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/ui_DlgExportVector.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/ui_DlgFieldProperties.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/ui_DlgImportVector.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/ui_DlgQueryBuilder.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/ui_DlgSqlLayerWindow.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/ui_DlgSqlWindow.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/ui_DlgTableProperties.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/ui/__init__.py"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_plugins/cmake_install.cmake")
  include("/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/cmake_install.cmake")

endif()

