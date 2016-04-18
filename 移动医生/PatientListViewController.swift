//
//  PatientListViewController.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/12.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit
import SVProgressHUD

class PatientListViewController: UIViewController, UISearchBarDelegate, UIAlertViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    var patientList:Array<PatientDTO> = Array();
    var patientListForShow:Array<PatientDTO> = Array();
    
    var userDept: UserDeptDTO?;
    @IBOutlet weak var correctDeptButton: UIButton!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var patientsCollectionView: UICollectionView!
    @IBOutlet weak var patientCardTypeSegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctDeptButton.setTitle(userDept?.deptName, forState: UIControlState.Normal);
        doctorNameLabel.text = userDept?.userName;
        
        /**
         *  下面两句代码用来去掉搜索框边框颜色
         */
        self.searchBar.subviews[0].subviews[0].removeFromSuperview();
        self.searchBar.backgroundColor = UIColor.clearColor();
        
        self.getPatientList();
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
    
    @IBAction func patientCardTypeSegmentValueChanged(sender: UISegmentedControl) {
        self.patientsCollectionView.reloadData();
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.patientsCollectionView.reloadData();
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        self.patientsCollectionView.reloadData();
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
        let params = ["deptCode":"184", "token":LoginUserInfoUtils.getSavedUserInfo().token];
        SVProgressHUD.show();
        if let url = NetWorkUtils.getPatientListByDeptCodeUrlStr() {
            NetWorkUtils.requestForJson(url: url, parameters: params) { dictionary in
                if let data = dictionary["data"] as? Dictionary<String, AnyObject>, let patientList = data["patient"] as? Array<Dictionary<String,AnyObject>> {
                    SVProgressHUD.dismiss();
                    self.patientList.removeAll();
                    for dic:Dictionary<String,AnyObject> in patientList {
                        self.patientList.append(PatientDTO.init(dic: dic));
                    }
                    self.patientsCollectionView.reloadData();
                } else {
                    SVProgressHUD.showErrorWithStatus("服务器解析数据出错，请联系管理员");
                    log.error(dictionary.debugDescription);
                }
            }
        } else {
            SVProgressHUD.showErrorWithStatus("无根据部门id取病人列表url，请联系开发人员");
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.updateShowPatientList();
        return patientListForShow.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let patientCardCell:PatientCardCell = collectionView.dequeueReusableCellWithReuseIdentifier("patientCollectionCell", forIndexPath: indexPath) as! PatientCardCell;
        patientCardCell.loadData(self.patientListForShow[indexPath.row]);
        return patientCardCell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDeptListSegue" {
            let deptListCV = segue.destinationViewController as! DeptListViewController;
            deptListCV.onDeptSelect = { [weak self] dept in
                /**
                 *  隐藏科室列表弹出框
                 */
                deptListCV.dismissViewControllerAnimated(false, completion: nil);
                self?.userDept = dept;
                self?.getPatientList();
            };
        }
    }
    
    /**
     根据患者类型（我的患者或者科室环则）和搜索框来过滤要显示的患者
     */
    private func updateShowPatientList() {
        self.patientListForShow = self.patientList;
        if self.patientCardTypeSegmentedControl.selectedSegmentIndex == 1 {
            let userCode = LoginUserInfoUtils.getSavedUserInfo().userCode;
            self.patientListForShow = self.patientListForShow.filter(){ (patientDTO) -> Bool in
                if patientDTO.zgDoctor == userCode {
                    return true;
                } else {
                    return false;
                }
            };
        }
        if let searchKey = self.searchBar.text where searchKey.characters.count > 0 {
            self.patientListForShow = self.patientListForShow.filter(){ (patientDTO) -> Bool in
                if patientDTO.inpatientName.containsString(searchKey) || patientDTO.bedNum.containsString(searchKey) || patientDTO.inpatientId.containsString(searchKey) {
                    return true;
                } else {
                    return false;
                }
            };
        }
    }
}
