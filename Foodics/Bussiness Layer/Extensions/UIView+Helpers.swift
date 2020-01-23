//
//  UIView.swift
//  Foodics
//
//  Created by mohamed on 1/23/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func roundRect(radius:Double) {
     
        layer.masksToBounds = true
        layer.cornerRadius = CGFloat(radius)
        
    }
    
}
