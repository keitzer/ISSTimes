//
//  SearchViewController.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SearchViewController: UIViewController, CLLocationManagerDelegate {
    var progressIndicator: ProgressIndicator = GlobalProgressIndicator.shared
    var viewModel = SearchViewModel()
    
    @IBOutlet var latitudeTextField: UITextField!
    @IBOutlet var longitudeTextField: UITextField!
    var mostRecentLocation: CLLocation?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapScreen))
        view.addGestureRecognizer(tapGesture)
        
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    @objc func didTapScreen() {
        view.endEditing(true)
    }
    
    @IBAction func getMyLocationPressed() {
        if let loc = mostRecentLocation {
            latitudeTextField.text = "\(loc.coordinate.latitude)"
            longitudeTextField.text = "\(loc.coordinate.longitude)"
        } else {
            AlertHelper.show(title: "Whoops", message: "You need to enable location in Settings in order to use this feature.")
        }
    }
    
    @IBAction func searchPressed() {
        progressIndicator.show(with: "Searching")
        viewModel.getPassOverTimesFor(latitude: latitudeTextField.text, longitude: longitudeTextField.text, successBlock: handleSearchSuccess, failBlock: handleSearchFail)
    }
    
    func handleSearchSuccess(response: PassOverResponse) {
        progressIndicator.dismiss()
        
        if let vc: ResultsTableViewController = StoryboardHelper.getVC(withID: "Results") {
            vc.viewModel.passes = response.passes
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func handleSearchFail(message: String) {
        progressIndicator.dismiss()
        AlertHelper.show(title: "Whoops", message: message)
    }
    
    // MARK: - Core Loc Delegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            mostRecentLocation = locations[0]
        }
    }
}
