# SPDX-FileCopyrightText: Copyright 2023 Mikhail Svetkin
# SPDX-License-Identifier: MIT

add_cict_module(http)

target_sources(${cict_module_target} PRIVATE
  include/cict/http/version.hpp
  src/version.cpp)

target_link_libraries(${cict_module_target} PUBLIC cict::core)
