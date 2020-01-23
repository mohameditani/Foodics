//
//  Response.swift
//  TestAPI
//
//  Created by mohamed on 4/9/19.
//  Copyright © 2019 mohamed. All rights reserved.
//

import UIKit

public class Response: NSObject {
    
    var status : Int = 0
    var data: Any!
    var message: String =  ""
    
    
    public init(status:Int,data:Any,message:String) {
        self.status = status
        self.data = data
        self.message = message
    }
    
    
    
    static func initFromError(error:Error)->Response {
        
        let response = Response.init(status: -1, data: "", message: error.localizedDescription)

        return response
        
    }
    
}
