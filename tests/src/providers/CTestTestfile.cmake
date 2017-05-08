# CMake generated Testfile for 
# Source directory: /home/danilo/dev/cpp/QGIS/tests/src/providers
# Build directory: /home/danilo/dev/cpp/QGIS/tests/src/providers
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(qgis_wcsprovidertest "/home/danilo/dev/cpp/QGIS/tests/src/providers/../../../output/bin/qgis_wcsprovidertest" "-maxwarnings" "10000")
add_test(qgis_gdalprovidertest "/home/danilo/dev/cpp/QGIS/tests/src/providers/../../../output/bin/qgis_gdalprovidertest" "-maxwarnings" "10000")
add_test(qgis_wmscapabilititestest "/home/danilo/dev/cpp/QGIS/tests/src/providers/../../../output/bin/qgis_wmscapabilititestest" "-maxwarnings" "10000")
add_test(qgis_wmsprovidertest "/home/danilo/dev/cpp/QGIS/tests/src/providers/../../../output/bin/qgis_wmsprovidertest" "-maxwarnings" "10000")
add_test(qgis_postgresprovidertest "/home/danilo/dev/cpp/QGIS/tests/src/providers/../../../output/bin/qgis_postgresprovidertest" "-maxwarnings" "10000")
add_test(qgis_postgresconntest "/home/danilo/dev/cpp/QGIS/tests/src/providers/../../../output/bin/qgis_postgresconntest" "-maxwarnings" "10000")
subdirs("grass")
