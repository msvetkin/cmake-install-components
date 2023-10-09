# SPDX-FileCopyrightText: Copyright 2023 Mikhail Svetkin
# SPDX-License-Identifier: MIT

add_cict_module(core)

target_sources(${cict_module_target} PRIVATE
  include/cict/core/version.hpp
  src/version.cpp)
