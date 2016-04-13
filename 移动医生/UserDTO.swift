//
//  UserDTO.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/11.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit

class UserDTO: NSObject {
    
    let mobile:String; // "13736094159         ",
    let userId:String; // "239",
    let userRealName:String; // "宁武云"
    let userCode:String; // "070807005",
    let deptCode:String; // "41",
    let loginTime:String; // "2016-04-11 11:25:34",
    let token:String; // "654dfe369feba78d8ffd1576d1485708",
    let sex:String; // "1",
    let pwd:String; // "357ee1b53538667e9311912bb7566e23"
    
    init(dic:NSDictionary) {
        mobile = (dic.valueForKey("mobile") as? String) == nil ? "" : (dic.valueForKey("mobile") as? String)!;
        userId = (dic.valueForKey("userId") as? String) == nil ? "" : (dic.valueForKey("userId") as? String)!;
        userRealName = (dic.valueForKey("userRealName") as? String) == nil ? "" : (dic.valueForKey("userRealName") as? String)!;
        userCode = (dic.valueForKey("userCode") as? String) == nil ? "" : (dic.valueForKey("userCode") as? String)!;
        deptCode = (dic.valueForKey("deptCode") as? String) == nil ? "" : (dic.valueForKey("deptCode") as? String)!;
        loginTime = (dic.valueForKey("loginTime") as? String) == nil ? "" : (dic.valueForKey("loginTime") as? String)!;
        token = (dic.valueForKey("token") as? String) == nil ? "" : (dic.valueForKey("token") as? String)!;
        sex = (dic.valueForKey("sex") as? String) == nil ? "" : (dic.valueForKey("sex") as? String)!;
        pwd = (dic.valueForKey("pwd") as? String) == nil ? "" : (dic.valueForKey("pwd") as? String)!;
    }
    
}
