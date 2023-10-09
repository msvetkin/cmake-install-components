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
    install(TARGETS ${executable_target} EXPORT cict-targets)
  endif()

  set(cict_executable_target
      ${executable_target}
      PARENT_SCOPE
  )
endfunction()
