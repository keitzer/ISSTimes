//
//  ResultsViewModel.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation

class ResultsViewModel: ViewModel {
    var apiClient: APIClient = GlobalAPIClient.shared
    var passes = [PassOver]()
    
    func getDisplayText(for index: Int) -> String {
        let pass = passes[index]
        return "Time: " + pass.risetime.readableDate + "\nSeconds: \(pass.duration)"
    }
}
