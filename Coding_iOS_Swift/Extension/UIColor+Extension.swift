//
//  UIColor+Extension.swift
//  Coding_iOS_Swift
//
//  Created by langyue on 16/4/27.
//  Copyright © 2016年 langyue. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    
    
    
    class func colorWithHexString(stringToConvert: String)->UIColor?{
        let scanner = NSScanner(string:stringToConvert)
        var hexNum : UInt32 = 0
        if scanner.scanHexInt(&hexNum) {
            return nil
        }
        return colorWithRGBHex(hexNum)
    }
    
    
    
    
    class func colorWithRGBHex(hex:UInt32)->UIColor{
        let r = (hex >> 16) & 0xFF
        let g = (hex >> 8) & 0xFF;
        let b = (hex) & 0xFF
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha:1.0)
    }
    
    
    
    
    
    
}


