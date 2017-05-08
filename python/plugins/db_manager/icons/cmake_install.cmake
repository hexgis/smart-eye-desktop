# Install script for directory: /home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/db_manager/icons" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/sql.gif"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/about.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/dbmanager.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/layer_line.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/layer_point.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/layer_polygon.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/layer_raster.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/layer_unknown.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/namespace.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/plugged.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/table.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/unplugged.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/view.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/view_materialized.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/warning-20px.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/namespaces.xpm"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/tables.xpm"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/user.xpm"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/users.xpm"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/toolbar/action_del_table.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/toolbar/action_delete.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/toolbar/action_edit_table.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/toolbar/action_export.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/toolbar/action_import.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/toolbar/action_new_table.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/toolbar/action_refresh.png"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/icons/toolbar/action_sql_window.png"
    )
endif()

