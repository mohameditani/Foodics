//
//  Response.swift
//  TestAPI
//
//  Created by mohamed on 4/9/19.
//  Copyright © 2019 mohamed. All rights reserved.
//

import UIKit

 class Response: NSObject , NSCoding {
    
    var status : Int = 0
    var data: Any?
    var message: String =  ""
    
    
     init(status:Int,data:Any,message:String) {
           
        self.status = status
        self.data = data
        self.message = message
    }
           
    static func initFromError(error:Error)->Response {
           
        let response = Response.init(status: -1, data: "", message: error.localizedDescription)

        return response
    }
    
    //MARK: NSCoding
    
     func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.status, forKey: "status")
        aCoder.encode(self.data, forKey: "data")
        aCoder.encode(self.message, forKey: "message")

    }
    
   required convenience init?(coder decoder: NSCoder) {

        var status = 0
        var data : Any?
        var message = ""
    
        if let _ = decoder.decodeObject(forKey: "status") as? Int {
            status = decoder.decodeObject(forKey: "status") as! Int
        }

        if let _ = decoder.decodeObject(forKey: "data") {
            data = decoder.decodeObject(forKey: "data")
        }
    
        if let _ = decoder.decodeObject(forKey: "message") as? String {
            message = decoder.decodeObject(forKey: "message") as! String
        }
              
        self.init(status:status,data:data as Any,message:message)
          
      }
    
    
   
    
}
