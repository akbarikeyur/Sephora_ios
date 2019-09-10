//
//  CustomProductCVC.swift
//  Sephora
//
//  Created by Keyur on 24/07/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomProductCVC: UICollectionViewCell {

    @IBOutlet weak var outerView: View!
    @IBOutlet weak var productImgView: UIImageView!
    @IBOutlet weak var productNameLbl: Label!
    @IBOutlet weak var newView: UIView!
    @IBOutlet weak var constraintHeightOuterView: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newView.roundCorners(corners: [.bottomRight, .topLeft], radius: 10)
    }

}
