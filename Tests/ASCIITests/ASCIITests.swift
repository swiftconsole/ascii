//
//  ASCIITests.swift
//  ASCII
//
//  Created by Ihar Biaspalau on 8.02.25.
//

import Foundation
import Testing

@testable import ASCII

@Test(arguments: helper.ints) func `init`(int: Int) async throws {
    #expect(ASCII.init(int) == ASCII.find(int))
}

@Test(arguments: helper.bytes) func `init`(byte: UInt8) async throws {
    #expect(ASCII.init(byte) == ASCII.find(byte))
}

@Test(arguments: helper.scalars) func `init`(scalar: UnicodeScalar) async throws
{
    #expect(ASCII.init(scalar) == ASCII.find(scalar))
}

@Test(arguments: helper.characters) func `init`(char: Character) async throws {
    #expect(ASCII.init(char) == ASCII.find(char))
}

@Test(arguments: helper.strings) func `init`(string: String) async throws {
    #expect(ASCII.init(string) == ASCII.find(string))
}

@Test(arguments: Array(zip(ASCII.allCases.map(\.binary.description), helper.binaries)))
func binary(ascii: String, binary: String) async throws {
    #expect(ascii == binary)
}

@Test(arguments: ASCII.allCases) func controlDescription(ascii: ASCII) async throws {
    #expect(ascii.controlDescription.description == helper.controlDescriptions[ascii] ?? "")
}

@Test(arguments: Array(zip(ASCII.allCases.map(\.decimal), helper.bytes)))
func decimal(ascii: UInt8, byte: UInt8) async throws {
    #expect(ascii == byte)
}

@Test(arguments:
        Array(zip(ASCII.allCases.map(\.hexadecimal).map(String.init), helper.hexademicals)))
func hexadecimal(ascii: String, hex: String) async throws {
    #expect(ascii == hex)
}

@Test(arguments: Array(zip(ASCII.allCases.map(\.htmlEntity).map(String.init), helper.htmlEntities)))
func htmlEntity(ascii: String, htmlEntity: String) async throws {
    #expect(ascii == htmlEntity)
}

@Test(arguments: Array(zip(ASCII.allCases.map(\.octal).map(String.init), helper.octals)))
func octal(ascii: String, octal: String) async throws {
    #expect(ascii == octal)
}

@Test(arguments: Array(zip(ASCII.allCases.map(\.unicode).map(String.init), helper.unicodes)))
func unicode(ascii: String, unicode: String) async throws {
    #expect(ascii == unicode)
}
