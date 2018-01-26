//
//  MockAPIClient.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
@testable import ISS

class MockAPIClient: APIClient, Mockable {
    var mockDataContainer = MockDataContainer()
    
    struct InvocationKeys {
        static let getPassOverTimesFor = "getPassOverTimesFor"
    }
    
    func getPassOverTimesFor(latitude: Double, longitude: Double, successBlock: @escaping (PassOverResponse) -> Void, failBlock: @escaping (String) -> Void) {
        record(invocation: InvocationKeys.getPassOverTimesFor, with: latitude, longitude, successBlock, failBlock)
    }
}
