//
//  ResultsViewModelTests.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ISS

class ResultsViewModelTests: QuickSpec {
    override func spec() {
        describe("ResultsViewModel") {
            it("returns the respective value for the given index") {
                let subject = ResultsViewModel()
                subject.passes = [
                    PassOver(duration: 1, risetime: 100),
                    PassOver(duration: 500, risetime: 500)
                ]
                
                let text = subject.getDisplayText(for: 0)
                
                expect(text).to(equal("Time: Dec 31 1970 07:01 PM\nSeconds: 1"))
            }
        }
    }
}
