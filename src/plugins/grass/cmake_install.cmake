# Install script for directory: /home/danilo/dev/cpp/QGIS/src/plugins/grass

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/grass" TYPE FILE FILES "/home/danilo/dev/cpp/QGIS/src/plugins/grass/locations.gml")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/grass/modules" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/src/plugins/grass/themes/default/grass_arrow.svg"
    "/home/danilo/dev/cpp/QGIS/src/plugins/grass/themes/default/grass_plus.svg"
    "/home/danilo/dev/cpp/QGIS/src/plugins/grass/themes/default/grass_arrow.png"
    "/home/danilo/dev/cpp/QGIS/src/plugins/grass/themes/default/grass_plus.png"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/grass/qtermwidget/kb-layouts" TYPE DIRECTORY FILES "/home/danilo/dev/cpp/QGIS/src/plugins/grass/qtermwidget/kb-layouts/" FILES_MATCHING REGEX "/[^/]*\\.keytab$")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/grass/qtermwidget/kb-layouts" TYPE DIRECTORY FILES "/home/danilo/dev/cpp/QGIS/src/plugins/grass/qtermwidget/kb-layouts/")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/grass/qtermwidget/color-schemes" TYPE DIRECTORY FILES "/home/danilo/dev/cpp/QGIS/src/plugins/grass/qtermwidget/color-schemes/" FILES_MATCHING REGEX "/[^/]*\\.[^/]*schem[^/]*$")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/danilo/dev/cpp/QGIS/src/plugins/grass/modules/cmake_install.cmake")
  include("/home/danilo/dev/cpp/QGIS/src/plugins/grass/scripts/cmake_install.cmake")
  include("/home/danilo/dev/cpp/QGIS/src/plugins/grass/7/cmake_install.cmake")

endif()

