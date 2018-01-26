//
//  PassOverResponseTests.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ISS

class PassOverResponseTests: QuickSpec {
    override func spec() {
        describe("PassOverResponse") {
            describe("equality") {
                it("returns true when all are equal") {
                    let request1 = PassOverRequest(altitude: 10, datetime: 10, latitude: 10, longitude: 10, passes: 10)
                    let request2 = PassOverRequest(altitude: 10, datetime: 10, latitude: 10, longitude: 10, passes: 10)
                    let passes1 = [PassOver(duration: 10, risetime: 10), PassOver(duration: 20, risetime: 20)]
                    let passes2 = [PassOver(duration: 10, risetime: 10), PassOver(duration: 20, risetime: 20)]
                    
                    let item1 = PassOverResponse(request: request1, passes: passes1)
                    let item2 = PassOverResponse(request: request2, passes: passes2)
                    
                    expect(item1).to(equal(item2))
                }
                
                it("returns false when request is different") {
                    let request1 = PassOverRequest(altitude: 10, datetime: 10, latitude: 10, longitude: 10, passes: 10)
                    let request2 = PassOverRequest(altitude: 20, datetime: 10, latitude: 10, longitude: 10, passes: 10)
                    let passes1 = [PassOver(duration: 10, risetime: 10), PassOver(duration: 20, risetime: 20)]
                    let passes2 = [PassOver(duration: 10, risetime: 10), PassOver(duration: 20, risetime: 20)]
                    
                    let item1 = PassOverResponse(request: request1, passes: passes1)
                    let item2 = PassOverResponse(request: request2, passes: passes2)
                    
                    expect(item1).notTo(equal(item2))
                }
                
                it("returns false when passes is different") {
                    let request1 = PassOverRequest(altitude: 10, datetime: 10, latitude: 10, longitude: 10, passes: 10)
                    let request2 = PassOverRequest(altitude: 10, datetime: 10, latitude: 10, longitude: 10, passes: 10)
                    let passes1 = [PassOver(duration: 10, risetime: 10), PassOver(duration: 20, risetime: 20)]
                    let passes2 = [PassOver(duration: 20, risetime: 20)]
                    
                    let item1 = PassOverResponse(request: request1, passes: passes1)
                    let item2 = PassOverResponse(request: request2, passes: passes2)
                    
                    expect(item1).notTo(equal(item2))
                }
            }
            
            describe("init from dictionary") {
                it("can be initialized successfully from dictionary") {
                    let data: [String: Any] = [
                        "message": "success",
                        "request": [
                            "altitude": 100,
                            "datetime": 1516925875,
                            "latitude": 50.2,
                            "longitude": 100.1,
                            "passes": 5
                        ],
                        "response": [
                            [
                                "duration": 555,
                                "risetime": 1516966899
                            ],
                            [
                                "duration": 637,
                                "risetime": 1516972617
                            ]
                        ]
                    ]
                    
                    let subject = PassOverResponse(fromDict: data)
                    
                    expect(subject).notTo(beNil())
                    
                }
                
                // For the sake of time and my sanity I will not include all permutations and "what if this thing couldn't be interpreted" scenarios. If you want to see an example of this, look at PassOverTests.swift
            }
        }
    }
}
