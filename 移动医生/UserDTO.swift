//
//  UserDTO.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/11.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit

class UserDTO: NSObject {
    
    var mobile:String = ""; // "13736094159         ",
    var userId:String = ""; // "239",
    var userRealName:String = ""; // "宁武云"
    var userCode:String = ""; // "070807005",
    var deptCode:String = ""; // "41",
    var loginTime:String = ""; // "2016-04-11 11:25:34",
    var token:String = ""; // "654dfe369feba78d8ffd1576d1485708",
    var sex:String = ""; // "1",
    var pwd:String = ""; // "357ee1b53538667e9311912bb7566e23"
    
    class func modelObjectWithDictionary(dic:NSDictionary) -> UserDTO {
        let user = UserDTO();
        if let value:String = dic.valueForKey("mobile")! as? String {
            user.mobile = value;
        }
        if let value:String = dic.valueForKey("userId")! as? String {
            user.userId = value;
        }
        if let value:String = dic.valueForKey("userRealName")! as? String {
            user.userRealName = value;
        }
        if let value:String = dic.valueForKey("userCode")! as? String {
            user.userCode = value;
        }
        if let value:String = dic.valueForKey("deptCode")! as? String {
            user.deptCode = value;
        }
        if let value:String = dic.valueForKey("loginTime")! as? String {
            user.loginTime = value;
        }
        if let value:String = dic.valueForKey("token")! as? String {
            user.token = value;
        }
        if let value:String = dic.valueForKey("sex")! as? String {
            user.sex = value;
        }
        if let value:String = dic.valueForKey("pwd")! as? String {
            user.pwd = value;
        }
        return user;
    }
    
}
