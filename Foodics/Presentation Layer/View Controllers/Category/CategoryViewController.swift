//
//  CategoryViewController.swift
//  Foodics
//
//  Created by mohamed on 1/22/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import UIKit

class CategoryViewController: CategoriesViewController,ProductDelegate {

    var categoryArr = [Category]()
    
    var cellIdentifier = "CategoryCollectionViewCell"
    
    var maxNumberOfItemsPerSection = 3
    
    var height = 100
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK : Layout
    
    override func initialiseLayout() {
            
        view.backgroundColor = .white
        collectionView.backgroundColor = .white

        collectionView.registerCell(cellIdentifier: cellIdentifier)
    }
   
    //MARK: Redirection
    
    func goToProductScreen(cat:Category,productsArr:[Product]) {
        
        let destVC = Utils.getStoryboard(StoryboardId: "Main").instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
        
        destVC.productsArr = productsArr
        destVC.category = cat
        destVC.delegate = self
        
        self.navigationController?.pushViewController(destVC, animated: true)
    }
    
    //MARK: Products Delegate
    
    func didSelectProduct(product: Product) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            ProductDetailsViewController.presentProductDetails(fromVC: self, product: product)
        })
        
    }
    
}

extension CategoryViewController:UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categoryArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CategoryCollectionViewCell
        
        cell.setData(category: categoryArr[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cat = categoryArr[indexPath.row]
        
        let products = DataManager.shared.getProductsForCategory(cat: cat)
        
        if (products.count > 0) {
        
            goToProductScreen(cat: cat, productsArr: products)
        
        } else {
            
            Utils.showErrorAlert(message: Utils.getStringWithTag(tag: "No products found for this category"), VC: self)
        }
                
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let spacing = ((maxNumberOfItemsPerSection - 1) * 15) + 30
                
        let width = (Int(collectionView.frame.size.width) - spacing) / maxNumberOfItemsPerSection
        
        return CGSize.init(width: width, height: height)
        
    }
    
    
}
