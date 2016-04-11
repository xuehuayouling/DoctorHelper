//
//  Utils.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/8.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit

class Utils: NSObject {

    class func getBaseUrlStr() -> String? {
        let plistPath:String = NSBundle.mainBundle().pathForResource("constants", ofType: "plist")!;
        let dic:NSMutableDictionary = NSMutableDictionary(contentsOfFile: plistPath)!;
        if let value:String = dic.valueForKey("baseUrl") as? String {
            return value;
        }
        return nil;
    }
    
    class func getLoginUrlStr() -> String? {
        if let baseUrl:String = getBaseUrlStr() {
            let plistPath:String = NSBundle.mainBundle().pathForResource("constants", ofType: "plist")!;
            let dic:NSMutableDictionary = NSMutableDictionary(contentsOfFile: plistPath)!;
            if let value:String = dic.valueForKey("loginKey") as? String {
                return baseUrl + "/" + value;
            }
        }
        return nil;
    }
}
