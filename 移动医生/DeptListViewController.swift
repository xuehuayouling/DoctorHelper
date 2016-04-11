//
//  DeptListViewController.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/11.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit
import Alamofire

class DeptListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDeptList();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getDeptList() -> Void {
        if let user:UserDTO = LoginUserInfoUtils.getSavedUserInfo() {
            let params = ["userCode":user.userCode, "token":user.token];
            if let url = NetWorkUtils.getDpetListUrlStr() {
                let request = Alamofire.request(.GET, url, parameters: params);
                print(request);
            }
            
        }
        
    }
}
