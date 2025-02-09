//
//  ASCII+Comparable.swift
//  ASCII
//
//  Created by Ihar Biaspalau on 8.02.25.
//

extension ASCII: Comparable {
    public static func < (lhs: ASCII, rhs: ASCII) -> Bool {
        lhs.decimal < rhs.decimal
    }

    public static func <= (lhs: ASCII, rhs: ASCII) -> Bool {
        lhs.decimal <= rhs.decimal
    }

    public static func > (lhs: ASCII, rhs: ASCII) -> Bool {
        lhs.decimal > rhs.decimal
    }

    public static func >= (lhs: ASCII, rhs: ASCII) -> Bool {
        lhs.decimal >= rhs.decimal
    }
}
