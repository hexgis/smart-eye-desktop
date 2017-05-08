# Install script for directory: /home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/python/plugins/processing/algs/grass7/ext" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/__init__.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_albedo.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_aster_toar.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_cca.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_cluster.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_colors_enhance.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_evapo_mh.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_gensig.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_gensigset.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_group.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_in_spotvgt.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_landsat_acca.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_landsat_toar.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_maxlik.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_oif.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_pansharpen.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_pca.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_rectify.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_segment.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_smap.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_tasscap.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/i_topo_corr.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_blend_combine.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_blend_rgb.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_category.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_colors.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_colors_stddev.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_drain.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_cwed.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_cwed_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_dominance.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_dominance_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_edgedensity.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_edgedensity_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_mpa.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_mpa_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_mps.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_mps_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_orig.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_padcv.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_padcv_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_padrange.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_padrange_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_padsd.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_padsd_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_patchdensity.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_patchdensity_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_patchnum.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_patchnum_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_pielou.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_pielou_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_renyi.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_renyi_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_richness.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_richness_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_shannon.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_shannon_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_shape.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_shape_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_simpson.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_li_simpson_ascii.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_mapcalc.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_mask.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_mask_rast.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_mask_vect.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_null.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_reclass.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_resamp_filter.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_rgb.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_series_interp.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_shade.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_stats_quantile_rast.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_support.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_texture.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_tile.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_topmodel.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_topmodel_topidxstats.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/r_what_color.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_build_polylines.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_distance.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_edit.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_extrude.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_in_geonames.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_in_lidar.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_lrs_create.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_lrs_segment.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_lrs_where.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_alloc.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_allpairs.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_arcs.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_articulation.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_bridge.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_components.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_connect.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_connectivity.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_distance.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_flow.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_iso.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_nodes.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_path.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_salesman.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_steiner.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_net_visibility.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_pack.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_rast_stats.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_rectify.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_to_3d.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_vect_stats.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_what_rast.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_what_rast_centroids.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_what_rast_points.py"
    "/home/danilo/dev/cpp/QGIS/python/plugins/processing/algs/grass7/ext/v_what_vect.py"
    )
endif()

