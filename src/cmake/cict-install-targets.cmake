# SPDX-FileCopyrightText: Copyright 2023 Mikhail Svetkin
# SPDX-License-Identifier: MIT

include_guard(GLOBAL)

include(GNUInstallDirs)

add_library(cict INTERFACE)
add_library(cict::cict ALIAS cict)
install(TARGETS cict EXPORT cict-targets)

export(EXPORT cict-targets NAMESPACE cict::)
configure_file("cmake/cict-config.cmake" "." COPYONLY)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
  cict-config-version.cmake COMPATIBILITY SameMajorVersion
)

install(
  EXPORT cict-targets
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/cict
  NAMESPACE cict::
)

install(
  FILES cmake/cict-config.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/cict-config-version.cmake
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/cict
)

