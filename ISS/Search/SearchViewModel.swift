//
//  SearchViewModel.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import CoreLocation

class SearchViewModel: NSObject, ViewModel, CLLocationManagerDelegate {
    var apiClient: APIClient = GlobalAPIClient.shared
    var mostRecentLocation: CLLocation?
    var locationManager = CLLocationManager()
    
    func startGettingLocationUpdates() {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
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
    
    // MARK: - Core Loc Delegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            mostRecentLocation = locations[0]
        }
    }
}
