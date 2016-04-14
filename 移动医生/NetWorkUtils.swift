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

    /**
     根据key获取constants.plist中的值
     
     - parameter key: key
     
     - returns: 返回Optional的值
     */
    private class func getValueForKeyFromPlist(key: String) -> String? {
        if let plistPath = NSBundle.mainBundle().pathForResource("constants", ofType: "plist"), let dic:NSDictionary = NSDictionary(contentsOfFile: plistPath), let value:String = dic.valueForKey(key) as? String {
            return value;
        }
        return nil;
    }
    
    /**
     获取服务器基本地址
     
     - returns: 服务器基本地址
     */
    class func getBaseUrlStr() -> String? {
        return getValueForKeyFromPlist("baseUrl");
    }
    
    /**
     获取登录接口地址
     
     - returns: 返回接口登录地址
     */
    class func getLoginUrlStr() -> String? {
        if let baseUrl = getBaseUrlStr(), let loginKey = getValueForKeyFromPlist("loginKey") {
            return baseUrl + "/" + loginKey;
        }
        return nil;
    }
    
    /**
     获取部门列表地址
     
     - returns: 返回部门列表地址
     */
    class func getDpetListUrlStr() -> String? {
        if let baseUrl = getBaseUrlStr(), let deptListKey = getValueForKeyFromPlist("deptListKey") {
            return baseUrl + "/" + deptListKey;
        }
        return nil;
    }
    
    /**
     获取通过部门id取病人列表的地址
     
     - returns: 返回通过部门id取病人列表的地址
     */
    class func getPatientListByDeptCodeUrlStr() -> String? {
        if let baseUrl = getBaseUrlStr(), let patientListByDeptCodeKey = getValueForKeyFromPlist("patientListByDeptCodeKey") {
            return baseUrl + "/" + patientListByDeptCodeKey;
        }
        return nil;
    }
    
    /**
     获取图片服务器的基本地址
     
     - returns: 返回图片服务器的基本地址
     */
    class func getImageBaseUrl() -> String? {
        return nil;
    }
    
    /**
     网络访问接口
     
     - parameter method:            method
     - parameter url:               url
     - parameter parameters:        参数
     - parameter completionHandler: 回调接口
     */
    class func requestForJson(method: Alamofire.Method = .GET, url: String, parameters: [String: AnyObject]? = nil, completionHandler: Dictionary<String, AnyObject> -> Void) {
        let request = Alamofire.request(method, url, parameters: parameters);
        log.info(request.debugDescription);
        request.responseJSON { response in
            if response.result.isSuccess {
                if let dic:Dictionary<String, AnyObject> = response.result.value as? Dictionary {
                    if (dic["message"] as? String) != nil && dic["statusCode"] as? String != nil {
                        if dic["statusCode"] as? String == "1" {
                            log.info(response.result.debugDescription);
                            completionHandler(dic);
                        } else {
                            SVProgressHUD.showErrorWithStatus(dic["message"] as? String);
                            log.error(response.result.debugDescription);
                        }
                        
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
    
    class func requestForImage(method: Alamofire.Method = .GET, url: String, parameters: [String: AnyObject]? = nil) {
        let request = Alamofire.request(method, url, parameters: parameters);
        log.info(request.debugDescription);
        request.validate()
    }
}
