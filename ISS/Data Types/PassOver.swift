//
//  PassOver.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation

class PassOver: Equatable {
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static func ==(lhs: PassOver, rhs: PassOver) -> Bool {
        return lhs.duration == rhs.duration
            && lhs.risetime == rhs.risetime
    }
    
    let duration: Int
    let risetime: Int
    
    init(duration: Int, risetime: Int) {
        self.duration = duration
        self.risetime = risetime
    }
    
    init?(fromDict dictionary: [String: Any]) {
        guard let duration = dictionary["duration"] as? Int,
            let risetime = dictionary["risetime"] as? Int else {
                return nil
        }
        
        self.duration = duration
        self.risetime = risetime
    }
}
