//
//  PatientListViewController.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/12.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit

class PatientListViewController: UIViewController, UISearchBarDelegate {

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
        self.navigationController?.navigationBarHidden = true;
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.navigationBarHidden = false;
    }
}
