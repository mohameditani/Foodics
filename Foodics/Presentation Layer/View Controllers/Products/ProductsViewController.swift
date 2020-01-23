//
//  ProductsViewController.swift
//  Foodics
//
//  Created by mohamed on 1/22/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import UIKit

protocol ProductDelegate {
    
    func didSelectProduct(product:Product)
}

class ProductsViewController: CategoriesViewController {

    var category: Category!
    var productsArr: [Product]!
    
    var delegate : ProductDelegate?
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Layout
    
    override func initialiseLayout() {
        super.initialiseLayout()
        
        self.title = category.getName()
    }
    
    override func setCategoryPages(dataArr:[Any]) {

        let chunkedArr =  productsArr.chunked(into: MAX_CELL_COUNT)
               
            if (chunkedArr.count > 1) {
                addBarButtons()
            }

            print(chunkedArr.count)
                  
            var tempArr = [UIViewController]()
                  
            for n in 0...(chunkedArr.count-1) {

                let prodVC = Utils.getStoryboard(StoryboardId: "Main").instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
                prodVC.productsArr = chunkedArr[n]
                prodVC.delegate = delegate
                tempArr.append(prodVC)
            }
                  
            pager.addViewControllers(viewControllers: tempArr)
        
    }


}
