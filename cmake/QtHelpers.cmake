################################################################################
# Copyright (c) 2018, Induspotis, Inc.
# All rights reserved.
#
# Root cmake script entry
#
# author   : hunt978(hubq@initialsoft.com)
# create   : 2018-05-02 09:34:07 UTC
# modified : 2019-08-16 06:16:23 UTC
################################################################################

# cmake version
cmake_minimum_required(VERSION 3.5.0)

# find qt libs
find_package(Qt5 COMPONENTS Core REQUIRED)

# root direcotry
set(Qt5RootDir ${Qt5_DIR})
get_filename_component(Qt5RootDir ${Qt5RootDir} DIRECTORY)
get_filename_component(Qt5RootDir ${Qt5RootDir} DIRECTORY)
get_filename_component(Qt5RootDir ${Qt5RootDir} DIRECTORY)

# platform & version
get_filename_component(Qt5Platform ${Qt5RootDir} NAME)
get_filename_component(Qt5Version ${Qt5RootDir} DIRECTORY)
get_filename_component(Qt5Version ${Qt5Version} NAME)

# directories
set(Qt5BinDir ${Qt5RootDir}/bin)
set(Qt5DocDir ${Qt5RootDir}/doc)
set(Qt5IncludeDir ${Qt5RootDir}/include)
set(Qt5LibDir ${Qt5RootDir}/lib)
set(Qt5PluginsDir ${Qt5RootDir}/plugins)

# private headers
set(Qt5GuiPrivateDir ${Qt5IncludeDir}/QtGui/${Qt5Version})
set(Qt5CorePrivateDir ${Qt5IncludeDir}/QtCore/${Qt5Version})

# designer plugin path
set(Qt5PluginsDesignerDir ${Qt5PluginsDir}/designer)
