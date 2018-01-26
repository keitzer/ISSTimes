//
//  SearchViewModelTests.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
import CoreLocation
@testable import ISS

class SearchViewModelTests: QuickSpec {
    override func spec() {
        var subject: SearchViewModel!
        
        describe("SearchViewModel") {
            it("has the shared API Client") {
                subject = SearchViewModel()
                
                expect(subject.apiClient).to(beIdenticalTo(GlobalAPIClient.shared))
            }
            
            describe("search") {
                var mockClient: MockAPIClient!
                
                beforeEach {
                    mockClient = MockAPIClient()
                    subject = SearchViewModel()
                    subject.apiClient = mockClient
                }
                
                it("calls the getPassOverTimesFor api method with the lat and long text values") {
                    subject.getPassOverTimesFor(latitude: "12", longitude: "75")
                    
                    let params = mockClient.parameters(for: MockAPIClient.InvocationKeys.getPassOverTimesFor)
                    
                    expect(mockClient).to(invoke(MockAPIClient.InvocationKeys.getPassOverTimesFor))
                    expect(params?[0] as? Double).to(equal(12))
                    expect(params?[1] as? Double).to(equal(75))
                }
                
                it("calls the fail block if the values couldn't be converted to numbers") {
                    var message = ""
                    
                    subject.getPassOverTimesFor(latitude: "1F2", longitude: "75BB", failBlock: { error in
                        message = error
                    })
                    
                    expect(message).toEventually(equal("You need to enter numbers for the latitude and longitude."))
                }
            }
            
            describe("core location delegate") {
                it("sets the first location returned to the most recent location") {
                    let fakeManager = CLLocationManager()
                    let loc1 = CLLocation(latitude: 10, longitude: 20)
                    let loc2 = CLLocation(latitude: 30, longitude: 30)
                    let locations = [loc1, loc2]
                    
                    subject.locationManager(fakeManager, didUpdateLocations: locations)
                    
                    expect(subject.mostRecentLocation).to(equal(loc1))
                }
                
                it("doesn't crash or change the most recent location when there are no location updates") {
                    let fakeManager = CLLocationManager()
                    let locations = [CLLocation]()
                    let expectedLoc = CLLocation(latitude: 50, longitude: 50)
                    subject.mostRecentLocation = expectedLoc
                    
                    subject.locationManager(fakeManager, didUpdateLocations: locations)
                    
                    expect(subject.mostRecentLocation).to(equal(expectedLoc))
                }
            }
        }
    }
}
