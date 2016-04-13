//
//  DeptListViewController.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/11.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit
import Alamofire

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
        if let user:UserDTO = LoginUserInfoUtils.getSavedUserInfo() {
            let params = ["userCode":user.userCode, "token":user.token];
            if let url = NetWorkUtils.getDpetListUrlStr() {
                let request = Alamofire.request(.GET, url, parameters: params);
                print(request);
                request.responseJSON { response in
                    if let dic = response.result.value as? NSDictionary {
                        if let data = dic.valueForKey("data") as? NSDictionary {
                            if let userDepts = data.valueForKey("userDept") as? NSMutableArray {
                                self.userDepts = userDepts;
                                self.tableView.reloadData();
                            }
                        }
                    }
                }
            }
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
        if let dic = userDepts![indexPath.row] as? NSDictionary {
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
            if let dic = userDepts![indexPath.row] as? NSDictionary {
                let userDept = UserDeptDTO.init(dic: dic);
                let patientListCV = segue.destinationViewController as! PatientListViewController;
                patientListCV.userDept = userDept;
            }
        }
        
    }
}
