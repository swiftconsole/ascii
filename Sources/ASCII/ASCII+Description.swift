//
//  ASCII+Description.swift
//  ASCII
//
//  Created by Ihar Biaspalau on 28.01.25.
//


extension ASCII: CustomStringConvertible {
    public var description: String { unicode.description }
}
