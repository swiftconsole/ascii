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
  public static func == (lhs: ASCII, rhs: UInt8) -> Bool {
    lhs.decimal == rhs
  }

  public static func == (lhs: UInt8, rhs: ASCII) -> Bool {
    lhs == rhs.decimal
  }

  public static func < (lhs: ASCII, rhs: UInt8) -> Bool {
    lhs.decimal < rhs
  }

  public static func <= (lhs: ASCII, rhs: UInt8) -> Bool {
    lhs.decimal <= rhs
  }

  public static func > (lhs: ASCII, rhs: UInt8) -> Bool {
    lhs.decimal > rhs
  }

  public static func >= (lhs: ASCII, rhs: UInt8) -> Bool {
    lhs.decimal >= rhs
  }

  public static func < (lhs: UInt8, rhs: ASCII) -> Bool {
    lhs < rhs.decimal
  }

  public static func <= (lhs: UInt8, rhs: ASCII) -> Bool {
    lhs <= rhs.decimal
  }

  public static func > (lhs: UInt8, rhs: ASCII) -> Bool {
    lhs > rhs.decimal
  }

  public static func >= (lhs: UInt8, rhs: ASCII) -> Bool {
    lhs >= rhs.decimal
  }
}
