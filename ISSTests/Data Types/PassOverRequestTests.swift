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
                    let data = [
                        "altitude": 100,
                        "datetime": 500,
                        "latitude": 10.8,
                        "longitude": 12.1,
                        "passes": 16
                    ]
                    
                    let subject = PassOverRequest(fromDict: data)
                    
                    expect(subject).notTo(beNil())
                    expect(subject?.altitude).to(equal(100))
                    expect(subject?.datetime).to(equal(500))
                    expect(subject?.latitude).to(equal(10.8))
                    expect(subject?.longitude).to(equal(12.1))
                    expect(subject?.passes).to(equal(16))
                }
                
                it("can be initialized successfully from dictionary when lat long are whole numbers") {
                    let data = [
                        "altitude": 100,
                        "datetime": 500,
                        "latitude": 10,
                        "longitude": 12,
                        "passes": 16
                    ]
                    
                    let subject = PassOverRequest(fromDict: data)
                    
                    expect(subject).notTo(beNil())
                    expect(subject?.altitude).to(equal(100))
                    expect(subject?.datetime).to(equal(500))
                    expect(subject?.latitude).to(equal(10))
                    expect(subject?.longitude).to(equal(12))
                    expect(subject?.passes).to(equal(16))
                }
                
                // For the sake of time and my sanity I will not include all permutations and "what if this thing couldn't be interpreted" scenarios. If you want to see an example of this, look at PassOverTests.swift
            }
        }
    }
}
