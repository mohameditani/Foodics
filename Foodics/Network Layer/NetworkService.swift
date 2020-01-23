//
//  NetworkService.swift
//  Foodics
//
//  Created by mohamed on 1/22/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import UIKit

public typealias APICompletionHandler = (_ success:Bool,_ result:Response?) -> Void

class NetworkService: NSObject {

    static var categoriesUrl = API_SERVER_URL + "/categories"
    
    static var productsUrl = API_SERVER_URL + "/products?include=category"
    
    
    //MARK: API's
    
    static func getCategories(completionHandler:APICompletionHandler?){
        
        NetworkManager.shared.requestGETURL(categoriesUrl, success: { (json) in
            
            if let jsonArr = json["data"].array {
                
                let arr = Category.parseData(jsonArr: jsonArr)

                let response = Response.init(status: 1, data: arr, message: "")
                
                if let _ = completionHandler {
                    completionHandler!(true,response)
                }
                
                return
            }
                            
            if let _ = completionHandler {
                  completionHandler!(false,nil)
              }
            
         }) { (error) in
             
             let response = Response.initFromError(error: error)
                
                if let _ = completionHandler {
                    
                    completionHandler!(false,response)
                }
             
                print(error)
         }
    }
    
    static func getProducts(completionHandler:APICompletionHandler?) {
        
        NetworkManager.shared.requestGETURL(productsUrl, success: { (json) in

            if let jsonArr = json["data"].array {

                let arr = Product.parseData(jsonArr:jsonArr)
             
                let response = Response.init(status: 1, data: arr, message: "")

                if let _ = completionHandler {
                        
                    completionHandler!(true,response)
                }
                
                return
            }
            
            if let _ = completionHandler {
                
                 completionHandler!(false,nil)
             }
            
           }) { (error) in
               
               let response = Response.initFromError(error: error)
               completionHandler!(false,response)
               
               print(error)
               
           }
    }
    
    
    
}
