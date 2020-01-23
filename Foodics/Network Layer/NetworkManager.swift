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

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    private let manager: Alamofire.SessionManager = {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TIMEOUT_INTERVAL
        
        return Alamofire.SessionManager(configuration: configuration)
        
    }()
    
    //MARK: GET method
    
    func requestGETURL(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void)
    {
        let headers: HTTPHeaders = [
            "Authorization": String(format: "Bearer %@", API_TOKEN),
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
                
        Alamofire.request(strURL,encoding: JSONEncoding.default, headers:headers).responseJSON { (responseObject) -> Void in

            print(responseObject)

            if responseObject.result.isSuccess {

                
                let resJson = JSON(responseObject.result.value!)
                DataManager.saveResponse(resJson, key: strURL)

                success(resJson)
            }
            
            if responseObject.result.isFailure {
                
                if let resJson = DataManager.loadResponse(key: strURL) {
                    success(resJson)

                    return
                }
                
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
}
