// SPDX-FileCopyrightText: Copyright 2023 Mikhail Svetkin
// SPDX-License-Identifier: MIT

#include "cict/http/version.hpp"

#include "cict/core/version.hpp"

#include <fmt/format.h>

namespace cict::http {

std::string version() noexcept {
  return fmt::format("http-{}", core::version());
}

} // namespace cict::http
