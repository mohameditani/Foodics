//
//  ProductViewController.swift
//  Foodics
//
//  Created by mohamed on 1/23/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import UIKit

class ProductViewController: CategoryViewController {

    var productsArr: [Product]!
    var delegate : ProductDelegate?
    
    
    override func viewDidLoad() {
        
        height = 210
        cellIdentifier = "ProductCollectionViewCell"
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    //MARK: Collection Datasource & Delegate
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return productsArr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        
        cell.setData(product: productsArr[indexPath.row])
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.navigationController?.popViewController(animated: true)
        
        if let _ = delegate {
            
            delegate?.didSelectProduct(product: productsArr[indexPath.row])
        }
        
    }
}



