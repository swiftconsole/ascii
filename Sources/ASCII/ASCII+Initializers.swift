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
  /// Creates an ASCII value from an integer.
  ///
  /// This initializer attempts to create an ASCII value from a given integer.
  /// It will succeed only if the input value is between 0 and 127 (inclusive).
  ///
  /// - Parameter value: An integer value representing an ASCII code point.
  ///
  /// ```swift
  /// ASCII(65)  // Returns .A
  /// ASCII(128) // Returns nil (out of ASCII range)
  /// ASCII(-1)  // Returns nil (negative value)
  /// ```
  @inline(__always)
  public init?(_ value: Int) {
    guard value >= 0, value <= 127 else { return nil }
    self.init(UInt8(truncatingIfNeeded: value))
  }

  /// Creates an ASCII value from an unsigned 8-bit integer.
  ///
  /// This initializer provides a direct mapping from byte values to ASCII characters.
  /// It will succeed only if the input value is between 0 and 127 (inclusive).
  ///
  /// - Parameter value: An unsigned 8-bit integer representing an ASCII code point.
  ///
  /// ```swift
  /// ASCII(UInt8(65))  // Returns .A
  /// ASCII(UInt8(128)) // Returns nil (out of ASCII range)
  /// ```
  @inline(__always)
  public init?(_ value: UInt8) {
    guard value <= 127 else { return nil }
    // Using lookup table for O(1) initialization
    switch value {
    case 0x00: self = .null
    case 0x01: self = .startOfHeading
    case 0x02: self = .startOfText
    case 0x03: self = .endOfText
    case 0x04: self = .endOfTransmission
    case 0x05: self = .enquiry
    case 0x06: self = .acknowledge
    case 0x07: self = .bell
    case 0x08: self = .backspace
    case 0x09: self = .horizontalTab
    case 0x0A: self = .lineFeed
    case 0x0B: self = .verticalTab
    case 0x0C: self = .formFeed
    case 0x0D: self = .carriageReturn
    case 0x0E: self = .shiftOut
    case 0x0F: self = .shiftIn
    case 0x10: self = .dataLinkEscape
    case 0x11: self = .deviceControl1
    case 0x12: self = .deviceControl2
    case 0x13: self = .deviceControl3
    case 0x14: self = .deviceControl4
    case 0x15: self = .negativeAcknowledge
    case 0x16: self = .synchronousIdle
    case 0x17: self = .endOfTransmissionBlock
    case 0x18: self = .cancel
    case 0x19: self = .endOfMedium
    case 0x1A: self = .substitute
    case 0x1B: self = .escape
    case 0x1C: self = .fileSeparator
    case 0x1D: self = .groupSeparator
    case 0x1E: self = .recordSeparator
    case 0x1F: self = .unitSeparator
    case 0x20: self = .space
    case 0x21: self = .exclamationMark
    case 0x22: self = .doubleQuote
    case 0x23: self = .numberSign
    case 0x24: self = .dollarSign
    case 0x25: self = .percentSign
    case 0x26: self = .ampersand
    case 0x27: self = .singleQuote
    case 0x28: self = .leftParenthesis
    case 0x29: self = .rightParenthesis
    case 0x2A: self = .asterisk
    case 0x2B: self = .plus
    case 0x2C: self = .comma
    case 0x2D: self = .minus
    case 0x2E: self = .period
    case 0x2F: self = .forwardSlash
    case 0x30: self = .digit0
    case 0x31: self = .digit1
    case 0x32: self = .digit2
    case 0x33: self = .digit3
    case 0x34: self = .digit4
    case 0x35: self = .digit5
    case 0x36: self = .digit6
    case 0x37: self = .digit7
    case 0x38: self = .digit8
    case 0x39: self = .digit9
    case 0x3A: self = .colon
    case 0x3B: self = .semicolon
    case 0x3C: self = .lessThan
    case 0x3D: self = .equals
    case 0x3E: self = .greaterThan
    case 0x3F: self = .questionMark
    case 0x40: self = .atSign
    case 0x41: self = .A
    case 0x42: self = .B
    case 0x43: self = .C
    case 0x44: self = .D
    case 0x45: self = .E
    case 0x46: self = .F
    case 0x47: self = .G
    case 0x48: self = .H
    case 0x49: self = .I
    case 0x4A: self = .J
    case 0x4B: self = .K
    case 0x4C: self = .L
    case 0x4D: self = .M
    case 0x4E: self = .N
    case 0x4F: self = .O
    case 0x50: self = .P
    case 0x51: self = .Q
    case 0x52: self = .R
    case 0x53: self = .S
    case 0x54: self = .T
    case 0x55: self = .U
    case 0x56: self = .V
    case 0x57: self = .W
    case 0x58: self = .X
    case 0x59: self = .Y
    case 0x5A: self = .Z
    case 0x5B: self = .leftBracket
    case 0x5C: self = .backslash
    case 0x5D: self = .rightBracket
    case 0x5E: self = .caret
    case 0x5F: self = .underscore
    case 0x60: self = .backquote
    case 0x61: self = .a
    case 0x62: self = .b
    case 0x63: self = .c
    case 0x64: self = .d
    case 0x65: self = .e
    case 0x66: self = .f
    case 0x67: self = .g
    case 0x68: self = .h
    case 0x69: self = .i
    case 0x6A: self = .j
    case 0x6B: self = .k
    case 0x6C: self = .l
    case 0x6D: self = .m
    case 0x6E: self = .n
    case 0x6F: self = .o
    case 0x70: self = .p
    case 0x71: self = .q
    case 0x72: self = .r
    case 0x73: self = .s
    case 0x74: self = .t
    case 0x75: self = .u
    case 0x76: self = .v
    case 0x77: self = .w
    case 0x78: self = .x
    case 0x79: self = .y
    case 0x7A: self = .z
    case 0x7B: self = .leftBrace
    case 0x7C: self = .verticalBar
    case 0x7D: self = .rightBrace
    case 0x7E: self = .tilde
    case 0x7F: self = .delete
    default: return nil
    }
  }

  /// Creates an ASCII value from a Unicode scalar.
  ///
  /// This initializer attempts to create an ASCII value from a Unicode scalar.
  /// It will succeed only if the scalar's value is between 0 and 127 (inclusive).
  ///
  /// - Parameter scalar: A Unicode scalar value.
  ///
  /// ```swift
  /// ASCII(Unicode.Scalar("A"))  // Returns .A
  /// ASCII(Unicode.Scalar("🙂")) // Returns nil (not ASCII)
  /// ```
  @inline(__always)
  public init?(_ scalar: Unicode.Scalar) {
    guard scalar.value <= 127 else { return nil }
    self.init(UInt8(scalar.value))
  }

  /// Creates an ASCII value from a Character.
  ///
  /// This initializer provides a fast path for ASCII character conversion.
  /// It will succeed only if the character is a valid ASCII character.
  ///
  /// - Parameter character: A Swift Character value.
  ///
  /// ```swift
  /// ASCII(Character("A")) // Returns .A
  /// ASCII(Character("🙂")) // Returns nil (not ASCII)
  /// ```
  @inline(__always)
  public init?(_ character: Character) {
    // Fast path for ASCII characters
    guard character.isASCII,
      let asciiValue = character.asciiValue
    else { return nil }
    self.init(asciiValue)
  }

  /// Creates an ASCII value from a String.
  ///
  /// This initializer attempts to create an ASCII value from a single-character string.
  /// It will succeed only if the string contains exactly one ASCII character.
  ///
  /// - Parameter string: A Swift String value.
  ///
  /// ```swift
  /// ASCII("A")   // Returns .A
  /// ASCII("AB")  // Returns nil (more than one character)
  /// ASCII("🙂")  // Returns nil (not ASCII)
  /// ASCII("")    // Returns nil (empty string)
  /// ```
  @inline(__always)
  public init?(_ string: String) {
    // Fast path checks
    guard string.count == 1,
      string.utf8.count == 1,
      let ascii = string.utf8.first,
      ascii <= 127
    else { return nil }
    self.init(ascii)
  }
}
