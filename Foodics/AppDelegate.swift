//
//  AppDelegate.swift
//  Foodics
//
//  Created by mohamed on 1/22/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var categoriesArr = [Category]()
    var productsArr = [Product]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        return true
    }


}

