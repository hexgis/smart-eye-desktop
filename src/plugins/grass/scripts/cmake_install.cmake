# Install script for directory: /home/danilo/dev/cpp/QGIS/src/plugins/grass/scripts

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/grass/scripts" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE FILES
    "/home/danilo/dev/cpp/QGIS/src/plugins/grass/scripts/db.connect-login.pg.py"
    "/home/danilo/dev/cpp/QGIS/src/plugins/grass/scripts/qgis.v.kernel.rast.py"
    "/home/danilo/dev/cpp/QGIS/src/plugins/grass/scripts/qgis.v.upgrade.py"
    "/home/danilo/dev/cpp/QGIS/src/plugins/grass/scripts/r.external.all.py"
    "/home/danilo/dev/cpp/QGIS/src/plugins/grass/scripts/t.rast.what.qgis.py"
    "/home/danilo/dev/cpp/QGIS/src/plugins/grass/scripts/v.class.mlpy.qgis.py"
    "/home/danilo/dev/cpp/QGIS/src/plugins/grass/scripts/v.out.ogr.pg.py"
    )
endif()

