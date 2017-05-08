IF(NOT EXISTS "/home/danilo/dev/cpp/QGIS/install_manifest.txt")
  MESSAGE(FATAL_ERROR "Cannot find install manifest: \"/home/danilo/dev/cpp/QGIS/install_manifest.txt\"")
ENDIF(NOT EXISTS "/home/danilo/dev/cpp/QGIS/install_manifest.txt")

FILE(READ "/home/danilo/dev/cpp/QGIS/install_manifest.txt" files)
STRING(REGEX REPLACE "\n" ";" files "${files}")
FOREACH(file ${files})
  MESSAGE(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
  IF(EXISTS "$ENV{DESTDIR}${file}")
    EXEC_PROGRAM(
      "/home/danilo/dev/clion-2017.1.1/bin/cmake/bin/cmake" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
      OUTPUT_VARIABLE rm_out
      RETURN_VALUE rm_retval
      )
    IF("${rm_retval}" STREQUAL 0)
    ELSE("${rm_retval}" STREQUAL 0)
      MESSAGE(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
    ENDIF("${rm_retval}" STREQUAL 0)
  ELSE(EXISTS "$ENV{DESTDIR}${file}")
    MESSAGE(STATUS "File \"$ENV{DESTDIR}${file}\" does not exist.")
  ENDIF(EXISTS "$ENV{DESTDIR}${file}")
ENDFOREACH(file)
