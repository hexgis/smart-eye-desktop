# CMake generated Testfile for 
# Source directory: /home/danilo/dev/cpp/QGIS/tests
# Build directory: /home/danilo/dev/cpp/QGIS/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(qgis_spelling "/home/danilo/dev/cpp/QGIS/scripts/spell_check/spell_test.sh")
subdirs("src")
subdirs("bench")
