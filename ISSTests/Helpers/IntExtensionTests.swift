//
//  IntExtensionTests.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ISS

class IntExtensionTests: QuickSpec {
    override func spec() {
        describe("IntExtension") {
            it("converts a number to a readable date") {
                let subject = 100.readableDate
                
                expect(subject).to(equal("Dec 31 1970 07:01 PM"))
            }
        }
    }
}
