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
            }
        }
    }
}
