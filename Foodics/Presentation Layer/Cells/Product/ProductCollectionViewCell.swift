//
//  ProductCollectionViewCell.swift
//  Foodics
//
//  Created by mohamed on 1/23/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
                
        backgroundColor = YELLOW_COLOR
        titleLabel.textColor = DARK_GRAY_COLOR
        titleLabel.backgroundColor = .clear
    }
    
    func setData(product:Product) {
        
        titleLabel.text = product.getName() ?? ""
        
        displayImageView.loadImage(imageURL: product.image ?? "", placeholder: "placeholder")
    }

}
