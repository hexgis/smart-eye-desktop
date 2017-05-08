# Install script for directory: /home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_plugins/postgis

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/db_manager/db_plugins/postgis" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_plugins/postgis/__init__.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_plugins/postgis/connector.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_plugins/postgis/data_model.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_plugins/postgis/info_model.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_plugins/postgis/plugin.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_plugins/postgis/sql_dictionary.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_plugins/postgis/resources_rc.py"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/db_manager/db_plugins/postgis/icons" TYPE FILE FILES "/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_plugins/postgis/icons/postgis_elephant.png")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/danilo/dev/cpp/QGIS/python/plugins/db_manager/db_plugins/postgis/plugins/cmake_install.cmake")

endif()

