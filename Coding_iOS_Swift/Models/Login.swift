//
//  Login.swift
//  Coding_iOS_Swift
//
//  Created by langyue on 16/4/28.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit

class Login: NSObject {
    
    
    
    var email,password,j_captcha : String?
    var remember_me : NSNumber?
    var curLoginUser : User?
    
    
    override init() {
        super.init()
        self.remember_me = NSNumber.init(bool: true)
        self.email = ""
        self.password = ""
    }
    
    
    func toPath()->String{
        return "api/v2/account/login"
    }
    
    
    
    func toParams() -> Dictionary<String,AnyObject> {
        var params : Dictionary<String,AnyObject> = ["account":self.email!,"password":(self.password?.sha1Str())!,"remember_me": (((self.remember_me?.boolValue)! == true) ? "true" : "false")]
        if self.j_captcha?.characters.count > 0 {
            params["j_captcha"] = self.j_captcha
        }
        return params
    }
    
    
    
    
    

}
