file(REMOVE_RECURSE
  "qgis_postgresconntest_automoc.cpp"
  "qgis_postgresprovidertest_automoc.cpp"
  "qgis_wcsprovidertest_automoc.cpp"
  "qgis_gdalprovidertest_automoc.cpp"
  "qgis_wmscapabilititestest_automoc.cpp"
  "qgis_wmsprovidertest_automoc.cpp"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/qgis_wcsprovidertestmoc.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
