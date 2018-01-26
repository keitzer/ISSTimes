//
//  SearchViewController.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    var apiClient: APIClient = GlobalAPIClient.shared
    @IBOutlet var latitudeTextField: UITextField!
    @IBOutlet var longitudeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func searchPressed() {
        if let latText = latitudeTextField.text,
            let longText = longitudeTextField.text,
            let latitude = Double(latText),
            let longitude = Double(longText) {
            
            apiClient.getPassOverTimesFor(latitude: latitude, longitude: longitude, successBlock: handleSearchSuccess, failBlock: handleSearchFail)
        }
    }
    
    func handleSearchSuccess(response: PassOverResponse) {
        
    }
    
    func handleSearchFail(message: String) {
        
    }
}
