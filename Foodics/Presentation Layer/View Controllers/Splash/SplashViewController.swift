//
//  SplashViewController.swift
//  Foodics
//
//  Created by mohamed on 1/22/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import UIKit
import BoltsSwift


class SplashViewController: GeneralViewController {

    //MARK: Life Cycle
    
     @IBOutlet weak var loader: UIActivityIndicatorView!
    
     override func viewDidLoad() {
         super.viewDidLoad()
        
    }
    
  func testTask() {
        let taskHello1 = echo("hello1")
    
        let taskHello2 = taskHello1.continueOnSuccessWith(continuation: { (task) -> Task<String> in
            let taskResult = self.echo("error")
            return taskResult
        })
       _ = taskHello2.continueOnErrorWith(continuation: { (task) -> Task<String> in
            let taskResult = self.echo("Error received")
            return taskResult
        })
        _ = taskHello2.continueOnSuccessWith(continuation: { (task) -> Task<String> in
            let taskResult = self.echo("Success received")
            return taskResult
        })
    }

    func echo(_ text: String) -> Task<String> {
        let taskCompletionSource = TaskCompletionSource<String>()
        print("=> \(text)")
        switch (text) {
        case "error":
            let error = NSError(domain: "domain", code: -1, userInfo: ["userInfo": "userInfo"])
            taskCompletionSource.set(error: error)
        case "cancel":
            taskCompletionSource.cancel()
        default:
            taskCompletionSource.set(result: text)
        }
        return taskCompletionSource.task
    }
    
    //MARK: Layout
      
      override func initialiseLayout() {
          
        self.loader.color = DARK_GRAY_COLOR
        getCategoriesData()
          
      }
    
    //MARK: API
      
      func getCategoriesData() {
                  
          loader.startAnimating()
          
          NetworkService.getCategories { (success, response) in

              if (success) {
                                
                Utils.getAppDelegate().categoriesArr = response!.data as! [Category]
                
                self.getProductsData()
                
              } else {

                    self.loader.stopAnimating()

                    Utils.showAlert(alertTitle: Utils.getAppName(), alertMessage: response?.message ?? "", cancelTitle: Utils.getStringWithTag(tag: "Cancel"), otherTitle: Utils.getStringWithTag(tag: "Reload"), VC: self) { (Index) in
                    
                        if (Index == 1) {
                            self.getCategoriesData()
                        }
                    }
                }
            }
      }

      func getProductsData() {
        
         NetworkService.getProducts { (success, response) in

            self.loader.stopAnimating()

            if (success) {
               
                Utils.getAppDelegate().productsArr = response!.data as! [Product]
             }

             self.goToCategoriesScreen()
         }
     }
  

}
