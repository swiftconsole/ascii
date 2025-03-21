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
  /// Returns escaped representation (like \n, \t, etc).
  ///
  /// Uses `StaticString` for zero runtime overhead.
  public var escaped: StaticString {
    switch self {
    case .null: "\\0"
    case .startOfHeading: "\\x01"
    case .startOfText: "\\x02"
    case .endOfText: "\\x03"
    case .endOfTransmission: "\\x04"
    case .enquiry: "\\x05"
    case .acknowledge: "\\x06"
    case .bell: "\\a"
    case .backspace: "\\b"
    case .horizontalTab: "\\t"
    case .lineFeed: "\\n"
    case .verticalTab: "\\v"
    case .formFeed: "\\f"
    case .carriageReturn: "\\r"
    case .shiftOut: "\\x0e"
    case .shiftIn: "\\x0f"
    case .dataLinkEscape: "\\x10"
    case .deviceControl1: "\\x11"
    case .deviceControl2: "\\x12"
    case .deviceControl3: "\\x13"
    case .deviceControl4: "\\x14"
    case .negativeAcknowledge: "\\x15"
    case .synchronousIdle: "\\x16"
    case .endOfTransmissionBlock: "\\x17"
    case .cancel: "\\x18"
    case .endOfMedium: "\\x19"
    case .substitute: "\\x1a"
    case .escape: "\\x1b"
    case .fileSeparator: "\\x1c"
    case .groupSeparator: "\\x1d"
    case .recordSeparator: "\\x1e"
    case .unitSeparator: "\\x1f"
    case .space: " "
    case .exclamationMark: "!"
    case .doubleQuote: "\\\""
    case .numberSign: "#"
    case .dollarSign: "$"
    case .percentSign: "%"
    case .ampersand: "&"
    case .singleQuote: "\\'"
    case .leftParenthesis: "("
    case .rightParenthesis: ")"
    case .asterisk: "*"
    case .plus: "+"
    case .comma: ","
    case .minus: "-"
    case .period: "."
    case .forwardSlash: "/"
    case .digit0: "0"
    case .digit1: "1"
    case .digit2: "2"
    case .digit3: "3"
    case .digit4: "4"
    case .digit5: "5"
    case .digit6: "6"
    case .digit7: "7"
    case .digit8: "8"
    case .digit9: "9"
    case .colon: ":"
    case .semicolon: ";"
    case .lessThan: "<"
    case .equals: "="
    case .greaterThan: ">"
    case .questionMark: "?"
    case .atSign: "@"
    case .A: "A"
    case .B: "B"
    case .C: "C"
    case .D: "D"
    case .E: "E"
    case .F: "F"
    case .G: "G"
    case .H: "H"
    case .I: "I"
    case .J: "J"
    case .K: "K"
    case .L: "L"
    case .M: "M"
    case .N: "N"
    case .O: "O"
    case .P: "P"
    case .Q: "Q"
    case .R: "R"
    case .S: "S"
    case .T: "T"
    case .U: "U"
    case .V: "V"
    case .W: "W"
    case .X: "X"
    case .Y: "Y"
    case .Z: "Z"
    case .leftBracket: "["
    case .backslash: "\\\\"
    case .rightBracket: "]"
    case .caret: "^"
    case .underscore: "_"
    case .backquote: "`"
    case .a: "a"
    case .b: "b"
    case .c: "c"
    case .d: "d"
    case .e: "e"
    case .f: "f"
    case .g: "g"
    case .h: "h"
    case .i: "i"
    case .j: "j"
    case .k: "k"
    case .l: "l"
    case .m: "m"
    case .n: "n"
    case .o: "o"
    case .p: "p"
    case .q: "q"
    case .r: "r"
    case .s: "s"
    case .t: "t"
    case .u: "u"
    case .v: "v"
    case .w: "w"
    case .x: "x"
    case .y: "y"
    case .z: "z"
    case .leftBrace: "{"
    case .verticalBar: "|"
    case .rightBrace: "}"
    case .tilde: "~"
    case .delete: "\\x7f"
    }
  }
}
