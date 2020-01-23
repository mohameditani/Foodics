//
//  GeneralPageViewController.swift
//  MTN
//
//  Created by Mohamed Elitani on 7/25/18.
//  Copyright © 2018 Mohamed Elitani. All rights reserved.
//

import UIKit

protocol PagerViewControllerDelegate{

    func didScrollToIndex(index:Int)

}

class GeneralPageViewController: UIPageViewController , UIPageViewControllerDelegate , UIPageViewControllerDataSource{

    var viewControllersArray = Array<UIViewController>()

    var pagerDelegate : PagerViewControllerDelegate!

    var pages = [UIViewController]()

    var currentIndex = 0


    public func getViewController(withIdentifier identifier: String,storyboardIdentifier:UIStoryboard) -> UIViewController{

        return storyboardIdentifier.instantiateViewController(withIdentifier:identifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

    func removeSwipeGesture(){
        for view in self.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
    
    public func getNumberOfViewControllers() -> Int {
        
        return pages.count
        
    }
    
    public func addViewControllers(viewControllers: [UIViewController]) {
        
        pages = [UIViewController]()
        
        for vc in viewControllers {
            pages.append(vc)
        }
        
        if let firstVC = pages.first
        {
            if(Utils.isArabic()){
                setViewControllers([firstVC], direction : .reverse , animated: true, completion: nil)
            }else{
                setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
            }
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self as UIPageViewControllerDataSource
        self.delegate   = self as UIPageViewControllerDelegate
        
        
        if let firstVC = pages.first
        {
            if(Utils.isArabic()){
                setViewControllers([firstVC], direction : .reverse , animated: true, completion: nil)
            }else{
                setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
            }
        }
        
        
        // Do any additional setup after loading the view.
    }



    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0          else { return nil }

        guard pages.count > previousIndex else { return nil }

        return pages[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{

        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }

        let nextIndex = viewControllerIndex + 1

        guard nextIndex < pages.count else { return nil }

        guard pages.count > nextIndex else { return nil }

        return pages[nextIndex]
    }

     func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        if(completed){

            let vc = pageViewController.viewControllers![0]
            let index = pages.firstIndex{$0 === vc}

            currentIndex = index!

            if let _ = pagerDelegate {
                pagerDelegate.didScrollToIndex(index: index!)

            }
        }

    }

    
    public func generalScroll(index: Int, _ animated:Bool = false){
        
        if (pages.count>index) {
            
            if(Utils.isArabic()){
                if (index > currentIndex){
                    setViewControllers([pages[index]], direction: .reverse, animated: animated, completion: nil)
                } else {
                    setViewControllers([pages[index]], direction: .forward, animated: animated, completion: nil)
                }
            }else{
                if (index > currentIndex){
                    setViewControllers([pages[index]], direction: .forward, animated: animated, completion: nil)
                } else {
                    setViewControllers([pages[index]], direction: .reverse, animated: animated, completion: nil)
                }
            }
            currentIndex = index
        }
        
        if let _ = pagerDelegate {
            pagerDelegate.didScrollToIndex(index: index)

        }
    }
    

}
