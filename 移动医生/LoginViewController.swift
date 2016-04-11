//
//  LoginViewController.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/6.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit
import Alamofire

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
        if let str:String = Utils.getLoginUrlStr() {
            if let userName = usernameTextField.text {
                if let passWord:String = passwordTextField.text {
                    changeRememberLoginMsg();
                    let params = ["userCode":userName, "pwd":passWord];
                    let request = Alamofire.request(.GET, str, parameters: params);
                    print(request);
                    request.responseString { response in
                        print(response);
                    };
                }
            }
            
        } else {
            print("nil");
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
