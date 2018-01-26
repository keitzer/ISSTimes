//
//  SearchViewController.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    var progressIndicator: ProgressIndicator = GlobalProgressIndicator.shared
    var viewModel = SearchViewModel()
    
    @IBOutlet var latitudeTextField: UITextField!
    @IBOutlet var longitudeTextField: UITextField!
    
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
