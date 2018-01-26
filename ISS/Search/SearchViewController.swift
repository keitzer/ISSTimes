//
//  SearchViewController.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import UIKit
import MapKit

class SearchViewController: UIViewController {
    var progressIndicator: ProgressIndicator = GlobalProgressIndicator.shared
    var viewModel = SearchViewModel()
    
    @IBOutlet var latitudeTextField: UITextField!
    @IBOutlet var longitudeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.startGettingLocationUpdates()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapScreen))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func didTapScreen() {
        view.endEditing(true)
    }
    
    @IBAction func getMyLocationPressed() {
        if let loc = viewModel.mostRecentLocation {
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
}
