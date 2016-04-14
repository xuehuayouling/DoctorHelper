//
//  PatientListViewController.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/12.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit
import SVProgressHUD

class PatientListViewController: UIViewController, UISearchBarDelegate, UIAlertViewDelegate {

    var userDept: UserDeptDTO?;
    @IBOutlet weak var correctDeptButton: UIButton!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        correctDeptButton.setTitle(userDept?.deptName, forState: UIControlState.Normal);
        doctorNameLabel.text = userDept?.userName;
        
        /**
         *  下面两句代码用来去掉搜索框边框颜色
         */
        self.searchBar.subviews[0].subviews[0].removeFromSuperview();
        self.searchBar.backgroundColor = UIColor.clearColor();
        self.searchBar.delegate = self;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        if userDept == nil {
            SVProgressHUD.showErrorWithStatus("系统错误，没有选择科室！");
            self.navigationController?.popViewControllerAnimated(animated);
        } else {
            self.navigationController?.navigationBarHidden = true;
        }
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated);
        self.navigationController?.navigationBarHidden = false;
    }
    
    @IBAction func loginOutButtonDidClick(sender: UIButton) {
        let alert = UIAlertController.init(title: "注销当前账户？", message: nil, preferredStyle: UIAlertControllerStyle.Alert);
        let confirmAction = UIAlertAction.init(title: "确认", style: UIAlertActionStyle.Default) { (action) in
            LoginUserInfoUtils.clearSavedUserInfo();
            self.performSegueWithIdentifier("loginOutSegue", sender: nil);
        }
        let cancelAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil);
        alert.addAction(confirmAction);
        alert.addAction(cancelAction);
        self.presentViewController(alert, animated: true, completion: nil);
    }
    
    private func getPatientList() {
        
    }
    
}
