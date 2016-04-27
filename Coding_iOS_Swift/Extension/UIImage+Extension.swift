//
//  UIImage+Extension.swift
//  Coding_iOS_Swift
//
//  Created by langyue on 16/4/27.
//  Copyright © 2016年 langyue. All rights reserved.
//

import Foundation

import UIKit



extension UIImage {
    
    class func imageWithColor(aColor:UIColor) -> UIImage {
        return UIImage.imageWithColor(aColor, aFrame: CGRectMake(0, 0, 1, 1))
    }
    
    
    
    class func imageWithColor(aColor:UIColor,aFrame:CGRect)->UIImage{
        
        UIGraphicsBeginImageContext(aFrame.size)
        let context : CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(context, aColor.CGColor)
        CGContextFillRect(context, aFrame)
        let img : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    
}

