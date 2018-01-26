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
            it("has the shared Progress Indicator") {
                subject = SearchViewController()
                
                expect(subject.progressIndicator).to(beIdenticalTo(GlobalProgressIndicator.shared))
            }
            
            describe("search") {
                var mockProgressIndicator: MockProgressIndicator!
                var mockViewModel: MockSearchViewModel!
                
                beforeEach {
                    mockProgressIndicator = MockProgressIndicator()
                    mockViewModel = MockSearchViewModel()
                    
                    subject = SearchViewController()
                    subject.latitudeTextField = UITextField()
                    subject.longitudeTextField = UITextField()
                    subject.progressIndicator = mockProgressIndicator
                    subject.latitudeTextField.text = "12"
                    subject.longitudeTextField.text = "75"
                    subject.viewModel = mockViewModel
                }
                
                describe("search pressed") {
                    beforeEach {
                        subject.searchPressed()
                    }
                    
                    it("calls the getPassOverTimesFor view model method with the lat and long text values") {
                        let params = mockViewModel.parameters(for: MockSearchViewModel.InvocationKeys.getPassOverTimesFor)
                        
                        expect(mockViewModel).to(invoke(MockSearchViewModel.InvocationKeys.getPassOverTimesFor))
                        expect(params?[0] as? String).to(equal("12"))
                        expect(params?[1] as? String).to(equal("75"))
                    }
                    
                    it("shows the progress indicator") {
                        expect(mockProgressIndicator).to(invoke(MockProgressIndicator.InvocationKeys.showWithStatus, withParameter: "Searching"))
                    }
                }
                
                describe("on search success") {
                    beforeEach {
                        let response = PassOverResponse(request: PassOverRequest(altitude: 1, datetime: 1, latitude: 1, longitude: 1, passes: 1), passes: [])
                        
                        subject.handleSearchSuccess(response: response)
                    }
                    
                    it("hides the progress indicator") {
                        expect(mockProgressIndicator).to(invoke(MockProgressIndicator.InvocationKeys.dismiss))
                    }
                }
                
                describe("on search failure") {
                    beforeEach {
                        subject.handleSearchFail(message: "Message")
                    }
                    
                    it("hides the progress indicator") {
                        expect(mockProgressIndicator).to(invoke(MockProgressIndicator.InvocationKeys.dismiss))
                    }
                }
            }
        }
    }
}
