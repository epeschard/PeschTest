//
//  Spy.swift
//  PeschCore
//
//  Created by Eugène Peschard on 07/10/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Foundation

public typealias SpyRegisteredCall = (String, [Any?]?)

public class Spy: NSObject {

    private var paramHistory: [SpyRegisteredCall] = []

    public func addCallToHistory(call: String, params: [Any?]? = nil) {

        let callToRegister: SpyRegisteredCall = (call, params)
        paramHistory.append(callToRegister)
    }

    public func wasCallPerformed(call: String) -> Bool {

        let matchingCalls = paramHistory.filter { $0.0 == call }
        return !matchingCalls.isEmpty
    }

    public func callHistoryCount() -> Int {
        return paramHistory.count
    }

    public func didReceive(param: Any?) -> Bool {
        guard let param = param else {
            return false
        }

        let flatParams = paramHistory
            .compactMap { $0.1?.compactMap { $0 } }
            .flatMap { $0 }

        let matchingParams = flatParams
            .filter { SpyComparer.compare(param1: param, param2: $0) }

        return !matchingParams.isEmpty
    }

    public func didReceive(param: Any?, forCall: String) -> Bool {
        guard let param = param else {
            return false
        }

        let matchingCalls = paramHistory
            .filter { forCall == $0.0 }

        let paramsFromMatchingCalls = matchingCalls
            .compactMap { $0.1?.compactMap { $0 } }

        let matchingParams = paramsFromMatchingCalls
            .flatMap { $0 }
            .filter {
                SpyComparer.compare(param1: param, param2: $0)
        }

        return !matchingParams.isEmpty
    }

    public func printCallHistory() {
        paramHistory
            .enumerated()
            .forEach {
                print("Call \($0.offset): <" + $0.element.0 + ">")
        }
    }

    public func callHistory() -> String {
        return paramHistory
            .map { "<" + $0.0 + ">" }
            .joined(separator: ", ")
    }
}
