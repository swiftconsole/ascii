//===----------------------------------------------------------------------===//
//
// This source file is part of the ASCII open source project
//
// Copyright (c) 2025 Ihar Biaspalau
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

extension ASCII {
  /// Whether this is a control character (0-31, 127).
  public var isControl: Bool {
    self <= 31 || self == 127
  }

  /// Whether this is a printable character (32-126).
  public var isPrintable: Bool {
    self >= 32 && self <= 126
  }

  /// Whether this is a digit (0-9).
  public var isDigit: Bool {
    self >= ASCII.digit0 && self <= ASCII.digit9
  }

  /// Whether this is an uppercase letter (A-Z).
  public var isUppercase: Bool {
    self >= ASCII.A && self <= ASCII.Z
  }

  /// Whether this is a lowercase letter (a-z).
  public var isLowercase: Bool {
    self >= ASCII.a && self <= ASCII.z
  }

  /// Whether this is a letter (A-Z, a-z).
  public var isLetter: Bool {
    isUppercase || isLowercase
  }

  /// Whether this is alphanumeric (0-9, A-Z, a-z).
  public var isAlphanumeric: Bool {
    isDigit || isLetter
  }

  /// Whether this is whitespace (space, tab, newline, etc.).
  public var isWhitespace: Bool {
    switch self {
    case .space, .horizontalTab, .lineFeed, .verticalTab, .formFeed,
      .carriageReturn:
      return true
    default:
      return false
    }
  }
}
