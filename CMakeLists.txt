################################################################################
# Copyright (c) 2019, Induspotis, Inc.
# All rights reserved.
#
# [description]
#
# author   : hubq(hubq@induspotis.com)
# create   : 2019-05-18 00:19:50 UTC
# modified : 2019-08-16 06:33:15 UTC
################################################################################

# cmake version
cmake_minimum_required(VERSION 3.5.0)

# project
project(slidetext_sln)

# output
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_HOME_DIRECTORY}/build)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_HOME_DIRECTORY}/build)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_HOME_DIRECTORY}/build)
set(CMAKE_PDB_OUTPUT_DIRECTORY     ${CMAKE_HOME_DIRECTORY}/build)

# debug
if(NOT CMAKE_DEBUG_POSTFIX)
  set(CMAKE_DEBUG_POSTFIX d)
endif()

# import scripts
include(cmake/GroupByFolder.cmake)
include(cmake/QtHelpers.cmake)

# goto source
add_subdirectory(src)
add_subdirectory(example)
