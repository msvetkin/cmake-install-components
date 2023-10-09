// SPDX-FileCopyrightText: Copyright 2023 Mikhail Svetkin
// SPDX-License-Identifier: MIT

#pragma once

#include "cict/http/export.hpp"

#include <string>

namespace cict::http {

[[nodiscard]] CICT_HTTP_EXPORT std::string version() noexcept;

} // namespace cict::http
