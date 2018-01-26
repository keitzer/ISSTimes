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
    let latitude: Double
    let longitude: Double
    let passes: Int
    
    init(altitude: Int, datetime: Int, latitude: Double, longitude: Double, passes: Int) {
        self.altitude = altitude
        self.datetime = datetime
        self.latitude = latitude
        self.longitude = longitude
        self.passes = passes
    }
    
    init?(fromDict dictionary: [String: Any]) {
        guard let altitude = dictionary["altitude"] as? Int,
            let datetime = dictionary["datetime"] as? Int,
            let passes = dictionary["passes"] as? Int else {
                return nil
        }
        
        if let latitude = dictionary["latitude"] as? Double {
            self.latitude = latitude
        } else if let latitude = dictionary["latitude"] as? Int {
            self.latitude = Double(latitude)
        } else {
            return nil
        }
        
        if let longitude = dictionary["longitude"] as? Double {
            self.longitude = longitude
        } else if let longitude = dictionary["longitude"] as? Int {
            self.longitude = Double(longitude)
        } else {
            return nil
        }
        
        self.altitude = altitude
        self.datetime = datetime
        self.passes = passes
    }
}
