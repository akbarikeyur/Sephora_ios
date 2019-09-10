//
//  Colors.swift
//  Cozy Up
//
//  Created by Keyur on 20/07/19.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit

var ClearColor : UIColor = UIColor.clear //0
var WhiteColor : UIColor = UIColor.white //1
var DarkGrayColor : UIColor = colorFromHex(hex: "222222") //2
var LightGrayColor : UIColor = colorFromHex(hex: "9A9A9A") //3
var ExtraLightGrayColor : UIColor = colorFromHex(hex: "B2B0B0") //4
var BlackColor : UIColor = UIColor.black   //5
var AppColor : UIColor = colorFromHex(hex: "8E1939") //6
var DarkYellowColor : UIColor = colorFromHex(hex: "E0A05A") //7

var HighlightRedColor : UIColor = colorFromHex(hex: "CF0031") //8


enum ColorType : Int32 {
    case Clear = 0
    case White = 1
    case DarkGray = 2
    case LightGray = 3
    case ExtraLightGray = 4
    case Black = 5
    case App = 6
    case DarkYellow = 7
    case HighlightRed = 8
}

extension ColorType {
    var value: UIColor {
        get {
            switch self {
            case .Clear: //0
                return ClearColor
            case .White: //1
                return WhiteColor
            case .DarkGray: //2
                return DarkGrayColor
            case .LightGray: //3
                return LightGrayColor
            case .ExtraLightGray: //4
                return ExtraLightGrayColor
            case .Black: //5
                return BlackColor
            case .App: //6
                return AppColor
            case .DarkYellow: //7
                return DarkYellowColor
            case .HighlightRed: //8
                return HighlightRedColor
            }
        }
    }
}

enum GradientColorType : Int32 {
    case Clear = 0
    case App = 1
}

extension GradientColorType {
    var layer : GradientLayer {
        get {
            let gradient = GradientLayer()
            switch self {
            case .Clear: //0
                gradient.frame = CGRect.zero
            case .App: //1
                gradient.colors = [
                    AppColor.cgColor,
                    WhiteColor.cgColor
                ]
                gradient.locations = [0, 1]
                gradient.startPoint = CGPoint.zero
                gradient.endPoint = CGPoint(x: 1, y: 0)
            }
            
            return gradient
        }
    }
}


enum GradientColorTypeForView : Int32 {
    case Clear = 0
    case App = 1
}


extension GradientColorTypeForView {
    var layer : GradientLayer {
        get {
            let gradient = GradientLayer()
            switch self {
            case .Clear: //0
                gradient.frame = CGRect.zero
            case .App: //1
                gradient.colors = [
                    AppColor.cgColor,
                    WhiteColor.cgColor
                ]
                gradient.locations = [0, 1]
                gradient.startPoint = CGPoint(x: 0.8, y: 1.0)
                gradient.endPoint = CGPoint(x: 0.8, y: 0.0)

            }
            
            return gradient
        }
    }
}

