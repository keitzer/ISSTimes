//
//  PassOverTests.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ISS

class PassOverTests: QuickSpec {
    override func spec() {
        describe("PassOver") {
            it("returns true when all are equal") {
                let item1 = PassOver(duration: 10, risetime: 100)
                let item2 = PassOver(duration: 10, risetime: 100)
                
                expect(item1).to(equal(item2))
            }
            
            it("returns false when duration is different") {
                let item1 = PassOver(duration: 10, risetime: 100)
                let item2 = PassOver(duration: 20, risetime: 100)
                
                expect(item1).notTo(equal(item2))
            }
            
            it("returns false when risetime is different") {
                let item1 = PassOver(duration: 10, risetime: 100)
                let item2 = PassOver(duration: 10, risetime: 200)
                
                expect(item1).notTo(equal(item2))
            }
            
            it("can be loaded from dictionary") {
                let item = PassOver(fromDict: [
                    "name" : "Value",
                    "image" : "Image name",
                    ])
                
                expect(item).notTo(beNil())
            }
        }
    }
}
