//
//  SearchViewModel.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation

class SearchViewModel: ViewModel {
    var apiClient: APIClient = GlobalAPIClient.shared
    
    func getPassOverTimesFor(latitude incomingLatText: String?, longitude incomingLongText: String?, successBlock: ((PassOverResponse) -> Void)? = nil, failBlock: ((String) -> Void)? = nil) {
        if let latText = incomingLatText,
            let longText = incomingLongText,
            let latitude = Double(latText),
            let longitude = Double(longText) {
            
            apiClient.getPassOverTimesFor(latitude: latitude, longitude: longitude, successBlock: successBlock, failBlock: failBlock)
        } else {
            failBlock?("You need to enter numbers for the latitude and longitude.")
        }
        
    }
}
