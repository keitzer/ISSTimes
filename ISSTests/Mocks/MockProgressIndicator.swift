//
//  MockProgressIndicator.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
@testable import ISS

class MockProgressIndicator: ProgressIndicator, Mockable {
    var mockDataContainer = MockDataContainer()
    
    struct InvocationKeys {
        static let showWithStatus = "showWithStatus"
        static let dismiss = "dismiss"
    }
    
    func show(with status: String) {
        record(invocation: InvocationKeys.showWithStatus, with: status)
    }
    
    func dismiss() {
        record(invocation: InvocationKeys.dismiss)
    }
}
