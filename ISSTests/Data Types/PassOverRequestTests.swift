//
//  PassOverRequestTests.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ISS

class PassOverRequestTests: QuickSpec {
    override func spec() {
        describe("PassOverRequest") {
            describe("equality") {
                it("returns true when all are equal") {
                    let item1 = PassOverRequest(altitude: 10, datetime: 10, latitude: 10.5, longitude: 20.5, passes: 10)
                    let item2 = PassOverRequest(altitude: 10, datetime: 10, latitude: 10.5, longitude: 20.5, passes: 10)
                    
                    expect(item1).to(equal(item2))
                }
                
                it("returns false when altitude is different") {
                    let item1 = PassOverRequest(altitude: 10, datetime: 10, latitude: 10.5, longitude: 20.5, passes: 10)
                    let item2 = PassOverRequest(altitude: 20, datetime: 10, latitude: 10.5, longitude: 20.5, passes: 10)
                    
                    expect(item1).notTo(equal(item2))
                }
                
                it("returns false when datetime is different") {
                    let item1 = PassOverRequest(altitude: 10, datetime: 10, latitude: 10.5, longitude: 20.5, passes: 10)
                    let item2 = PassOverRequest(altitude: 10, datetime: 20, latitude: 10.5, longitude: 20.5, passes: 10)
                    
                    expect(item1).notTo(equal(item2))
                }
                
                it("returns false when latitude is different") {
                    let item1 = PassOverRequest(altitude: 10, datetime: 10, latitude: 10.5, longitude: 20.5, passes: 10)
                    let item2 = PassOverRequest(altitude: 10, datetime: 10, latitude: 20.5, longitude: 20.5, passes: 10)
                    
                    expect(item1).notTo(equal(item2))
                }
                
                it("returns false when longitude is different") {
                    let item1 = PassOverRequest(altitude: 10, datetime: 10, latitude: 10.5, longitude: 20.5, passes: 10)
                    let item2 = PassOverRequest(altitude: 10, datetime: 10, latitude: 10.5, longitude: 30.5, passes: 10)
                    
                    expect(item1).notTo(equal(item2))
                }
                
                it("returns false when passes is different") {
                    let item1 = PassOverRequest(altitude: 10, datetime: 10, latitude: 10.5, longitude: 20.5, passes: 10)
                    let item2 = PassOverRequest(altitude: 10, datetime: 10, latitude: 10.5, longitude: 20.5, passes: 20)
                    
                    expect(item1).notTo(equal(item2))
                }
            }
            
            describe("init from dictionary") {
                it("can be initialized successfully from dictionary") {
                    let subject = PassOverRequest(fromDict: [
                        "altitude": 100
                        "datetime": 500
                        "latitude": 10.8
                        "longitude": 12.1
                        "passes": 16
                    ])
                    
                    expect(subject).notTo(beNil())
                }
            }
        }
    }
}
