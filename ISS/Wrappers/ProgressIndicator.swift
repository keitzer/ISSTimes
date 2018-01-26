//
//  ProgressIndicator.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import SVProgressHUD

protocol ProgressIndicator {
    func show(with status: String)
    func dismiss()
}

class GlobalProgressIndicator: ProgressIndicator {
    private init() {}
    
    static let shared = GlobalProgressIndicator()
    
    func show(with status: String) {
        SVProgressHUD.show(withStatus: status)
    }
    
    func dismiss() {
        SVProgressHUD.dismiss()
    }
}

