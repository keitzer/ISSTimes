//
//  APIClient.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation

protocol APIClient {
    
}

class GlobalAPIClient: APIClient {
    private init() {}
    
    static let shared = GlobalAPIClient()    
}
