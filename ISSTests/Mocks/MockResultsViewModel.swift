//
//  MockResultsViewModel.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
@testable import ISS

class MockResultsViewModel: ResultsViewModel, Mockable {
    var mockDataContainer = MockDataContainer()
    
    struct InvocationKeys {
        static let getDisplayText = "getDisplayText"
    }
    
    override func getDisplayText(for index: Int) -> String {
        record(invocation: InvocationKeys.getDisplayText, with: index)
        return returnValue(for: InvocationKeys.getDisplayText) ?? ""
    }
}
