//
//  NSString+Common.swift
//  Coding_iOS_Swift
//
//  Created by langyue on 16/4/28.
//  Copyright © 2016年 langyue. All rights reserved.
//

import Foundation
import CoreFoundation


public extension String{
    
    
    
    
    func sha1Str()->String{
        
        let data = self.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!
        var digest = [UInt8](count:Int(CC_SHA1_DIGEST_LENGTH),repeatedValue:0)
        CC_SHA1(data.bytes, CC_LONG(data.length), &digest)
        
        let output = NSMutableString(capacity: Int(CC_SHA1_DIGEST_LENGTH))
        for byte in digest {
            output.appendFormat("%02x", byte)
        }
        return output as String
        
    }
    
    
    
    
    func transformToPinyin() -> String {
        if self.characters.count <= 0 {
            return self
        }
        let tempString : NSMutableString = self.copy() as! NSMutableString
        //把汉字转为拼音
        CFStringTransform(tempString,nil, kCFStringTransformToLatin, false)
        //去掉拼音的音标
        CFStringTransform(tempString, nil, kCFStringTransformStripDiacritics, false)
        let string = String(tempString).uppercaseString
        //去掉空格
        return string.stringByReplacingOccurrencesOfString(" ", withString: "")
    }
    
    
    
    
    
    
    
}
