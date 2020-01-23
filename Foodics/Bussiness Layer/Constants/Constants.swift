//
//  Constants.swift
//  Foodics
//
//  Created by mohamed on 1/22/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import Foundation
import UIKit

//MARK: API constants

let API_SERVER_URL: String! = (Bundle.main.infoDictionary!)["API_SERVER_URL"] as? String

let API_TOKEN: String! = (Bundle.main.infoDictionary!)["API_TOKEN"] as? String

let TIMEOUT_INTERVAL = 60.0


//MARK : Others

let MAX_CELL_COUNT = 20


//MARK: Colors

let DARK_GRAY_COLOR = UIColor.init(red: 43, green: 42, blue: 41)

let YELLOW_COLOR = UIColor.init(red: 206, green: 219, blue: 29)
