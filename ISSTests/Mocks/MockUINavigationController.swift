//
//  MockUINavigationController.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import UIKit
@testable import ISS

class MockUINavigationController: UINavigationController, Mockable {
    var mockDataContainer = MockDataContainer()
    
    struct InvocationKeys {
        static let pushViewController = "pushViewController"
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        record(invocation: InvocationKeys.pushViewController, with: viewController, animated)
        super.pushViewController(viewController, animated: animated)
    }
}

