//
//  MockSearchViewModel.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
@testable import ISS

class MockSearchViewModel: SearchViewModel, Mockable {
    var mockDataContainer = MockDataContainer()
    
    struct InvocationKeys {
        static let getPassOverTimesFor = "getPassOverTimesFor"
        static let startGettingLocationUpdates = "startGettingLocationUpdates"
    }
    
    override func getPassOverTimesFor(latitude incomingLatText: String?, longitude incomingLongText: String?, successBlock: ((PassOverResponse) -> Void)? = nil, failBlock: ((String) -> Void)? = nil) {
        record(invocation: InvocationKeys.getPassOverTimesFor, with: incomingLatText, incomingLongText, successBlock, failBlock)
    }
    
    override func startGettingLocationUpdates() {
        record(invocation: InvocationKeys.startGettingLocationUpdates)
    }
}
