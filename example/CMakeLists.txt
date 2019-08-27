################################################################################
# Copyright (c) 2019, Induspotis, Inc.
# All rights reserved.
#
# [description]
#
# author   : hubq(hubq@induspotis.com)
# create   : 2019-08-16 02:08:34 UTC
# modified : 2019-08-16 07:06:19 UTC
################################################################################

# cmake version
cmake_minimum_required(VERSION 3.5.0)

# project
project(example)

# qt
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)
find_package(Qt5 COMPONENTS Core Widgets Gui REQUIRED)

# source
file(GLOB_RECURSE SOURCES *.cc *.c *.ui *.h)

# target
add_executable(${PROJECT_NAME} WIN32 ${SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE ../src)
target_link_libraries(${PROJECT_NAME} Qt5::Core)
target_link_libraries(${PROJECT_NAME} Qt5::Widgets)
target_link_libraries(${PROJECT_NAME} Qt5::Gui)
target_link_libraries(${PROJECT_NAME} qslidetext)
