//
//  LoginViewController.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/6.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad();
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
        
    }
}
