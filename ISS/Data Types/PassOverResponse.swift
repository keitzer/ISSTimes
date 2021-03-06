//
//  PassOverResponse.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation

class PassOverResponse: Equatable {
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static func ==(lhs: PassOverResponse, rhs: PassOverResponse) -> Bool {
        return lhs.request == rhs.request
            && lhs.passes == rhs.passes
    }
    
    let request: PassOverRequest
    let passes: [PassOver]
    
    init(request: PassOverRequest, passes: [PassOver]) {
        self.request = request
        self.passes = passes
    }
    
    init?(fromDict dictionary: [String: Any]) {
        guard let requestData = dictionary["request"] as? [String: Any],
            let passesData = dictionary["response"] as? [[String: Any]],
            let request = PassOverRequest(fromDict: requestData) else {
                return nil
        }
        var passes = [PassOver]()
        
        for (dict) in passesData {
            if let pass = PassOver(fromDict: dict) {
                passes.append(pass)
            }
        }
        
        self.request = request
        self.passes = passes
    }
}
