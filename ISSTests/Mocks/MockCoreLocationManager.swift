//
//  MockCoreLocationManager.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import CoreLocation

class MockCoreLocationManager: CLLocationManager, Mockable {
    var mockDataContainer = MockDataContainer()
    
    struct InvocationKeys {
        static let requestWhenInUseAuthorization = "requestWhenInUseAuthorization"
        static let startUpdatingLocation = "startUpdatingLocation"
    }
    
    override func requestWhenInUseAuthorization() {
        record(invocation: InvocationKeys.requestWhenInUseAuthorization)
    }
    
    override func startUpdatingLocation() {
        record(invocation: InvocationKeys.startUpdatingLocation)
    }
}
