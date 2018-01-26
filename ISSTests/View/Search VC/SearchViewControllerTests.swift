//
//  SearchViewControllerTests.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ISS

class SearchViewControllerTests: QuickSpec {
    override func spec() {
        describe("SearchViewController") {
            it("has the shared API Client") {
                let subject = SearchViewController()
                
                expect(subject.apiClient).to(beIdenticalTo(GlobalAPIClient.shared))
            }
        }
    }
}
