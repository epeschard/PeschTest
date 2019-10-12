//
//  CoreLocationFactory.swift
//  PeschCore
//
//  Created by Eugène Peschard on 10/10/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Foundation
import MapKit

public extension CLLocation {

    public static func random() -> CLLocation {
        return CLLocation(
            latitude: Double.random(in: 40.0001...41),
            longitude: Double.random(in: -0.0001...1)
        )
    }
}

public extension CLLocation: SpyComparableInterface {
    public func isEqual(to comparable: SpyComparableInterface) -> Bool {
        guard let rhs = comparable as? CLLocation else {
            return false
        }

        return coordinate.latitude == rhs.coordinate.latitude && coordinate.longitude == rhs.coordinate.longitude
    }
}

public extension CLLocationCoordinate2D {

    public static func random() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: Double.random(in: 40.0001...41),
            longitude: Double.random(in: -0.0001...1)
        )
    }
}

public extension CLLocationCoordinate2D: SpyComparableInterface {
    public func isEqual(to comparable: SpyComparableInterface) -> Bool {
        guard let rhs = comparable as? CLLocationCoordinate2D else {
            return false
        }

        return latitude == rhs.latitude && longitude == rhs.longitude
    }
}
