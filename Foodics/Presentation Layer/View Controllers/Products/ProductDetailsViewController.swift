//
//  ProductDetailsViewController.swift
//  Foodics
//
//  Created by mohamed on 1/23/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import UIKit

class ProductDetailsViewController: GeneralViewController {

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func initialiseLayout() {
        
        super.initialiseLayout()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)

    }
    
    
    //MARK: Redirection
    
    static func presentProductDetails(fromVC:UIViewController,product:Product) {
        
       let vc = Utils.getStoryboard(StoryboardId: "Main").instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        
        vc.modalPresentationStyle = .custom

        fromVC.present(vc, animated: false, completion: nil)
        
    }
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
    }
    
}
