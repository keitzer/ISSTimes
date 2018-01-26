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
        describe("SearchViewController") {
            it("has the shared API Client") {
                let subject = SearchViewController()
                
                expect(subject.apiClient).to(beIdenticalTo(GlobalAPIClient.shared))
            }
            
            describe("search pressed") {
                it("calls the getPassOverTimesFor api method with the lat and long text values") {
                    let mockClient = MockAPIClient()
                    let subject = SearchViewController()
                    subject.latitudeTextField = UITextField()
                    subject.longitudeTextField = UITextField()
                    subject.latitudeTextField.text = "12"
                    subject.longitudeTextField.text = "75"
                    subject.apiClient = mockClient
                    
                    subject.searchPressed()
                    
                    let params = mockClient.parameters(for: MockAPIClient.InvocationKeys.getPassOverTimesFor)
                    
                    expect(mockClient).to(invoke(MockAPIClient.InvocationKeys.getPassOverTimesFor))
                    expect(params?[0] as? Double).to(equal(12))
                    expect(params?[1] as? Double).to(equal(75))
                }
            }
        }
    }
}
