//
//  ASCII+Convenience.swift
//  ASCII
//
//  Created by Ihar Biaspalau on 28.01.25.
//


public extension ASCII {
    /// Whether this is a control character (0-31, 127)
    var isControl: Bool {
        self <= 31 || self == 127
    }
    
    /// Whether this is a printable character (32-126)
    var isPrintable: Bool {
        self >= 32 && self <= 126
    }
    
    /// Whether this is a digit (0-9)
    var isDigit: Bool {
        self >= ASCII.digit0 && self <= ASCII.digit9
    }
    
    /// Whether this is an uppercase letter (A-Z)
    var isUppercase: Bool {
        self >= ASCII.A && self <= ASCII.Z
    }
    
    /// Whether this is a lowercase letter (a-z)
    var isLowercase: Bool {
        self >= ASCII.a && self <= ASCII.z
    }
    
    /// Whether this is a letter (A-Z, a-z)
    var isLetter: Bool {
        isUppercase || isLowercase
    }
    
    /// Whether this is alphanumeric (0-9, A-Z, a-z)
    var isAlphanumeric: Bool {
        isDigit || isLetter
    }
    
    /// Whether this is whitespace (space, tab, newline, etc.)
    var isWhitespace: Bool {
        switch self {
        case .space, .horizontalTab, .lineFeed, .verticalTab, .formFeed, .carriageReturn:
            return true
        default:
            return false
        }
    }
}
