//
//  DeptListViewController.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/11.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class DeptListViewController: UITableViewController {
    
    var userDepts:Array<UserDeptDTO> = Array();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDeptList();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.tableView.tableFooterView = UIView.init();
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
    }
    
    private func getDeptList() -> Void {
        let user:UserDTO = LoginUserInfoUtils.getSavedUserInfo();
        let params = ["userCode":user.userCode, "token":user.token];
        if let url = NetWorkUtils.getDpetListUrlStr() {
            SVProgressHUD.show();
            NetWorkUtils.requestForJson(url: url, parameters: params) { dictionary in
                if let data = dictionary["data"] as? Dictionary<String, AnyObject>, let userDepts = data["userDept"] as? Array<Dictionary<String,AnyObject>> {
                    SVProgressHUD.dismiss();
                    self.userDepts.removeAll();
                    for dic:Dictionary<String,AnyObject> in userDepts {
                        self.userDepts.append(UserDeptDTO.init(dic: dic));
                    }
                    self.tableView.reloadData();
                } else {
                    SVProgressHUD.showErrorWithStatus("服务器解析数据出错，请联系管理员");
                    log.error(dictionary.debugDescription);
                }
            }
            
        } else {
            SVProgressHUD.showErrorWithStatus("无法获取科室列表url，请联系开发人员");
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDepts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("deptCell")!;
        let userDept = userDepts[indexPath.row]
        cell.textLabel?.text = userDept.deptName == "" ? "测试科室" : userDept.deptName;
        cell.textLabel?.textAlignment = NSTextAlignment.Center;
        return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let userDept = userDepts[indexPath.row]
            let patientListCV = segue.destinationViewController as! PatientListViewController;
            patientListCV.userDept = userDept;
            
        }
        
    }
}
