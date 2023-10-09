# SPDX-FileCopyrightText: Copyright 2023 Mikhail Svetkin
# SPDX-License-Identifier: MIT

add_cict_executable(cli)

target_sources(${cict_executable_target} PRIVATE src/main.cpp)

target_link_libraries(${cict_executable_target}
  PRIVATE
    cict::core
)
