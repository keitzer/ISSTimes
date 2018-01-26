//
//  SVProgressHUDWrapperTests.swift
//  ISSTests
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SVProgressHUD
@testable import ISS

class GlobalProgressIndicatorTests: QuickSpec {
    override func spec() {
        describe("SVProgressHUD Wrapper") {
            
            it("only creates one instance") {
                let someInstance = GlobalProgressIndicator.shared
                let otherInstance = GlobalProgressIndicator.shared
                
                expect(someInstance).to(beIdenticalTo(otherInstance))
            }
            
            it("showWithStatus shows the progress HUD") {
                GlobalProgressIndicator.shared.show(with: "Some status")
                
                expect(SVProgressHUD.isVisible()).toEventually(beTrue())
            }
            
            it("dismiss hides the progress HUD") {
                SVProgressHUD.show(withStatus: "Some status")
                
                GlobalProgressIndicator.shared.dismiss()
                
                expect(SVProgressHUD.isVisible()).toEventually(beFalse())
            }
        }
    }
}

