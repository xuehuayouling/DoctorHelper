//
//  UserDTO.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/11.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit

class UserDTO: AnyObject {
    
    let mobile:String; // "13736094159         ",
    let userId:String; // "239",
    let userRealName:String; // "宁武云"
    let userCode:String; // "070807005",
    let deptCode:String; // "41",
    let loginTime:String; // "2016-04-11 11:25:34",
    let token:String; // "654dfe369feba78d8ffd1576d1485708",
    let sex:String; // "1",
    let pwd:String; // "357ee1b53538667e9311912bb7566e23"
    
    init(dic:Dictionary<String, AnyObject>) {
        mobile = (dic["mobile"] as? String) == nil ? "" : (dic["mobile"] as? String)!;
        userId = (dic["userId"] as? String) == nil ? "" : (dic["userId"] as? String)!;
        userRealName = (dic["userRealName"] as? String) == nil ? "" : (dic["userRealName"] as? String)!;
        userCode = (dic["userCode"] as? String) == nil ? "" : (dic["userCode"] as? String)!;
        deptCode = (dic["deptCode"] as? String) == nil ? "" : (dic["deptCode"] as? String)!;
        loginTime = (dic["loginTime"] as? String) == nil ? "" : (dic["loginTime"] as? String)!;
        token = (dic["token"] as? String) == nil ? "" : (dic["token"] as? String)!;
        sex = (dic["sex"] as? String) == nil ? "" : (dic["sex"] as? String)!;
        pwd = (dic["pwd"] as? String) == nil ? "" : (dic["pwd"] as? String)!;
    }
    
}
