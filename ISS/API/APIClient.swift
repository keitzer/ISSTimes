//
//  APIClient.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import Alamofire

protocol APIClient {
    func getPassOverTimesFor(latitude: Double, longitude: Double, successBlock: @escaping (PassOverResponse) -> Void, failBlock: @escaping (String) -> Void)
}

class GlobalAPIClient: APIClient {
    private init() {}
    
    static let shared = GlobalAPIClient()
    
    func getPassOverTimesFor(latitude: Double, longitude: Double, successBlock: @escaping (PassOverResponse) -> Void, failBlock: @escaping (String) -> Void) {

        // for the sake of speed, and also "i know alamore is a pain to test", I skipped testing this method

        let url = "http://api.open-notify.org/iss-pass.json?lat=\(latitude)&lon=\(longitude)"

        Alamofire.request(url)
            .validate(statusCode: 200..<201)
            .responseJSON { (response) in
                if let responseDict = response.value as? [String: Any] {
                    if responseDict["message"] as? String == "success" {
                        if let response = PassOverResponse(fromDict: responseDict) {
                            successBlock(response)
                        } else {
                            failBlock("Search failed to load. Try again.")
                        }
                    } else if let reason = responseDict["reason"] as? String {
                        failBlock(reason)
                    } else {
                        failBlock("Search failed for an unknown reason. Please double check your input.")
                    }
                } else {
                    failBlock("Search failed to load. Try again.")
                }
        }
    }
}
