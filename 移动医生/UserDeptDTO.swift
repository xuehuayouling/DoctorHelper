//
//  UserDeptDTO.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/12.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit

class UserDeptDTO: NSObject {

    var userName:String = "";// "宁武云",
    var deptName:String = "";// "儿科",
    var id:String = "";      // "41_239",
    var userCode:String = "";// "070807005",
    var userId:String = "";  // "239",
    var deptCode:String = "";// "41"
    
    class func modelObjectWithDictionary(dic:NSDictionary) -> UserDeptDTO {
        let userDept = UserDeptDTO();
        if let value:String = dic.valueForKey("userName")! as? String {
            userDept.userName = value;
        }
        if let value:String = dic.valueForKey("deptName")! as? String {
            userDept.deptName = value;
        }
        if let value:String = dic.valueForKey("id")! as? String {
            userDept.id = value;
        }
        if let value:String = dic.valueForKey("userCode")! as? String {
            userDept.userCode = value;
        }
        if let value:String = dic.valueForKey("userId")! as? String {
            userDept.userId = value;
        }
        if let value:String = dic.valueForKey("deptCode")! as? String {
            userDept.deptCode = value;
        }
        return userDept;
    }
}
