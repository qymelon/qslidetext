################################################################################
# Copyright (c) 2018, Induspotis, Inc.
# All rights reserved.
#
# Root cmake script entry
#
# author   : hunt978(hubq@initialsoft.com)
# create   : 2018-05-02 09:34:07 UTC
# modified : 2019-08-16 07:23:55 UTC
################################################################################

# cmake version
cmake_minimum_required(VERSION 3.5.0)

# find paths
find_path(QSLIDETEXT_INSTALL_DIR NAMES include/qslidetext_config.h)
mark_as_advanced(QSLIDETEXT_INSTALL_DIR)

# We need to open configure.h file from QSLIDETEXT_INSTALL_DIR before we check for
# the components. Bail out with proper error message if it wasn't found. The
# complete check with all components is further below.
if(NOT QSLIDETEXT_INSTALL_DIR)
    include(FindPackageHandleStandardArgs)
    find_package_handle_standard_args(qslidetext REQUIRED_VARS QSLIDETEXT_INSTALL_DIR)
    return()
endif()

# setup paths
set(QSLIDETEXT_INC_DIR ${QSLIDETEXT_INSTALL_DIR}/include)
set(QSLIDETEXT_LIB_DIR ${QSLIDETEXT_INSTALL_DIR}/lib)
set(QSLIDETEXT_BIN_DIR ${QSLIDETEXT_INSTALL_DIR}/bin)

# target
if(NOT TARGET qslidetext)
  add_library(qslidetext UNKNOWN IMPORTED)

  # try to find both debug and release version
  find_library(QSLIDETEXT_LIBRARY_DEBUG NAMES qslidetextd PATHS ${QSLIDETEXT_LIB_DIR})
  find_library(QSLIDETEXT_LIBRARY_RELEASE NAMES qslidetext PATHS ${QSLIDETEXT_LIB_DIR})
  mark_as_advanced(QSLIDETEXT_LIBRARY_DEBUG QSLIDETEXT_LIBRARY_RELEASE)

  # Set the QSLIDETEXT_LIBRARY variable based on what was found, use that
  # information to guess also build type of dynamic plugins
  if(QSLIDETEXT_LIBRARY_DEBUG AND QSLIDETEXT_LIBRARY_RELEASE)
      set(QSLIDETEXT_LIBRARY ${QSLIDETEXT_LIBRARY_RELEASE})
      get_filename_component(_QSLIDETEXT_PLUGINS_DIR_PREFIX ${QSLIDETEXT_LIBRARY_DEBUG} PATH)
      if(CMAKE_BUILD_TYPE STREQUAL "Debug")
          set(_QSLIDETEXT_PLUGINS_DIR_SUFFIX "d")
      endif()
  elseif(QSLIDETEXT_LIBRARY_DEBUG)
      set(QSLIDETEXT_LIBRARY ${QSLIDETEXT_LIBRARY_DEBUG})
      get_filename_component(_QSLIDETEXT_PLUGINS_DIR_PREFIX ${QSLIDETEXT_LIBRARY_DEBUG} PATH)
      set(_QSLIDETEXT_PLUGINS_DIR_SUFFIX "d")
  elseif(QSLIDETEXT_LIBRARY_RELEASE)
      set(QSLIDETEXT_LIBRARY ${QSLIDETEXT_LIBRARY_RELEASE})
      get_filename_component(_QSLIDETEXT_PLUGINS_DIR_PREFIX ${QSLIDETEXT_LIBRARY_RELEASE} PATH)
  endif()

  if(QSLIDETEXT_LIBRARY_RELEASE)
      set_property(TARGET qslidetext APPEND PROPERTY
          IMPORTED_CONFIGURATIONS RELEASE)
      set_property(TARGET qslidetext PROPERTY
          IMPORTED_LOCATION_RELEASE ${QSLIDETEXT_LIBRARY_RELEASE})
  endif()

  if(QSLIDETEXT_LIBRARY_DEBUG)
      set_property(TARGET qslidetext APPEND PROPERTY
          IMPORTED_CONFIGURATIONS DEBUG)
      set_property(TARGET qslidetext PROPERTY
          IMPORTED_LOCATION_DEBUG ${QSLIDETEXT_LIBRARY_DEBUG})
  endif()

  # Include directories
  set_property(TARGET qslidetext APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${QSLIDETEXT_INC_DIR})

  # Dependent libraries
  find_package(Qt5 COMPONENTS Core Widgets REQUIRED)
  set_property(TARGET qslidetext APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt5::Core Qt5::Widgets)
else()
    set(QSLIDETEXT_LIBRARY qslidetext)
endif()