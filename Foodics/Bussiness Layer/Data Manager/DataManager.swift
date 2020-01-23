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
    
    static func saveResponse(_ value: JSON, key: String) {
        
        let ud = UserDefaults.standard
        let archivedPool = try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: true)
        ud.set(archivedPool, forKey: key)
    }
    
   static func loadResponse(key: String) -> JSON? {
          let ud = UserDefaults.standard
          if let val = ud.value(forKey: key) as? Data,
              let obj = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(val) as? JSON {
              return obj
          }
          return nil
      }

}
