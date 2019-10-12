//
//  SpyComparableProtocol.swift
//  PeschCore
//
//  Created by Eugène Peschard on 07/10/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//


import Foundation

public protocol SpyComparable {
    func isEqual(to comparable: SpyComparableInterface) -> Bool
}
