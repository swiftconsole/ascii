//
//  ASCII+ComparableTests.swift
//  ASCII
//
//  Created by Ihar Biaspalau on 8.02.25.
//

import Foundation
import Testing

@testable import ASCII

@Test(arguments: comparants.ascii_with_ascii)
func lessThan(lhs: ASCII, rhs: ASCII) async throws {
    #expect(lhs < rhs)
}

@Test(arguments: comparants.ascii_with_ascii)
func moreThan(rhs: ASCII, lhs: ASCII) async throws {
    #expect(lhs > rhs)
}

@Test(arguments: comparants.ascii_with_ascii)
func lessThanOrEqual(lhs: ASCII, rhs: ASCII) async throws {
    #expect(lhs <= rhs && lhs <= lhs && rhs <= rhs)
}

@Test(arguments: comparants.ascii_with_ascii)
func moreThanOrEqual(rhs: ASCII, lhs: ASCII) async throws {
    #expect(lhs >= rhs && lhs >= lhs && rhs >= rhs)
}

// Compare ASCII and Int

@Test(arguments: ASCII.allCases)
func equalToInt(ascii: ASCII) async throws {
    #expect(ascii == ascii.int)
    #expect(ascii.int == ascii)
}

@Test(arguments: comparants.ascii_with_int)
func lessThanInt(ascii: ASCII, int: Int) async throws {
    #expect(ascii < int)
}

@Test(arguments: comparants.int_with_ascii)
func moreThanInt(int: Int, ascii: ASCII) async throws {
    #expect(ascii > int)
}

@Test(arguments: comparants.ascii_with_int)
func lessThanOrEqualToInt(ascii: ASCII, int: Int) async throws {
    #expect(ascii <= int && ascii <= ascii.int)
}

@Test(arguments: comparants.int_with_ascii)
func moreThanOrEqualToInt(int: Int, ascii: ASCII) async throws {
    #expect(ascii >= int && ascii >= ascii.int)
}

@Test(arguments: comparants.int_with_ascii)
func intLessThan(int: Int, ascii: ASCII) async throws {
    #expect(int < ascii)
}

@Test(arguments: comparants.ascii_with_int)
func intMoreThan(ascii: ASCII, int: Int) async throws {
    #expect(int > ascii)
}

@Test(arguments: comparants.int_with_ascii)
func intLessThanOrEqual(int: Int, ascii: ASCII) async throws {
    #expect(int <= ascii && ascii.int <= ascii)
}

@Test(arguments: comparants.ascii_with_int)
func intMoreThanOrEqual(ascii: ASCII, int: Int) async throws {
    #expect(int >= ascii && ascii.int >= ascii)
}

// Compare ASCII and UInt8

@Test(arguments: ASCII.allCases)
func equalToUInt8(ascii: ASCII) async throws {
    #expect(ascii == ascii.decimal)
    #expect(ascii.decimal == ascii)
}

@Test(arguments: comparants.ascii_with_uint8)
func lessThanUInt8(ascii: ASCII, uint: UInt8) async throws {
    #expect(ascii < uint)
}

@Test(arguments: comparants.uint8_with_ascii)
func moreThanInt(uint: UInt8, ascii: ASCII) async throws {
    #expect(ascii > uint)
}

@Test(arguments: comparants.ascii_with_uint8)
func lessThanOrEqualToInt(ascii: ASCII, uint: UInt8) async throws {
    #expect(ascii <= uint && ascii <= ascii.decimal)
}

@Test(arguments: comparants.uint8_with_ascii)
func moreThanOrEqualToInt(uint: UInt8, ascii: ASCII) async throws {
    #expect(ascii >= uint && ascii >= ascii.decimal)
}

@Test(arguments: comparants.uint8_with_ascii)
func intLessThan(uint: UInt8, ascii: ASCII) async throws {
    #expect(uint < ascii)
}

@Test(arguments: comparants.ascii_with_uint8)
func intMoreThan(ascii: ASCII, uint: UInt8) async throws {
    #expect(uint > ascii)
}

@Test(arguments: comparants.uint8_with_ascii)
func intLessThanOrEqual(uint: UInt8, ascii: ASCII) async throws {
    #expect(uint <= ascii && ascii.decimal <= ascii)
}

@Test(arguments: comparants.ascii_with_uint8)
func intMoreThanOrEqual(ascii: ASCII, uint: UInt8) async throws {
    #expect(uint >= ascii && ascii.decimal >= ascii)
}
