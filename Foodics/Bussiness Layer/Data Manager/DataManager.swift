//
//  DataManager.swift
//  Foodics
//
//  Created by mohamed on 1/23/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import UIKit
import SwiftyJSON

class DataManager: NSObject {
    
   static let shared = DataManager()
    
    var categoriesArr = [Category]()
    var productsArr = [Product]()
        
    func saveResponse(response: Response,url:String){
       
        let data = NSKeyedArchiver.archivedData(withRootObject: response)
        UserDefaults.standard.set(data, forKey: url)
       
    }
    
     func loadResponse(url:String) -> Response? {
        
        if let data = UserDefaults.standard.object(forKey: url) as? NSData {
            return NSKeyedUnarchiver.unarchiveObject(with: data as Data) as? Response
        }
                
        return nil
    }
    
    func getProductsForCategory(cat:Category) -> [Product] {
        
        let products = DataManager.shared.productsArr.filter({$0.category?.id == cat.id})

        return products
    }

}
