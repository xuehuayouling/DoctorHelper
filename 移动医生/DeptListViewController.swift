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
    
    var userDepts:NSMutableArray? = nil;
    
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
//        self.navigationController?.navigationBarHidden = true;
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
//        self.navigationController?.navigationBarHidden = false;
    }
    
    func getDeptList() -> Void {
        let user:UserDTO = LoginUserInfoUtils.getSavedUserInfo();
        let params = ["userCode":user.userCode, "token":user.token];
        if let url = NetWorkUtils.getDpetListUrlStr() {
            SVProgressHUD.show();
            NetWorkUtils.requestForJson(url: url, parameters: params) { dictionary in
                if let data = dictionary["data"] as? Dictionary<String, AnyObject>, let userDepts = data["userDept"] as? NSMutableArray {
                    SVProgressHUD.dismiss();
                    self.userDepts = userDepts;
                    self.tableView.reloadData();
                } else {
                    SVProgressHUD.showErrorWithStatus("服务器出错，请联系管理员");
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
        if let count = userDepts?.count {
            return count;
        }
        return 0;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("deptCell")!;
        if let dic = userDepts![indexPath.row] as? Dictionary<String, AnyObject> {
            let userDept = UserDeptDTO.init(dic: dic);
            cell.textLabel?.text = userDept.deptName;
            cell.textLabel?.textAlignment = NSTextAlignment.Center;
        }
        return cell;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            if let dic = userDepts![indexPath.row] as? Dictionary<String, AnyObject> {
                let userDept = UserDeptDTO.init(dic: dic);
                let patientListCV = segue.destinationViewController as! PatientListViewController;
                patientListCV.userDept = userDept;
            }
        }
        
    }
}
