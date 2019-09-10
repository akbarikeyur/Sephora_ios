//
//  CollectionView.swift
//  Cozy Up
//
//  Created by Keyur on 20/07/19.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit

class CollectionView: UICollectionView {
    
    /// background color  types
    @IBInspectable var backgroundColorTypeAdapter : Int32 = 0 {
        didSet {
            self.backgroundColorType = ColorType(rawValue: self.backgroundColorTypeAdapter)
        }
    }
    //    /// background color  types
    var backgroundColorType : ColorType? {
        didSet {
            setBackgroundColor(backgroundColorType: backgroundColorType)
        }
    }
}
