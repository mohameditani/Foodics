//
//  ProductDetailsViewController.swift
//  Foodics
//
//  Created by mohamed on 1/23/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import UIKit

class ProductDetailsViewController: GeneralViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var displayImageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!

    @IBOutlet weak var cancelButton: UIButton!
    
    var product: Product!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func initialiseLayout() {
        
        super.initialiseLayout()
        
        backView.roundRect(radius: 15)

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        populateData()
    }
    
    func populateData() {
        
        cancelButton.setTitle(Utils.getStringWithTag(tag: "Cancel"), for: .normal)
        cancelButton.backgroundColor = YELLOW_COLOR
        cancelButton.setTitleColor(DARK_GRAY_COLOR, for: .normal)
                
        cancelButton.roundRect(radius: 15)
        
        titleLabel.textColor = DARK_GRAY_COLOR
        categoryLabel.textColor = DARK_GRAY_COLOR
        priceLabel.textColor = DARK_GRAY_COLOR
        descriptionTextView.textColor = DARK_GRAY_COLOR
        descriptionLabel.textColor = DARK_GRAY_COLOR
        
        descriptionLabel.text = Utils.getStringWithTag(tag: "Description")

        titleLabel.text = Utils.getStringWithTag(tag: "Name:") + " " + (product.getName() ?? "N/A")
        categoryLabel.text = Utils.getStringWithTag(tag: "Category:") + " " + (product.category?.getName() ?? "N/A")
        priceLabel.text = Utils.getStringWithTag(tag: "Price:") + " " + String(product.price ?? 0)
        descriptionTextView.text = product.productDescription ?? "N/A"
        
        displayImageView.loadImage(imageURL:( product.image ?? ""), placeholder: "placeholder")
    }
    
    //MARK: Redirection
    
    static func presentProductDetails(fromVC:UIViewController,product:Product) {
        
       let vc = Utils.getStoryboard(StoryboardId: "Main").instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        
        vc.modalPresentationStyle = .custom
        vc.product = product
        fromVC.present(vc, animated: false, completion: nil)
        
    }
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
    }
    
}
