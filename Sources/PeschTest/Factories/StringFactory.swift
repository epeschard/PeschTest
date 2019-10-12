//
//  StringFactory.swift
//  PeschCore
//
//  Created by Eugène Peschard on 10/10/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Foundation

enum StringFactory {
    static let defaultLength = 19
}

public extension String {

    public static func makeRandom(length: Int = StringFactory.defaultLength) -> String {

        let letters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)

        var randomString = ""

        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }

        return randomString
    }

    public static func makeRandomColor() -> String {

        let letters: NSString = "ABCDEF0123456789"
        let len = UInt32(letters.length)

        var randomString = ""

        for _ in 0 ..< 6 {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }

        return randomString
    }

    public static func makeRandomEmail() -> String {
        return createRandomString(length: 10) + "@gmail.com"
    }

    public static func makeRandomPhoneNumber() -> String {
        return "6" + createRandomNumericString(length: 8)
    }

    public static func makeRandomPrefix() -> String {
        return "+3" + createRandomNumericString(length: 1)
    }

    public static func makeRandomURLWeb(_ https: Bool = true) -> String {
        let protocolHttp = https ? "https://" : "http://"
        let randomURL = StringFactory.createRandomString()
        return "\(protocolHttp)\(randomURL).com"
    }

}

internal extension StringFactory {
    static func makeRandomNumericString(length: Int) -> String {
        let letters: NSString = "123456789"
        let len = UInt32(letters.length)

        var randomString = ""

        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }

        return randomString
    }
}
