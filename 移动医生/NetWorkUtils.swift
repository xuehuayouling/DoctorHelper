//
//  Utils.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/8.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class NetWorkUtils: NSObject {

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
    
    class func getDpetListUrlStr() -> String? {
        if let baseUrl:String = getBaseUrlStr() {
            let plistPath:String = NSBundle.mainBundle().pathForResource("constants", ofType: "plist")!;
            let dic:NSMutableDictionary = NSMutableDictionary(contentsOfFile: plistPath)!;
            if let value:String = dic.valueForKey("deptListKey") as? String {
                return baseUrl + "/" + value;
            }
        }
        return nil;
    }
    
    
    class func requestForJson(method: Alamofire.Method = .GET, url: String, parameters: [String: AnyObject]? = nil, completionHandler: Dictionary<String, AnyObject> -> Void) {
        let request = Alamofire.request(method, url, parameters: parameters);
        log.info(request.description);
        request.responseJSON { response in
            if response.result.isSuccess {
                if let dic:Dictionary<String, AnyObject> = response.result.value as? Dictionary {
                    if (dic["message"] as? String) != nil {
                        log.info(response.result.debugDescription);
                        completionHandler(dic);
                    } else {
                        SVProgressHUD.showErrorWithStatus("服务器出错，请重试或联系管理员！");
                        log.error(response.result.debugDescription);
                    }
                } else {
                    SVProgressHUD.showErrorWithStatus("服务器出错，请重试或联系管理员！");
                    log.error(response.debugDescription);
                }
            } else {
                SVProgressHUD.showErrorWithStatus(response.result.error?.localizedDescription);
                log.error(response.result.error.debugDescription);
            }
        }
    }
    
}
