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
  /// Returns octal representation (000-177).
  ///
  /// Uses `StaticString` for zero runtime overhead.
  public var octal: StaticString {
    switch self {
    case .null: "000"
    case .startOfHeading: "001"
    case .startOfText: "002"
    case .endOfText: "003"
    case .endOfTransmission: "004"
    case .enquiry: "005"
    case .acknowledge: "006"
    case .bell: "007"
    case .backspace: "010"
    case .horizontalTab: "011"
    case .lineFeed: "012"
    case .verticalTab: "013"
    case .formFeed: "014"
    case .carriageReturn: "015"
    case .shiftOut: "016"
    case .shiftIn: "017"
    case .dataLinkEscape: "020"
    case .deviceControl1: "021"
    case .deviceControl2: "022"
    case .deviceControl3: "023"
    case .deviceControl4: "024"
    case .negativeAcknowledge: "025"
    case .synchronousIdle: "026"
    case .endOfTransmissionBlock: "027"
    case .cancel: "030"
    case .endOfMedium: "031"
    case .substitute: "032"
    case .escape: "033"
    case .fileSeparator: "034"
    case .groupSeparator: "035"
    case .recordSeparator: "036"
    case .unitSeparator: "037"
    case .space: "040"
    case .exclamationMark: "041"
    case .doubleQuote: "042"
    case .numberSign: "043"
    case .dollarSign: "044"
    case .percentSign: "045"
    case .ampersand: "046"
    case .singleQuote: "047"
    case .leftParenthesis: "050"
    case .rightParenthesis: "051"
    case .asterisk: "052"
    case .plus: "053"
    case .comma: "054"
    case .minus: "055"
    case .period: "056"
    case .forwardSlash: "057"
    case .digit0: "060"
    case .digit1: "061"
    case .digit2: "062"
    case .digit3: "063"
    case .digit4: "064"
    case .digit5: "065"
    case .digit6: "066"
    case .digit7: "067"
    case .digit8: "070"
    case .digit9: "071"
    case .colon: "072"
    case .semicolon: "073"
    case .lessThan: "074"
    case .equals: "075"
    case .greaterThan: "076"
    case .questionMark: "077"
    case .atSign: "100"
    case .A: "101"
    case .B: "102"
    case .C: "103"
    case .D: "104"
    case .E: "105"
    case .F: "106"
    case .G: "107"
    case .H: "110"
    case .I: "111"
    case .J: "112"
    case .K: "113"
    case .L: "114"
    case .M: "115"
    case .N: "116"
    case .O: "117"
    case .P: "120"
    case .Q: "121"
    case .R: "122"
    case .S: "123"
    case .T: "124"
    case .U: "125"
    case .V: "126"
    case .W: "127"
    case .X: "130"
    case .Y: "131"
    case .Z: "132"
    case .leftBracket: "133"
    case .backslash: "134"
    case .rightBracket: "135"
    case .caret: "136"
    case .underscore: "137"
    case .backquote: "140"
    case .a: "141"
    case .b: "142"
    case .c: "143"
    case .d: "144"
    case .e: "145"
    case .f: "146"
    case .g: "147"
    case .h: "150"
    case .i: "151"
    case .j: "152"
    case .k: "153"
    case .l: "154"
    case .m: "155"
    case .n: "156"
    case .o: "157"
    case .p: "160"
    case .q: "161"
    case .r: "162"
    case .s: "163"
    case .t: "164"
    case .u: "165"
    case .v: "166"
    case .w: "167"
    case .x: "170"
    case .y: "171"
    case .z: "172"
    case .leftBrace: "173"
    case .verticalBar: "174"
    case .rightBrace: "175"
    case .tilde: "176"
    case .delete: "177"
    }
  }
}
