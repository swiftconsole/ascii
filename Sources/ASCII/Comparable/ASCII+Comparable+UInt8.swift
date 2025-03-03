//
//  ASCII+Comparable+UInt8.swift
//  ASCII
//
//  Created by Ihar Biaspalau on 8.02.25.
//

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
