//
//  LoginUserInfoUtils.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/11.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit

class LoginUserInfoUtils: NSObject {

    class func saveUserInfo(user:UserDTO) {
        let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults();
        userDefaults.setObject(user.mobile, forKey: "logined_user_info_mobile");
        userDefaults.setObject(user.userId, forKey: "logined_user_info_userId");
        userDefaults.setObject(user.userRealName, forKey: "logined_user_info_userRealName");
        userDefaults.setObject(user.userCode, forKey: "logined_user_info_userCode");
        userDefaults.setObject(user.deptCode, forKey: "logined_user_info_deptCode");
        userDefaults.setObject(user.loginTime, forKey: "logined_user_info_loginTime");
        userDefaults.setObject(user.token, forKey: "logined_user_info_token");
        userDefaults.setObject(user.sex, forKey: "logined_user_info_sex");
        userDefaults.setObject(user.pwd, forKey: "logined_user_info_pwd");
        userDefaults.synchronize();
    }
    
    class func getSavedUserInfo() -> UserDTO {
        let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults();
        let dic:NSMutableDictionary = NSMutableDictionary();
        if let value = userDefaults.valueForKey("logined_user_info_mobile") as? String{
            dic.setObject(value, forKey: "mobile");
        }
        if let value = userDefaults.valueForKey("logined_user_info_userId") as? String{
            dic.setObject(value, forKey: "userId");
        }
        if let value = userDefaults.valueForKey("logined_user_info_userRealName") as? String{
            dic.setObject(value, forKey: "userRealName");
        }
        if let value = userDefaults.valueForKey("logined_user_info_userCode") as? String{
            dic.setObject(value, forKey: "userCode");
        }
        if let value = userDefaults.valueForKey("logined_user_info_deptCode") as? String{
            dic.setObject(value, forKey: "deptCode");
        }
        if let value = userDefaults.valueForKey("logined_user_info_loginTime") as? String{
            dic.setObject(value, forKey: "loginTime");
        }
        if let value = userDefaults.valueForKey("logined_user_info_token") as? String{
            dic.setObject(value, forKey: "token");
        }
        if let value = userDefaults.valueForKey("logined_user_info_sex") as? String{
            dic.setObject(value, forKey: "sex");
        }
        if let value = userDefaults.valueForKey("logined_user_info_pwd") as? String{
            dic.setObject(value, forKey: "pwd");
        }
        return UserDTO.init(dic: dic);
    }
    
    class func clearSavedUserInfo() -> Void {
        let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults();
        userDefaults.removeObjectForKey("logined_user_info_mobile");
        userDefaults.removeObjectForKey("logined_user_info_userId");
        userDefaults.removeObjectForKey("logined_user_info_userRealName");
        userDefaults.removeObjectForKey("logined_user_info_userCode");
        userDefaults.removeObjectForKey("logined_user_info_deptCode");
        userDefaults.removeObjectForKey("logined_user_info_loginTime");
        userDefaults.removeObjectForKey("logined_user_info_token");
        userDefaults.removeObjectForKey("logined_user_info_sex");
        userDefaults.removeObjectForKey("logined_user_info_pwd");
    }
}
