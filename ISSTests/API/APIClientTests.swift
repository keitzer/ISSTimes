//
//  APIClientTests.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SVProgressHUD
@testable import ISS

class GlobalAPIClientTests: QuickSpec {
    override func spec() {
        describe("APIClient") {
            it("only creates one instance") {
                let someInstance = GlobalAPIClient.shared
                let otherInstance = GlobalAPIClient.shared
                
                expect(someInstance).to(beIdenticalTo(otherInstance))
            }
        }
    }
}

