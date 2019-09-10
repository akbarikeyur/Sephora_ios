//
//  Fonts.swift
//  Cozy Up
//
//  Created by Amisha on 22/05/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import Foundation

import UIKit

let APP_REGULAR = "SFProDisplay-Regular"
let APP_BOLD = "SFProDisplay-Bold"
let APP_SEMIBOLD = "SFProDisplay-Semibold"
let APP_MEDIUM = "SFProDisplay-Medium"
let APP_LIGHT = "SFProDisplay-Light"


enum FontType : String {
    case Clear = ""
    case ARegular = "ar"
    case ABold = "ab"
    case ASemiBold = "as"
    case AMedium = "am"
    case ALight = "al"
    
    
}


extension FontType {
    var value: String {
        get {
            switch self {
            case .Clear:
                return APP_REGULAR
                
            case .ARegular:
                return APP_REGULAR
            case .ABold:
                return APP_BOLD
            case .ASemiBold:
                return APP_SEMIBOLD
            case .AMedium:
                return APP_MEDIUM
            case .ALight:
                return APP_LIGHT
                
            }
        }
    }
}
