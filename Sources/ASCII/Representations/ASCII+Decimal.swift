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

extension UInt8 {
  init(_ ascii: ASCII) { self = ascii.decimal }
}

extension ASCII {
  /// Returns decimal representation (0-127) as a raw byte value.
  ///
  /// Direct value with no boxing or runtime overhead.
  public var decimal: UInt8 {
    switch self {
    case .null: 0
    case .startOfHeading: 1
    case .startOfText: 2
    case .endOfText: 3
    case .endOfTransmission: 4
    case .enquiry: 5
    case .acknowledge: 6
    case .bell: 7
    case .backspace: 8
    case .horizontalTab: 9
    case .lineFeed: 10
    case .verticalTab: 11
    case .formFeed: 12
    case .carriageReturn: 13
    case .shiftOut: 14
    case .shiftIn: 15
    case .dataLinkEscape: 16
    case .deviceControl1: 17
    case .deviceControl2: 18
    case .deviceControl3: 19
    case .deviceControl4: 20
    case .negativeAcknowledge: 21
    case .synchronousIdle: 22
    case .endOfTransmissionBlock: 23
    case .cancel: 24
    case .endOfMedium: 25
    case .substitute: 26
    case .escape: 27
    case .fileSeparator: 28
    case .groupSeparator: 29
    case .recordSeparator: 30
    case .unitSeparator: 31
    case .space: 32
    case .exclamationMark: 33
    case .doubleQuote: 34
    case .numberSign: 35
    case .dollarSign: 36
    case .percentSign: 37
    case .ampersand: 38
    case .singleQuote: 39
    case .leftParenthesis: 40
    case .rightParenthesis: 41
    case .asterisk: 42
    case .plus: 43
    case .comma: 44
    case .minus: 45
    case .period: 46
    case .forwardSlash: 47
    case .digit0: 48
    case .digit1: 49
    case .digit2: 50
    case .digit3: 51
    case .digit4: 52
    case .digit5: 53
    case .digit6: 54
    case .digit7: 55
    case .digit8: 56
    case .digit9: 57
    case .colon: 58
    case .semicolon: 59
    case .lessThan: 60
    case .equals: 61
    case .greaterThan: 62
    case .questionMark: 63
    case .atSign: 64
    case .A: 65
    case .B: 66
    case .C: 67
    case .D: 68
    case .E: 69
    case .F: 70
    case .G: 71
    case .H: 72
    case .I: 73
    case .J: 74
    case .K: 75
    case .L: 76
    case .M: 77
    case .N: 78
    case .O: 79
    case .P: 80
    case .Q: 81
    case .R: 82
    case .S: 83
    case .T: 84
    case .U: 85
    case .V: 86
    case .W: 87
    case .X: 88
    case .Y: 89
    case .Z: 90
    case .leftBracket: 91
    case .backslash: 92
    case .rightBracket: 93
    case .caret: 94
    case .underscore: 95
    case .backquote: 96
    case .a: 97
    case .b: 98
    case .c: 99
    case .d: 100
    case .e: 101
    case .f: 102
    case .g: 103
    case .h: 104
    case .i: 105
    case .j: 106
    case .k: 107
    case .l: 108
    case .m: 109
    case .n: 110
    case .o: 111
    case .p: 112
    case .q: 113
    case .r: 114
    case .s: 115
    case .t: 116
    case .u: 117
    case .v: 118
    case .w: 119
    case .x: 120
    case .y: 121
    case .z: 122
    case .leftBrace: 123
    case .verticalBar: 124
    case .rightBrace: 125
    case .tilde: 126
    case .delete: 127
    }
  }
}
