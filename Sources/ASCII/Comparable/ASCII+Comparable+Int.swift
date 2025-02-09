//
//  ASCII+Comparable+Int.swift
//  ASCII
//
//  Created by Ihar Biaspalau on 8.02.25.
//

extension ASCII {
    public static func == (lhs: ASCII, rhs: Int) -> Bool {
        lhs.int == rhs
    }

    public static func == (lhs: Int, rhs: ASCII) -> Bool {
        lhs == rhs.int
    }

    public static func < (lhs: ASCII, rhs: Int) -> Bool {
        lhs.int < rhs
    }

    public static func <= (lhs: ASCII, rhs: Int) -> Bool {
        lhs.int <= rhs
    }

    public static func > (lhs: ASCII, rhs: Int) -> Bool {
        lhs.int > rhs
    }

    public static func >= (lhs: ASCII, rhs: Int) -> Bool {
        lhs.int >= rhs
    }

    public static func < (lhs: Int, rhs: ASCII) -> Bool {
        lhs < rhs.int
    }

    public static func <= (lhs: Int, rhs: ASCII) -> Bool {
        lhs <= rhs.int
    }

    public static func > (lhs: Int, rhs: ASCII) -> Bool {
        lhs > rhs.int
    }

    public static func >= (lhs: Int, rhs: ASCII) -> Bool {
        lhs >= rhs.int
    }
}
