//
//  TableView+Helpers.swift
//  MTN
//
//  Created by Mohamed Elitani on 7/24/18.
//  Copyright © 2018 Mohamed Elitani. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView{

    func registerCell(cellIdentifier:String){

        let cellNib = UINib.init(nibName: cellIdentifier, bundle: nil)
        self.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
    }


}
