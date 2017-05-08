# Install script for directory: /home/danilo/dev/cpp/QGIS/i18n

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/i18n" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_ar.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_bg.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_bs.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_ca.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_cs.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_da.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_de.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_el.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_es.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_et.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_eu.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_fi.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_fr.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_gl.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_hi.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_hr.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_hu.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_id.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_it.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_ja.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_km.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_ko.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_lt.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_lv.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_nb.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_nl.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_pl.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_pt_BR.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_pt_PT.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_ro.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_ru.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_sk.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_sl.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_sv.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_tr.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_vi.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_zh-Hans.qm"
    "/home/danilo/dev/cpp/QGIS/output/i18n/qgis_zh-Hant.qm"
    )
endif()

