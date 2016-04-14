//
//  PatientDTO.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/14.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit

class PatientDTO: NSObject {

    let zgDoctorName:String; // "应志伟",
    let pay:String; // 50735,
    let tagMap:Array<AnyObject>?;
    let sex:String; // "1",
    let gcDoctor:String; // "061025001",
    let wardId:String; // "185",
    let deptId:String; // "184",
    let costType:String; // "自费",
    let bedCode:String; // "MN01",
    let bedNum:String; // "01",
    let nurseLevel:String; // "1",
    let nurse:String; // "071026005",
    let inpatientName:String; // "测试14052801",
    let inDate:String; // "2014-06-03 14:57:00.0",
    let prePay:String; // 20102,
    let wardName:String; // "模拟病区",
    let nurseName:String; // "何妮",
    let idNumber:String; // "123456789123456789",
    let deptName:String; // "模拟科室",
    let phone:String; // "126",
    let contactPerson:String; // "张三",
    let inpatientId:String; // "113616",
    let age:String; // "38岁",
    let prePayBalance:String; // -30633,
    let inpatientCode:String; // "00112929",
    let gcDoctorName:String; // "应志伟",
    let address:String; // "明州医院",
    let zgDoctor:String; // "061025001"
    
    init(dic:Dictionary<String,AnyObject>) {
        zgDoctorName = (dic["zgDoctorName"] as? String) == nil ? "" : (dic["zgDoctorName"] as? String)!;
        pay = (dic["pay"] as? String) == nil ? "" : (dic["pay"] as? String)!;
        tagMap = (dic["tagMap"] as? Array<AnyObject>);
        sex = (dic["sex"] as? String) == nil ? "" : (dic["sex"] as? String)!;
        gcDoctor = (dic["gcDoctor"] as? String) == nil ? "" : (dic["gcDoctor"] as? String)!;
        wardId = (dic["wardId"] as? String) == nil ? "" : (dic["wardId"] as? String)!;
        deptId = (dic["deptId"] as? String) == nil ? "" : (dic["deptId"] as? String)!;
        costType = (dic["costType"] as? String) == nil ? "" : (dic["costType"] as? String)!;
        bedCode = (dic["bedCode"] as? String) == nil ? "" : (dic["bedCode"] as? String)!;
        bedNum = (dic["bedNum"] as? String) == nil ? "" : (dic["bedNum"] as? String)!;
        nurseLevel = (dic["nurseLevel"] as? String) == nil ? "" : (dic["nurseLevel"] as? String)!;
        nurse = (dic["nurse"] as? String) == nil ? "" : (dic["nurse"] as? String)!;
        inpatientName = (dic["inpatientName"] as? String) == nil ? "" : (dic["inpatientName"] as? String)!;
        inDate = (dic["inDate"] as? String) == nil ? "" : (dic["inDate"] as? String)!;
        prePay = (dic["prePay"] as? String) == nil ? "" : (dic["prePay"] as? String)!;
        wardName = (dic["wardName"] as? String) == nil ? "" : (dic["wardName"] as? String)!;
        nurseName = (dic["nurseName"] as? String) == nil ? "" : (dic["nurseName"] as? String)!;
        idNumber = (dic["idNumber"] as? String) == nil ? "" : (dic["idNumber"] as? String)!;
        deptName = (dic["deptName"] as? String) == nil ? "" : (dic["deptName"] as? String)!;
        phone = (dic["phone"] as? String) == nil ? "" : (dic["phone"] as? String)!;
        contactPerson = (dic["contactPerson"] as? String) == nil ? "" : (dic["contactPerson"] as? String)!;
        inpatientId = (dic["inpatientId"] as? String) == nil ? "" : (dic["inpatientId"] as? String)!;
        age = (dic["age"] as? String) == nil ? "" : (dic["age"] as? String)!;
        prePayBalance = (dic["prePayBalance"] as? String) == nil ? "" : (dic["prePayBalance"] as? String)!;
        inpatientCode = (dic["inpatientCode"] as? String) == nil ? "" : (dic["inpatientCode"] as? String)!;
        gcDoctorName = (dic["gcDoctorName"] as? String) == nil ? "" : (dic["gcDoctorName"] as? String)!;
        address = (dic["address"] as? String) == nil ? "" : (dic["address"] as? String)!;
        zgDoctor = (dic["zgDoctor"] as? String) == nil ? "" : (dic["zgDoctor"] as? String)!;
    }
}
