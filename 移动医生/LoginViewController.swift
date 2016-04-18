//
//  LoginViewController.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/6.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var savePasswordSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        loadRememberedLoginMsg();
        usernameOrPasswordEditingChanged(NSNull);
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.navigationBarHidden = true;
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.navigationBarHidden = false;
    }
    
    @IBAction func hideSoftKeyboard() {
        self.view.endEditing(true);
    }
    
    @IBAction func usernameOrPasswordEditingChanged(sender: AnyObject) {
        if usernameTextField.text?.lengthOfBytesUsingEncoding(NSUnicodeStringEncoding) > 0 && passwordTextField.text?.lengthOfBytesUsingEncoding((NSUnicodeStringEncoding)) > 0 {
            loginButton.enabled = true;
        } else {
            loginButton.enabled = false;
        }
    }
    
    @IBAction func fieldsDidEndOnExit(sender: UITextField) {
        if sender == usernameTextField {
            passwordTextField.becomeFirstResponder();
        } else if sender == passwordTextField {
            passwordTextField.resignFirstResponder();
        }
    }
    
    @IBAction func loginButtonDidClick(sender: AnyObject) {
        if let url:String = NetWorkUtils.getLoginUrlStr() {
            if let userName = usernameTextField.text, let passWord = passwordTextField.text {
                changeRememberLoginMsg();
                let params = ["userCode":userName, "pwd":passWord];
                SVProgressHUD.show();
                log.verbose("用户点击了登录");
                NetWorkUtils.requestForJson(url: url, parameters: params) { respone in
                    if let data:Dictionary<String,AnyObject> = respone["data"] as? Dictionary, let user:Dictionary<String,AnyObject> = data["user"] as? Dictionary {
                        SVProgressHUD.dismiss();
//                        if let usrDTO = JSON(user).object as? UserDTO {
//                            _ = usrDTO;
//                        }
                        let userDTO:UserDTO = UserDTO.init(dic: user);
                        LoginUserInfoUtils.saveUserInfo(userDTO);
                        
                        let sb = UIStoryboard(name:"Main", bundle: nil);
                        let deptVC = sb.instantiateInitialViewController()!;
                        self.navigationController?.presentViewController(deptVC, animated: true, completion: nil);
                    } else {
                        SVProgressHUD.showErrorWithStatus("服务器出错，请联系管理员");
                        log.error(respone.debugDescription);
                    }
                };
            } else {
                SVProgressHUD.showErrorWithStatus("请填写用户名和密码");
            }
        } else {
            SVProgressHUD.showErrorWithStatus("无法获取登录url，请联系开发人员");
        }
        
    }
    
    // 保存帐号密码
    func changeRememberLoginMsg() -> Void {
        let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults();
        var userName:String = "";
        var password:String = "";
        if (savePasswordSwitch.on) {
            userName = usernameTextField.text!;
            password = passwordTextField.text!;
        }
        userDefaults.setObject(userName, forKey: "login_username");
        userDefaults.setObject(password, forKey: "login_password");
        userDefaults.synchronize();
    }
    
    func loadRememberedLoginMsg() -> Void {
        let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults();
        if let userName:String = userDefaults.stringForKey("login_username") {
            if let passWord:String = userDefaults.stringForKey("login_password") {
                usernameTextField.text = userName;
                passwordTextField.text = passWord;
            }
        }
        
    }
    
}
