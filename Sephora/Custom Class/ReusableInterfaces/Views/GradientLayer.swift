//
//  GradientLayer.swift
//  Cozy Up
//
//  Created by Keyur on 20/07/19.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit

class GradientLayer: CAGradientLayer {

    override func layoutSublayers() {
        super.layoutSublayers()
        
        frame = super.bounds
    }
}
