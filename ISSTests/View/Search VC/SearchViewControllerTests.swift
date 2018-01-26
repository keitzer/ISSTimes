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
        var subject: SearchViewController!
        
        describe("SearchViewController") {
            it("has the shared API Client") {
                subject = SearchViewController()
                
                expect(subject.apiClient).to(beIdenticalTo(GlobalAPIClient.shared))
            }
            it("has the shared Progress Indicator") {
                subject = SearchViewController()
                
                expect(subject.progressIndicator).to(beIdenticalTo(GlobalProgressIndicator.shared))
            }
            
            describe("search pressed") {
                var mockClient: MockAPIClient!
                var mockProgressIndicator: MockProgressIndicator!
                
                beforeEach {
                    mockClient = MockAPIClient()
                    mockProgressIndicator = MockProgressIndicator()
                    
                    subject = SearchViewController()
                    subject.latitudeTextField = UITextField()
                    subject.longitudeTextField = UITextField()
                    subject.apiClient = mockClient
                    subject.progressIndicator = mockProgressIndicator
                    subject.latitudeTextField.text = "12"
                    subject.longitudeTextField.text = "75"
                }
                
                it("calls the getPassOverTimesFor api method with the lat and long text values") {
                    subject.searchPressed()
                    
                    let params = mockClient.parameters(for: MockAPIClient.InvocationKeys.getPassOverTimesFor)
                    
                    expect(mockClient).to(invoke(MockAPIClient.InvocationKeys.getPassOverTimesFor))
                    expect(params?[0] as? Double).to(equal(12))
                    expect(params?[1] as? Double).to(equal(75))
                }
                
                it("shows the progress indicator") {
                    subject.searchPressed()
                    
                    expect(mockProgressIndicator).to(invoke(MockProgressIndicator.InvocationKeys.showWithStatus, withParameter: "Searching"))
                }
            }
        }
    }
}
