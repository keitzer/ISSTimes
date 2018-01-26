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
import CoreLocation
@testable import ISS

class SearchViewControllerTests: QuickSpec {
    override func spec() {
        var subject: SearchViewController!
        
        beforeEach {
            subject = SearchViewController()
            subject.latitudeTextField = UITextField()
            subject.longitudeTextField = UITextField()
        }
        
        describe("SearchViewController") {
            it("has the shared Progress Indicator") {
                expect(subject.progressIndicator).to(beIdenticalTo(GlobalProgressIndicator.shared))
            }
            
            describe("get location pressed") {
                it("fills in the text field from the most recent location") {
                    subject.mostRecentLocation = CLLocation(latitude: 10, longitude: 50)
                    
                    subject.getMyLocationPressed()
                    
                    expect(subject.latitudeTextField.text).to(equal("10.0"))
                    expect(subject.longitudeTextField.text).to(equal("50.0"))
                }
            }
            
            describe("search") {
                var mockProgressIndicator: MockProgressIndicator!
                var mockViewModel: MockSearchViewModel!
                
                beforeEach {
                    mockProgressIndicator = MockProgressIndicator()
                    mockViewModel = MockSearchViewModel()
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
                    var expectedPasses: [PassOver]!
                    var mockNavController: MockUINavigationController!
                    
                    beforeEach {
                        mockNavController = MockUINavigationController(rootViewController: subject)
                        mockNavController.reset()
                        
                        expectedPasses = [
                            PassOver(duration: 10, risetime: 20),
                            PassOver(duration: 20, risetime: 50)
                        ]
                        
                        let response = PassOverResponse(request: PassOverRequest(altitude: 1, datetime: 1, latitude: 1, longitude: 1, passes: 1), passes: expectedPasses)
                        
                        subject.handleSearchSuccess(response: response)
                    }
                    
                    it("hides the progress indicator") {
                        expect(mockProgressIndicator).to(invoke(MockProgressIndicator.InvocationKeys.dismiss))
                    }
                    
                    it("sets the view model passes") {
                        let pushedVC: ResultsTableViewController? = mockNavController.parameter(for: MockUINavigationController.InvocationKeys.pushViewController, atParameterIndex: 0)
                        
                        expect(pushedVC?.viewModel.passes).to(equal(expectedPasses))
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
