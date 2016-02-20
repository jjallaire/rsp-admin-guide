#
# CMakeLists.txt
#
# Copyright (C) 2009-12 by RStudio, Inc.
#

cmake_minimum_required(VERSION 2.6)
project (Doc)

#include("${CMAKE_CURRENT_SOURCE_DIR}/../CMakeGlobals.txt")
# version info
if ("$ENV{RSTUDIO_VERSION_MAJOR}" STREQUAL "")
  set(CPACK_PACKAGE_VERSION_MAJOR "99")
  set(RSTUDIO_UNVERSIONED_BUILD TRUE)
else()
  set(CPACK_PACKAGE_VERSION_MAJOR $ENV{RSTUDIO_VERSION_MAJOR})
endif()
if ("$ENV{RSTUDIO_VERSION_MINOR}" STREQUAL "")
  set(CPACK_PACKAGE_VERSION_MINOR "9")
else()
  set(CPACK_PACKAGE_VERSION_MINOR $ENV{RSTUDIO_VERSION_MINOR})
endif()
if ("$ENV{RSTUDIO_VERSION_PATCH}" STREQUAL "")
  set(CPACK_PACKAGE_VERSION_PATCH "9")
else()
  set(CPACK_PACKAGE_VERSION_PATCH $ENV{RSTUDIO_VERSION_PATCH})
endif()
set(CPACK_PACKAGE_VERSION "${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")


configure_file(cover.tex.in ${CMAKE_CURRENT_SOURCE_DIR}/cover.tex)
configure_file(_bookdown.yml.in ${CMAKE_CURRENT_SOURCE_DIR}/_bookdown.yml)

# build book
add_custom_target(build_book ALL)
add_custom_command(
   TARGET build_book
   WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
   COMMAND ./build-book.sh)

