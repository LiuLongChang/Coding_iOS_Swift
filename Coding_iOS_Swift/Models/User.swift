//
//  User.swift
//  Coding_iOS_Swift
//
//  Created by langyue on 16/4/28.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit

class User: NSObject,NSCopying {
    
    
    var avatar,global_key,path,tags,job,email,birthday: String?
    var curPassword,resetPassword,resetPasswordConfirm,phone,introduction : String?
    var id,sex,follow,followed,fans_count,follows_count,tweets_count,status,points_left,email_validation,is_phone_validated : NSNumber?
    var created_at,last_logined_at,last_activity_at,updated_at : NSDate?
    
    
    
    
    
    var name : String?{
        
        set{
            
            self.name = newValue
            if name != nil {
                pinyinName = name?.transformToPinyin()
            }
            
        }
        
        get{
            return self.name
        }
        
    }
    
    
    var pinyinName : String?{
        
        set{
            self.pinyinName = newValue
        }
        
        get{
            if self.pinyinName == nil {
                return ""
            }
            return self.pinyinName
        }
        
    }
    
    
    
    
    var company: String?{
        
        set{
            self.company = newValue
        }
        
        get{
            if (self.company != nil) && (self.company!.characters.count > 0) {
                return self.company
            }else{
                return "未填写"
            }
        }
    }
    
    
    var job_str: String?{
        
        set{
            self.company = newValue
        }
        
        get{
            if (self.job_str != nil) && (self.job_str?.characters.count > 0) {
                return self.job_str
            }else{
                return "未填写"
            }
        }
        
    }
    
    
    var location: String?{
        
        set{
            self.location = newValue
        }
        
        get{
            if (self.location != nil) && (self.location?.characters.count > 0) {
                return self.location
            }else{
                return "未填写"
            }
        }
        
    }
    
    
    
    var tags_str: String?{
        
        set{
            self.tags_str = newValue
        }
        
        get{
            if (self.tags_str != nil) && (self.tags_str?.characters.count > 0) {
                return self.tags_str
            }else{
                return "未填写"
            }
        }
        
    }
    
    
    
    
    var slogan: String?{
        
        set{
            self.slogan = newValue
        }
        
        get{
            if (self.slogan != nil) && (self.slogan?.characters.count > 0) {
                return self.slogan
            }else{
                return "未填写"
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        
        
        let user: ()  = self.dynamicType.initialize()
        User(user).avatar = avatar!.copy() as? String
        User(user).name = name!.copy() as? String
        User(user).global_key = global_key!.copy() as? String
        User(user).path = path!.copy() as? String
        User(user).slogan = slogan!.copy() as? String
        User(user).company = company!.copy() as? String
        User(user).tags_str = tags_str!.copy() as? String
        User(user).tags = tags!.copy() as? String
        User(user).location = location!.copy() as? String
        User(user).job_str = job_str!.copy() as? String
        User(user).job = job!.copy() as? String
        User(user).email = email!.copy() as? String
        User(user).birthday = birthday!.copy() as? String
        User(user).pinyinName = pinyinName!.copy() as? String
        
        
        
        User(user).curPassword = curPassword!.copy() as? String
        User(user).resetPassword = resetPassword!.copy() as? String
        User(user).resetPasswordConfirm = resetPasswordConfirm!.copy() as? String
        User(user).phone = phone!.copy() as? String
        User(user).introduction = introduction!.copy() as? String
        
        
        
        User(user).id = id!.copy() as? NSNumber
        User(user).sex = sex!.copy() as? NSNumber
        User(user).follow = follow!.copy() as? NSNumber
        User(user).followed = followed!.copy() as? NSNumber
        User(user).fans_count = fans_count!.copy() as? NSNumber
        User(user).follows_count = follows_count!.copy() as? NSNumber
        User(user).tweets_count = tweets_count!.copy() as? NSNumber
        User(user).status = status!.copy() as? NSNumber
        User(user).points_left = points_left!.copy() as? NSNumber
        User(user).email_validation = email_validation!.copy() as? NSNumber
        User(user).is_phone_validated = is_phone_validated!.copy() as? NSNumber
        
        
        User(user).created_at = created_at!.copy() as? NSDate
        User(user).last_logined_at = last_logined_at!.copy() as? NSDate
        User(user).last_activity_at = last_activity_at!.copy() as? NSDate
        User(user).updated_at = updated_at!.copy() as? NSDate
        
        return user as! AnyObject
    }
    
    
    
    
    class func userWithGlobalKey(global_key:String)->User {
        let curUser = User()
        curUser.global_key = global_key
        return curUser
    }
    
    
    func isSameToUser(user:User?) -> Bool {
        if user != nil {
            return false
        }
        return ((self.id != nil) && (user?.id != nil) && (self.id?.integerValue == user?.id?.integerValue)) || ((self.global_key != nil) && (user?.global_key != nil) && (self.global_key == user?.global_key))
    }
    
    
    
    
    
    func toUserInfoPath()->String{
        return String(format: "api/user/key/%@",global_key!)
    }
    
    func toResetPassworPath()->String{
        return "api/user/updatePassword"
    }
    
    
    
    func toResetPasswordParams()->Dictionary<String,AnyObject>{
        return
            ["current_password":self.curPassword!.sha1Str(),"password":self.resetPassword!.sha1Str(),"confirm_password":self.resetPasswordConfirm!.sha1Str()]
    }
    
    
    
    func toFollowedOrNotPath()->String{
        let path = ((follow!.boolValue) == true ? "api/user/unfollow":"api/user/follow")
        return path
    }
    
    
    
    func toFollowedOrNotParams()->Dictionary<String,AnyObject> {
        var dict : Dictionary<String,AnyObject> = [:]
        if global_key != nil {
            dict = ["users":global_key!]
        }else if (id != nil) {
            dict = ["users":id!]
        }
        return dict
    }
    
    
    
    
    
    
    
    func toUpdateInfoPath()->String{
        return "api/user/updateInfo"
    }
    
    func toUpdateInfoParams()->Dictionary<String,AnyObject>{
        return ["id":id!,"email":email!,"global_key":global_key!,"lavatar":avatar!,"name":name!,"sex":sex!,"birthday":birthday!,"location":location!,"slogan":slogan!,"company":company!,"job":job!,"tags":tags!]
    }
    
    
    
    
    func toDeleteConversationPath()->String{
        return String(format: "api/message/conversation/%@",(self.id?.stringValue)!)
    }
    
    
    
    func localFriendsPath()->String{
        return "FriendsPath"
    }
    
    func changePasswordTips()->String{
        var tipStr : String = ""
        if (self.curPassword != nil) || (self.curPassword?.characters.count <= 0) {
            tipStr = "请输入当前密码"
        }else if (self.resetPassword != nil) || (self.resetPassword?.characters.count <= 0) {
            tipStr = "请输入新密码"
        }else if (self.resetPasswordConfirm != nil) || (self.resetPasswordConfirm?.characters.count <= 0) {
            tipStr = "请确认新密码"
        }else if (self.resetPassword != self.resetPasswordConfirm){
            tipStr = "两次输入的密码不一致"
        }else if (self.resetPassword?.characters.count < 6){
            tipStr = "新密码不能少于6位"
        }else if self.resetPassword?.characters.count > 64 {
            tipStr = "新密码不得长于64位"
        }
        return tipStr
    }
    
    
    
    
    

}
