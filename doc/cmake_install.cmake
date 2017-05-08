# Install script for directory: /home/danilo/dev/cpp/QGIS/doc

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/doc" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/doc/INSTALL"
    "/home/danilo/dev/cpp/QGIS/doc/INSTALL.html"
    "/home/danilo/dev/cpp/QGIS/doc/news"
    "/home/danilo/dev/cpp/QGIS/doc/news.html"
    "/home/danilo/dev/cpp/QGIS/doc/index.html"
    "/home/danilo/dev/cpp/QGIS/doc/news.html"
    "/home/danilo/dev/cpp/QGIS/doc/developersmap.html"
    "/home/danilo/dev/cpp/QGIS/doc/nohelp.html"
    "/home/danilo/dev/cpp/QGIS/doc/contributors.json"
    "/home/danilo/dev/cpp/QGIS/doc/favicon.ico"
    "/home/danilo/dev/cpp/QGIS/doc/style.css"
    "/home/danilo/dev/cpp/QGIS/doc/release-sponsors.html"
    "/home/danilo/dev/cpp/QGIS/doc/AUTHORS"
    "/home/danilo/dev/cpp/QGIS/doc/CONTRIBUTORS"
    "/home/danilo/dev/cpp/QGIS/doc/SPONSORS"
    "/home/danilo/dev/cpp/QGIS/doc/DONORS"
    "/home/danilo/dev/cpp/QGIS/doc/TRANSLATORS"
    "/home/danilo/dev/cpp/QGIS/doc/LICENSE"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/doc/images" TYPE FILE FILES "/home/danilo/dev/cpp/QGIS/doc/../images/icons/qgis-icon-60x60.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/doc/images/projects/thumbnails" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/035ade9287e0bae1ddf62a00a52519f028a18e7f.png.100x50_q85.jpg"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/0baa83c55c7c6194627e87ca81c9dffd4eee9ad1.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/0d5fea827c8bfc486877065e21d3e28f89788e78.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/0d8ae6aad78ca052492dff96434ddb54d5401262.png.50x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/0e2f6fb1efc89d41120cddf90509374642d400b4.png.50x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/0eb2c265017956fb6b15cb9a098f8d27928152e8.jpg.100x50_q85.jpg"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/1607f4bc4a24d0e6aabe5e8e424b93b40b83be3a.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/1789f70f1058ee18570638070439a8082b91dca8.png.100x50_q85.jpg"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/207dd8769c4926452e07e39d88716ec518ff5f3a.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/25ce8c01cf28046bac3866b5649d269138d257a4.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/35602d87c0858381e9a95a481808b27249f0f592.jpg.200x100_q85.jpg"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/44113fc21a8e2cd84d93459d0f00b3a64850095c.png.100x50_q85.jpg"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/44e7274c2c76c57d1e2338ddb55a7fb7e764b765.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/46d3e22cccef65fc941eaf0d080fcabbe29d3aff.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/5a65a575314f063d065ef84840e734e411c770f2.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/63b4e423e3ae2888b441002777aee43514e3e271.png.200x100_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/69255208cf440914eb947bf6dce5cee1c78455ba.jpg.100x50_q85.jpg"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/69f8dd7f727158ebeb6bcbdce6fef4cb313ad9f9.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/6e9c4de359ddbda8ed0b144478e7fa001e22ba63.jpg.100x50_q85.jpg"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/775de328b2774c112cc73fb5aaaee9696220649b.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/7ab30679cc486ecb9981c8c02a6d6ba1fb6ca2c7.png.100x50_q85.jpg"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/879213e1d9dd7d4e4adb87abf81c96c26c25cd36.png.100x50_q85.jpg"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/8d0653a46046e8d43a28d4ea3466633f15d17636.png.100x50_q85.jpg"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/945e5e1463ca738057fd9bae0a427519ccbfef0d.png.300x150_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/95966a3500fe4f686b531f05fcf85f59ed0dcb93.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/9d30ee055aaea7ef42b807b1b4fcd22566eef69d.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/a784c121da037ea4fdb57c0de6ce4573af6d8c6c.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/af9b8c3a4363482f12c7b2dff14659fd9ff6240c.png.100x50_q85.jpg"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/b3196a2b5781e788e6adac40ecf6964eddc4d38e.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/bba9a55eb7e288e622e7bf40ee85326c28cf09f3.jpg.100x50_q85.jpg"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/c8dbccba699fc2f34ef61b034f7b86adfd96f4c4.png.100x50_q85.jpg"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/d31441980fc90fb15735df8509527e6a1badce72.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/d5fd4af2929840586da0bd45110758c5b0a786ff.png.50x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/e24951be1e5ff2d6fd591f9760871e38a684bed0.png.100x50_q85.png"
    "/home/danilo/dev/cpp/QGIS/doc/images/projects/thumbnails/f6379f3083e612fd47917e1f948d795b6951dde9.png.200x100_q85.png"
    )
endif()

