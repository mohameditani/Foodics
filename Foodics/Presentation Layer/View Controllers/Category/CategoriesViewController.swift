//
//  CategoriesViewController.swift
//  Foodics
//
//  Created by mohamed on 1/22/20.
//  Copyright © 2020 mohamed. All rights reserved.
//

import UIKit

class CategoriesViewController: GeneralViewController,PagerViewControllerDelegate {
    
    var currentPage = 0
    var pager:GeneralPageViewController!
    

    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: Layout
    
    override func initialiseLayout() {
        
        self.title = Utils.getStringWithTag(tag: "Categories")
        
        self.navigationController?.navigationBar.tintColor = DARK_GRAY_COLOR

        setCategoryPages(dataArr:Utils.getAppDelegate().categoriesArr)
    }
    
    func addBarButtons() {
        
        let prevButton = UIBarButtonItem(title: "Previous", style: .plain, target: self, action: #selector(previousButtonClicked))
        let nextButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextButtonClicked))

        prevButton.tintColor  = DARK_GRAY_COLOR
        nextButton.tintColor  = DARK_GRAY_COLOR

        navigationItem.rightBarButtonItem = nextButton
        navigationItem.leftBarButtonItem = prevButton
        
        refreshBarButtons()
        
    }
    
    func refreshBarButtons() {
        
        if (currentPage == 0) {
            
            self.navigationItem.leftBarButtonItem!.isEnabled = false
            self.navigationItem.rightBarButtonItem!.isEnabled = true

        } else if (currentPage == pager.getNumberOfViewControllers() - 1) {
            
            self.navigationItem.rightBarButtonItem!.isEnabled = false
            self.navigationItem.leftBarButtonItem!.isEnabled = true
        }
    }
    
    //MARK: Action
    
    @objc func previousButtonClicked() {
        
        let currentIndex = currentPage - 1
        pager.generalScroll(index:currentIndex,true)
    }
    
    @objc func nextButtonClicked() {
        
        let currentIndex = currentPage + 1
        pager.generalScroll(index:currentIndex,true)

    }
    
       
    //MARK: Pager Delegate & Data
    
    func setCategoryPages(dataArr:[Any]) {
           
          let chunkedArr =  dataArr.chunked(into: MAX_CELL_COUNT)
        
          if (chunkedArr.count > 1) {
              addBarButtons()
          }

           print(chunkedArr.count)
           
           var tempArr = [UIViewController]()
           
           for n in 0...(chunkedArr.count-1) {
            
              let catVC = Utils.getStoryboard(StoryboardId: "Main").instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
            catVC.categoryArr = chunkedArr[n] as! [Category]
               
               tempArr.append(catVC)
           }
           
           pager.addViewControllers(viewControllers: tempArr)
     }

    func didScrollToIndex(index: Int) {
        
        currentPage = index
        
        refreshBarButtons()
    }
    
    
    
    // MARK : Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPager" {
        
            if let destinationVC = segue.destination as? GeneralPageViewController {
                pager = destinationVC
                pager.pagerDelegate = self
            }
        }
    }
  
}
