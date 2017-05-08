
SET(ENV{QGIS_PREFIX_PATH} "/home/danilo/dev/cpp/QGIS/output")
SET(ENV{LD_LIBRARY_PATH} "NOTFOUND:/home/danilo/dev/cpp/QGIS/output/lib:$ENV{LD_LIBRARY_PATH}")
SET(ENV{PYTHONPATH} "/home/danilo/dev/cpp/QGIS/output/python/:/home/danilo/dev/cpp/QGIS/output/python/plugins:/home/danilo/dev/cpp/QGIS/tests/src/python:$ENV{PYTHONPATH}")
MESSAGE("export LD_LIBRARY_PATH=$ENV{LD_LIBRARY_PATH}")

MESSAGE("export PYTHONPATH=$ENV{PYTHONPATH}")
MESSAGE(STATUS "Running /usr/bin/python3 /home/danilo/dev/cpp/QGIS/tests/src/python/test_qgspallabeling_composer.py ")
EXECUTE_PROCESS(
  COMMAND /usr/bin/python3 /home/danilo/dev/cpp/QGIS/tests/src/python/test_qgspallabeling_composer.py 
  RESULT_VARIABLE import_res
)
# Pass the output back to ctest
IF(import_res)
  MESSAGE(FATAL_ERROR "Test failed: ${import_res}")
ENDIF(import_res)
