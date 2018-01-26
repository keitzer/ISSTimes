//
//  PassOverRequest.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation

class PassOverRequest: Equatable {
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static func ==(lhs: PassOverRequest, rhs: PassOverRequest) -> Bool {
        return lhs.altitude == rhs.altitude
            && lhs.datetime == rhs.datetime
            && lhs.latitude == rhs.latitude
            && lhs.longitude == rhs.longitude
            && lhs.passes == rhs.passes
    }
    
    let altitude: Int
    let datetime: Int
    let latitude: Float
    let longitude: Float
    let passes: Int
    
    init(altitude: Int, datetime: Int, latitude: Float, longitude: Float, passes: Int) {
        self.altitude = altitude
        self.datetime = datetime
        self.latitude = latitude
        self.longitude = longitude
        self.passes = passes
    }
}
