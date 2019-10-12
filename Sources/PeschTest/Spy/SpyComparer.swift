//
//  SpyComparer.swift
//  PeschCore
//
//  Created by Eugène Peschard on 07/10/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Foundation

public class SpyComparer {

    public static func compare(param1: Any, param2: Any) -> Bool {

        guard let comparable1 = param1 as? SpyComparable,
            let comparable2 = param2 as? SpyComparable else {
                return compareBasicType(param1: param1, param2: param2)
        }

        return comparable1.isEqual(to: comparable2)
    }

    public static func isBasicType(param: Any) -> Bool {

        if param is Int {
            return true
        }

        if param is Double {
            return true
        }

        if param is String {
            return true
        }

        if param is Float {
            return true
        }

        if param is Bool {
            return true
        }

        if param is [Any] {
            return true
        }

        return false
    }

    public static func compareBasicType(param1: Any, param2: Any) -> Bool {

        guard isBasicType(param: param1) else {
            return false
        }

        guard isBasicType(param: param2) else {
            return false
        }

        if let param1Int: Int = paramAs(param: param1),
            let param2Int: Int = paramAs(param: param2) {
            return param1Int == param2Int

        } else if let param1Int: Double = paramAs(param: param1),
            let param2Int: Double = paramAs(param: param2) {
            return param1Int == param2Int

        } else if let param1Int: String = paramAs(param: param1),
            let param2Int: String = paramAs(param: param2) {
            return param1Int == param2Int

        } else if let param1Int: Float = paramAs(param: param1),
            let param2Int: Float = paramAs(param: param2) {
            return param1Int == param2Int

        } else if let param1Bool: Bool = paramAs(param: param1),

            let param2Bool: Bool = paramAs(param: param2) {
            return param1Bool == param2Bool

        } else if let param1Array = param1 as? [Any],
            let param2Array = param2 as? [Any] {

            guard param1Array.count == param2Array.count else {
                return false
            }

            return zip(param1Array, param2Array)
                .reduce(true, { (previousResult, tuple) -> Bool in
                    guard previousResult else {
                        return false
                    }
                    return compare(param1: tuple.0, param2: tuple.1)
                })
        }

        return false
    }
}

private extension SpyComparer {

    static func paramAs<T>(param: Any) -> T? {
        return param as? T
    }
}
