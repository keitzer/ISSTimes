//
//  StoryboardHelper.swift
//  ISS
//
//  Created by Alex Ogorek on 1/25/18.
//  Copyright © 2018 kata. All rights reserved.
//

import Foundation
import UIKit

class StoryboardHelper {
    static func getVC<T>(withID identifier: String) -> T? {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: identifier) as? T
    }
}
