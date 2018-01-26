//
//  IntExtensions.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation

extension Int {
    var readableDate: String {
        let date = Date(timeIntervalSince1970: Double(self))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "MMM dd YYYY hh:mm a"

        let dateString = dayTimePeriodFormatter.string(from: date)
        return dateString
    }
}

