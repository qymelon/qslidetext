################################################################################
# Copyright (c) 2018, Induspotis, Inc.
# All rights reserved.
# 
# Root cmake script entry
# 
# author   : hunt978(hubq@initialsoft.com)
# create   : 2018-05-02 09:34:07 UTC
# modified : 2018-05-02 09:34:15 UTC
################################################################################

# cmake version
cmake_minimum_required(VERSION 3.5.0)

# define the macro
MACRO(group_by_folder sources basedir)
  SET(SOURCE_GROUP_DELIMITER "/")
  SET(last_dir "")
  SET(files "")
  FOREACH(file ${${sources}})
    file(RELATIVE_PATH relative_file "${basedir}" ${file})
    GET_FILENAME_COMPONENT(dir "${relative_file}" PATH)
    IF (NOT "${dir}" STREQUAL "${last_dir}")
      IF (files)
        SOURCE_GROUP("${last_dir}" FILES ${files})
      ENDIF (files)
      SET(files "")
    ENDIF (NOT "${dir}" STREQUAL "${last_dir}")
    SET(files ${files} ${file})
    SET(last_dir "${dir}")
  ENDFOREACH(file)
  IF (files)
    SOURCE_GROUP("${last_dir}" FILES ${files})
  ENDIF (files)
ENDMACRO(group_by_folder)
