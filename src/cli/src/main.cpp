// SPDX-FileCopyrightText: Copyright 2023 Mikhail Svetkin
// SPDX-License-Identifier: MIT

#include "cict/core/version.hpp"
#include "cict/http/version.hpp"

#include <fmt/core.h>

int main(int /*argc*/, char * /*argv*/ []) {
  fmt::print("cict version: {}\n", cict::core::version());
  fmt::print("cict version: {}\n", cict::http::version());
  return 0;
}
