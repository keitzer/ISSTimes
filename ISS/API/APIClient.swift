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
//    func getPassOverTimesFor(latitude: Float, longitude: Float, successBlock: @escaping (PassOverResponse) -> Void, failBlock: @escaping (String) -> Void)
}

class GlobalAPIClient: APIClient {
    private init() {}
    
    static let shared = GlobalAPIClient()
    
//    func getPassOverTimesFor(latitude: Float, longitude: Float, successBlock: @escaping (PassOverResponse) -> Void, failBlock: @escaping (String) -> Void) {
//
//        // for the sake of speed, and also "i know alamore is a pain to test", I skipped testing this method
//
//        let url = "http://api.open-notify.org/iss-pass.json?lat=\(latitude)&lon=\(longitude)"
//
//        Alamofire.request(url)
//            .validate(statusCode: 200..<201)
//            .responseJSON { (response) in
//                if let responseDict = response.value as? [[String: Any]] {
//                    let requestObject = PassOverRequest(altitude: <#T##Int#>, datetime: <#T##Int#>, latitude: <#T##Float#>, longitude: <#T##Float#>, passes: <#T##Int#>)
//                    let response = PassOverResponse(request: , passes: <#T##[PassOver]#>)
//
//                    successBlock(list)
//                }
//                else {
//                    failBlock("Menu failed to load. Try again.")
//                }
//        }
//    }
}
