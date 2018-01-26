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
            describe("equality") {
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
            }
            
            describe("init from dictionary") {
                it("can be loaded from dictionary") {
                    let item = PassOver(fromDict: [
                            "duration" : 50,
                            "risetime" : 1000,
                        ])
                    
                    expect(item).notTo(beNil())
                    expect(item?.duration).to(equal(50))
                    expect(item?.risetime).to(equal(1000))
                }
                
                it("returns nil when duration is missing") {
                    let item = PassOver(fromDict: [
                            "risetime" : 1000
                        ])
                    
                    expect(item).to(beNil())
                }
                
                it("returns nil when risetime is missing") {
                    let item = PassOver(fromDict: [
                            "duration" : 50
                        ])
                    
                    expect(item).to(beNil())
                }
                
                it("returns nil when duration cannot be cast to an int directly") {
                    let item = PassOver(fromDict: [
                            "duration" : "500",
                            "risetime" : 1000,
                        ])
                    
                    expect(item).to(beNil())
                }
                
                it("returns nil when risetime cannot be cast to an int directly") {
                    let item = PassOver(fromDict: [
                            "duration" : 50,
                            "risetime" : "1000",
                        ])
                    
                    expect(item).to(beNil())
                }
            }
        }
    }
}
