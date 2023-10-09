# SPDX-FileCopyrightText: Copyright 2023 Mikhail Svetkin
# SPDX-License-Identifier: MIT

include_guard(GLOBAL)

include(set_cict_target_properties)

include(GenerateExportHeader)
include(GNUInstallDirs)

# generaete header with export macro
function(_cict_module_generate_export_headers target)
  set(export_file_dir "${CMAKE_CURRENT_BINARY_DIR}/include/cict")
  generate_export_header(${target}
    EXPORT_FILE_NAME "${export_file_dir}/${module_name}/export.hpp"
  )

  target_include_directories(
    ${target} ${module_type}
    $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>
  )

  if (TARGET cict)
    install(
      DIRECTORY ${export_file_dir}
      TYPE INCLUDE
      # COMPONENT ${target}
    )
  endif()
endfunction()

# sets all nessary default things
function(add_cict_module module_name)
  set(module_target cict-${module_name})
  set(module_alias cict::${module_name})

  add_library(${module_target} ${ARGN})
  add_library(${module_alias} ALIAS ${module_target})

  get_target_property(module_target_type ${module_target} TYPE)
  if("${module_target_type}" STREQUAL "INTERFACE_LIBRARY")
    set(module_type "INTERFACE")
  else()
    set(module_type "PUBLIC")
    _cict_module_generate_export_headers(${module_target})
  endif()

  set_cict_target_properties(${module_target} ${module_type})

  target_include_directories(
    ${module_target} ${module_type}
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
  )
  set_target_properties(${module_target} PROPERTIES EXPORT_NAME ${module_name})

  target_link_libraries(${module_target} ${module_type})

  if (TARGET cict)
    target_link_libraries(cict INTERFACE ${module_target})
    install(
      TARGETS ${module_target}
      EXPORT cict-targets
      RUNTIME DESTINATION lib
      LIBRARY DESTINATION lib
      ARCHIVE DESTINATION lib
      # LIBRARY
      # COMPONENT ${module_target}
    )
    install(
      DIRECTORY include/cict
      TYPE INCLUDE
      # COMPONENT ${module_target}
    )
  endif()

  set(cict_module_target
      ${module_target}
      PARENT_SCOPE
  )
endfunction()
