//
//  MockUITableView.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import UIKit
@testable import ISS

class MockUITableView: UITableView, Mockable {
    var mockDataContainer = MockDataContainer()
    
    struct InvocationKeys {
        static let reloadData = "reloadData"
    }
    
    override func reloadData() {
        record(invocation: InvocationKeys.reloadData)
    }
}

