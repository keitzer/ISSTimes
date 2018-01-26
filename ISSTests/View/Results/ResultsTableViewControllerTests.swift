//
//  ResultsTableViewControllerTests.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ISS

class ResultsTableViewControllerTests: QuickSpec {
    override func spec() {
        describe("ResultsTableViewController") {
            var subject: ResultsTableViewController!
            var mockTableView: MockUITableView!
            var mockViewModel: MockResultsViewModel!
            
            beforeEach {
                subject = ResultsTableViewController()
                mockTableView = MockUITableView()
                mockViewModel = MockResultsViewModel()
                subject.viewModel = mockViewModel
            }
            
            describe("view did load") {
                beforeEach {
                    subject.tableView = mockTableView
                    subject.viewDidLoad()
                }
                
                it("reloads the table up") {
                    expect(mockTableView).to(invoke(MockUITableView.InvocationKeys.reloadData))
                }
            }
            
            describe("cell for row at index path") {
                it("passes the index into the view model get text function") {
                    _ = subject.tableView(mockTableView, cellForRowAt: IndexPath(row: 5, section: 0))
                    
                    expect(mockViewModel).to(invoke(MockResultsViewModel.InvocationKeys.getDisplayText, withParameter: 5))
                }
                
                it("adds the text for the respective Pass to the cell") {
                    subject.viewModel.passes = [
                        PassOver(duration: 10, risetime: 100)
                    ]
                    let expectedText = "Test Text"
                    mockViewModel.setReturnValue(for: MockResultsViewModel.InvocationKeys.getDisplayText, with: expectedText)
                    
                    let cell = subject.tableView(mockTableView, cellForRowAt: IndexPath(row: 0, section: 0))
                    
                    expect(cell.textLabel?.text).to(equal(expectedText))
                    expect(cell.textLabel?.numberOfLines).to(equal(2))
                }
            }
        }
    }
}

