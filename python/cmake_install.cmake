# Install script for directory: /home/danilo/dev/cpp/QGIS/python

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_core.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_core.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_core.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis" TYPE MODULE FILES "/home/danilo/dev/cpp/QGIS/output/python/qgis/_core.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_core.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_core.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_core.so"
         OLD_RPATH "/home/danilo/dev/cpp/QGIS/src/core:/home/danilo/dev/cpp/QGIS/src/gui:/home/danilo/dev/cpp/QGIS/output/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_core.so")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_gui.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_gui.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_gui.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis" TYPE MODULE FILES "/home/danilo/dev/cpp/QGIS/output/python/qgis/_gui.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_gui.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_gui.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_gui.so"
         OLD_RPATH "/home/danilo/dev/cpp/QGIS/src/core:/home/danilo/dev/cpp/QGIS/src/gui:/home/danilo/dev/cpp/QGIS/output/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_gui.so")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_analysis.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_analysis.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_analysis.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis" TYPE MODULE FILES "/home/danilo/dev/cpp/QGIS/output/python/qgis/_analysis.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_analysis.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_analysis.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_analysis.so"
         OLD_RPATH "/home/danilo/dev/cpp/QGIS/src/core:/home/danilo/dev/cpp/QGIS/src/gui:/home/danilo/dev/cpp/QGIS/output/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/_analysis.so")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/qsci_apis" TYPE FILE FILES "/home/danilo/dev/cpp/QGIS/python/qsci_apis/PyQGIS.api")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/__init__.py"
    "/home/danilo/dev/cpp/QGIS/python/utils.py"
    "/home/danilo/dev/cpp/QGIS/python/user.py"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/core" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/core/__init__.py"
    "/home/danilo/dev/cpp/QGIS/python/core/contextmanagers.py"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/gui" TYPE FILE FILES "/home/danilo/dev/cpp/QGIS/python/gui/__init__.py")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/qgis/analysis" TYPE FILE FILES "/home/danilo/dev/cpp/QGIS/python/analysis/__init__.py")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/danilo/dev/cpp/QGIS/python/plugins/cmake_install.cmake")
  include("/home/danilo/dev/cpp/QGIS/python/qsci_apis/cmake_install.cmake")
  include("/home/danilo/dev/cpp/QGIS/python/console/cmake_install.cmake")
  include("/home/danilo/dev/cpp/QGIS/python/PyQt/cmake_install.cmake")
  include("/home/danilo/dev/cpp/QGIS/python/pyplugin_installer/cmake_install.cmake")
  include("/home/danilo/dev/cpp/QGIS/python/ext-libs/cmake_install.cmake")
  include("/home/danilo/dev/cpp/QGIS/python/testing/cmake_install.cmake")

endif()

