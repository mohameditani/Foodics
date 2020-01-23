//
//  GeneralViewController.swift
//  Foodics
//
//  Created by mohamed on 1/22/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        initialiseLayout()
    }
    
    func initialiseLayout() {
        
    }
    
    //MARK: Redirection
       
    func goToCategoriesScreen() {
        
        setRoot(StoryboardId: "Main", ScreenId: "CategoriesNavigationViewController")
    }
    
  //MARK: Change Root with/without animation
    
    func setRoot(StoryboardId :String , ScreenId : String, _ animated : Bool = true) {
        
        let vc = Utils.getStoryboard(StoryboardId: StoryboardId).instantiateViewController(withIdentifier: ScreenId)
        
        if (animated) {
            var opt = UIWindow.TransitionOptions(direction: .fade, style: .easeIn)
            opt.duration = 0.2
            Utils.getAppDelegate().window?.setRootViewController(vc, options: opt)
        } else {
            Utils.getAppDelegate().window?.rootViewController = vc
        }
        
    }

}
