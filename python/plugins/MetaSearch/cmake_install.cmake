# Install script for directory: /home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/MetaSearch/." TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/__init__.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/link_types.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/plugin.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/util.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/metadata.txt"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/LICENSE.txt"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/MetaSearch/ui" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/ui/maindialog.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/ui/manageconnectionsdialog.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/ui/newconnectiondialog.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/ui/recorddialog.ui"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/ui/xmldialog.ui"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/MetaSearch/dialogs" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/dialogs/__init__.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/dialogs/maindialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/dialogs/manageconnectionsdialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/dialogs/newconnectiondialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/dialogs/recorddialog.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/dialogs/xmldialog.py"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/MetaSearch/images" TYPE FILE FILES "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/images/MetaSearch.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/MetaSearch/resources" TYPE FILE FILES "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/resources/connections-default.xml")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/MetaSearch/resources/templates" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/resources/templates/record_metadata_dc.html"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/resources/templates/service_metadata.html"
    "/home/danilo/dev/cpp/QGIS/python/plugins/MetaSearch/resources/templates/xml_highlight.html"
    )
endif()

