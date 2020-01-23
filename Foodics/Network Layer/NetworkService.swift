//
//  NetworkService.swift
//  Foodics
//
//  Created by mohamed on 1/22/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import UIKit
import PromiseKit
import SwiftyJSON

class NetworkService: NSObject {

    static let shared = NetworkService()

     var categoriesUrl = API_SERVER_URL + "/categories"
    
     var productsUrl = API_SERVER_URL + "/products?include=category"
    
    
    //MARK: API's
    
     func getCategories() -> Promise<Any> {
        
      return Promise { seal in
        
        NetworkManager.requestGetURL(url: categoriesUrl)
                        
            .done { json -> Void in
                
                if let convertedJson = json as? JSON {
                    
                     if let jsonArr = convertedJson["data"].array {
                       
                        let arr = Category.parseData(jsonArr: jsonArr)
                        
                        let response = Response.init(status: 1, data: arr, message: "")
                        
                        DataManager.shared.saveResponse(response: response, url: self.categoriesUrl)
                        
                        seal.fulfill(response)

                        return
                    }
                }
            }
            .catch { error in
                
                let response = DataManager.shared.loadResponse(url: self.categoriesUrl)
                
                if let _ = response {
                    
                    seal.fulfill(response as Any)
                }
                
                seal.reject(error)
            }
        }
    }
    
     func getProducts() -> Promise<Any> {
           
         return Promise { seal in
           
           NetworkManager.requestGetURL(url: productsUrl)
                           
               .done { json -> Void in
                   
                   if let convertedJson = json as? JSON {
                       
                        if let jsonArr = convertedJson["data"].array {
                          
                           let arr = Product.parseData(jsonArr: jsonArr)

                           let response = Response.init(status: 1, data: arr, message: "")
                           
                            DataManager.shared.saveResponse(response: response, url: self.productsUrl)

                           seal.fulfill(response)

                           return
                       }
                   }
               }
               .catch { error in
                
                    let response = DataManager.shared.loadResponse(url: self.productsUrl)

                    if let _ = response {
                        seal.fulfill(response as Any)
                    }
                
                   seal.reject(error)
               }
           }
       }
    
  

    
    
    
}
