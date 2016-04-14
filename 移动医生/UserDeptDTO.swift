//
//  UserDeptDTO.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/12.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit

class UserDeptDTO: NSObject {

    let userName:String;// "宁武云",
    let deptName:String;// "儿科",
    let id:String;      // "41_239",
    let userCode:String;// "070807005",
    let userId:String;  // "239",
    let deptCode:String;// "41"
    
    init(dic:Dictionary<String,AnyObject>) {
        userName = (dic["userName"] as? String) == nil ? "" : (dic["userName"] as? String)!;
        deptName = (dic["deptName"] as? String) == nil ? "" : (dic["deptName"] as? String)!;
        id = (dic["id"] as? String) == nil ? "" : (dic["id"] as? String)!;
        userCode = (dic["userCode"] as? String) == nil ? "" : (dic["userCode"] as? String)!;
        userId = (dic["userId"] as? String) == nil ? "" : (dic["userId"] as? String)!;
        deptCode = (dic["deptCode"] as? String) == nil ? "" : (dic["deptCode"] as? String)!;
    }
    
}
