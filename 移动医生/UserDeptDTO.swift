//
//  UserDeptDTO.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/12.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit

class UserDeptDTO: NSObject {

    let userName:String?;// "宁武云",
    let deptName:String?;// "儿科",
    let id:String?;      // "41_239",
    let userCode:String?;// "070807005",
    let userId:String?;  // "239",
    let deptCode:String?;// "41"
    
    init(dic:NSDictionary) {
        userName = dic.valueForKey("userName") as? String;
        deptName = dic.valueForKey("deptName") as? String;
        id = dic.valueForKey("id") as? String;
        userCode = dic.valueForKey("userCode") as? String;
        userId = dic.valueForKey("userId") as? String;
        deptCode = dic.valueForKey("deptCode") as? String;
    }
    
}
