//
//  Helpers.swift
//  ASCII
//
//  Created by Ihar Biaspalau on 9.02.25.
//


import ASCII

extension ASCII {
    public static func find(_ by: Int) -> Self { allCases[by] }
    public static func find(_ by: UInt8) -> Self { allCases[helper.index(by)] }
    public static func find(_ by: UnicodeScalar) -> Self {
        allCases[helper.index(by)]
    }
    public static func find(_ by: Character) -> Self {
        allCases[helper.index(by)]
    }
    public static func find(_ by: String) -> Self { allCases[helper.index(by)] }
}

struct helper {
    public static func index(_ from: Int) -> Int { from }
    public static func index(_ from: UInt8) -> Int { Int(from) }
    public static func index(_ from: UnicodeScalar) -> Int { Int(from.value) }
    public static func index(_ from: Character) -> Int { Int(from.asciiValue!) }
    public static func index(_ from: String) -> Int { Int(from.utf8.first!) }

    public static let ints = 0...127
    public static let bytes: ClosedRange<UInt8> = 0...127
    public static let scalars: [UnicodeScalar] = bytes.map(UnicodeScalar.init)
    public static let characters: [Character] = scalars.map(Character.init)
    public static let strings: [String] = scalars.map(String.init)
    public static let binaries: [String] = ints.map {
        String(format: "%08d", Int(String($0, radix: 2))!)
    }
    public static let hexademicals: [String] = ints.map {
        String(format: "%02X", $0)
    }
    public static let htmlEntities: [String] = ints.map {
        String(format: "&#%d;", $0)
    }
    public static let octals: [String] = ints.map {
        String(format: "%03d", Int(String($0, radix: 8))!)
    }
    public static let unicodes: [String] = strings
    public static let controlDescriptions: [ASCII: String] = [
        .null: "NUL",
        .startOfHeading: "SOH",
        .startOfText: "STX",
        .endOfText: "ETX",
        .endOfTransmission: "EOT",
        .enquiry: "ENQ",
        .acknowledge: "ACK",
        .bell: "BEL",
        .backspace: "BS",
        .horizontalTab: "HT",
        .lineFeed: "LF",
        .verticalTab: "VT",
        .formFeed: "FF",
        .carriageReturn: "CR",
        .shiftOut: "SO",
        .shiftIn: "SI",
        .dataLinkEscape: "DLE",
        .deviceControl1: "DC1",
        .deviceControl2: "DC2",
        .deviceControl3: "DC3",
        .deviceControl4: "DC4",
        .negativeAcknowledge: "NAK",
        .synchronousIdle: "SYN",
        .endOfTransmissionBlock: "ETB",
        .cancel: "CAN",
        .endOfMedium: "EM",
        .substitute: "SUB",
        .escape: "ESC",
        .fileSeparator: "FS",
        .groupSeparator: "GS",
        .recordSeparator: "RS",
        .unitSeparator: "US",
        .space: "SPC",
        .delete: "DEL",
    ]
}

struct comparants {
    public static let ascii_with_ascii =
        Array(zip(ASCII.allCases.dropLast(), ASCII.allCases.dropFirst()))

    public static let ascii_with_int =
        Array(zip(ASCII.allCases.dropLast(), ASCII.allCases.dropFirst().map(\.int)))

    public static let int_with_ascii =
        Array(zip(ASCII.allCases.dropLast().map(\.int), ASCII.allCases.dropFirst()))

    public static let ascii_with_uint8 =
        Array(zip(ASCII.allCases.dropLast(),ASCII.allCases.dropFirst().map(\.decimal)))

    public static let uint8_with_ascii =
        Array(zip(ASCII.allCases.dropLast().map(\.decimal),ASCII.allCases.dropFirst()))
}
