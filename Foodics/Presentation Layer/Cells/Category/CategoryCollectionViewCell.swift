//
//  CategoryCollectionViewCell.swift
//  Foodics
//
//  Created by mohamed on 1/22/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleBackView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleBackView.backgroundColor = YELLOW_COLOR
        titleLabel.textColor = DARK_GRAY_COLOR
        
        titleBackView.roundRect(radius: 15)
                
        // Initialization code
    }

    func setData(category:Category) {
        
        titleLabel.text = category.getName() ?? "N/A"
        
    }
    
}
