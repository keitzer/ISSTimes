//
//  ResultsTableViewController.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import UIKit

class ResultsTableViewController: UITableViewController {
    var viewModel = ResultsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        navigationItem.title = "PASSES:"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.passes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let index = indexPath.row
        cell.textLabel?.text = viewModel.getDisplayText(for: index)
        cell.textLabel?.numberOfLines = 2
        
        return cell
    }
}
