# SPDX-FileCopyrightText: Copyright 2023 Mikhail Svetkin
# SPDX-License-Identifier: MIT

include_guard(GLOBAL)

include(set_cict_target_properties)

# sets all nessary default things
function(add_cict_executable executable_name)
  set(executable_target cict-${executable_name})

  add_executable(${executable_target} ${ARGN})
  set_cict_target_properties(${executable_target} PRIVATE)

  if (TARGET cict)
    install(
      TARGETS ${executable_target}
      EXPORT cict-targets
      COMPONENT ${executable_target}
      # RUNTIME_DEPENDENCY_SET myfoo
        # PRE_EXCLUDE_REGEXES ".*"
        # PRE_INCLUDE_REGEXES "cict.*"
        # P
    )

    install(CODE [[
        file(GET_RUNTIME_DEPENDENCIES
            EXECUTABLES
                $<TARGET_FILE:cict-cli>
            RESOLVED_DEPENDENCIES_VAR _r_deps
            UNRESOLVED_DEPENDENCIES_VAR _u_deps
            PRE_EXCLUDE_REGEXES
              "ld-.*"
              "gcc.*"
              "libm.so"
              "std.*"
              "libc.so"
        )

        foreach(_r_dep ${_r_deps})
         file(INSTALL
            DESTINATION "${CMAKE_INSTALL_PREFIX}/lib"
            TYPE SHARED_LIBRARY
            FOLLOW_SYMLINK_CHAIN
            FILES "${_r_dep}"
          )
        endforeach()
     ]]
     COMPONENT ${executable_target}
 )

  endif()

  set(cict_executable_target
      ${executable_target}
      PARENT_SCOPE
  )
endfunction()
