//
//  ViewController.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/5.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController!.setNavigationBarHidden(true, animated: animated);
    }
}

