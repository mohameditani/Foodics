//
//  NetworkManager.swift
//  TestAPI
//
//  Created by mohamed on 4/9/19.
//  Copyright © 2019 mohamed. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import PromiseKit

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    static var categoriesUrl = API_SERVER_URL + "/categories"
    static var productsUrl = API_SERVER_URL + "/products?include=category"

    private let manager: Alamofire.SessionManager = {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TIMEOUT_INTERVAL
        
        return Alamofire.SessionManager(configuration: configuration)
        
    }()
    
    //MARK: Helpers
    static func getHeaders() -> HTTPHeaders {
        
        let headers: HTTPHeaders = [
            "Authorization": String(format: "Bearer %@", API_TOKEN),
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        return headers
    }
    
    //MARK: API
        
    static func requestGetURL(url:String) -> Promise<Any> {
        
        return Promise { seal in
            Alamofire.request(url,encoding:JSONEncoding.default, headers:getHeaders())
                .validate()
                .responseJSON { response in
                    
                    switch response.result {
                        
                        case .success(_):
                            
                            let resJson = JSON(response.result.value!)
                                                        
                            seal.fulfill(resJson)
                            

                    case .failure(let error):
                        
                            seal.reject(error)
                    }
            }
        }
        
    }
}
