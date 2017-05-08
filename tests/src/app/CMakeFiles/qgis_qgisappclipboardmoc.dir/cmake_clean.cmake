file(REMOVE_RECURSE
  "qgis_vectorlayersaveasdialogtest_automoc.cpp"
  "qgis_maptoolidentifyaction_automoc.cpp"
  "qgis_fieldcalculatortest_automoc.cpp"
  "qgis_attributetabletest_automoc.cpp"
  "qgis_maptoolselect_automoc.cpp"
  "qgis_nodetool_automoc.cpp"
  "qgis_qgisappclipboard_automoc.cpp"
  "qgis_apppythontest_automoc.cpp"
  "qgis_measuretool_automoc.cpp"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/qgis_qgisappclipboardmoc.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
