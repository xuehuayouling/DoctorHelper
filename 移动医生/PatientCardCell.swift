//
//  PatientCardCell.swift
//  患者列表界面的患者卡片
//
//  Created by 杨生青 on 16/4/14.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit
import WebImage

class PatientCardCell: UICollectionViewCell {

        /// 床号
    @IBOutlet weak var bedNumLabel: UILabel!
        /// 患者头像
    @IBOutlet weak var patientIconImageView: UIImageView!
        /// 患者性别
    @IBOutlet weak var patientSexIconImageView: UIImageView!
        /// 护理等级
    @IBOutlet weak var tendLevelLabel: UILabel!
        /// 患者姓名
    @IBOutlet weak var patientNameLabel: UILabel!
        /// 患者年龄
    @IBOutlet weak var patientAgeLabel: UILabel!
        /// 医保类型
    @IBOutlet weak var patiClassLabel: UILabel!
        /// 住院id
    @IBOutlet weak var hospitalIDLabel: UILabel!
        /// 诊断内容
    @IBOutlet weak var diagnosisLabel: UILabel!
    
    func loadData(patient: PatientDTO) {
        bedNumLabel.text = patient.bedNum + "床";
        patientNameLabel.text = patient.inpatientName;
        patientAgeLabel.text = patient.age;
//        [self configTendLevelLabel:patient.nurseLevel];
        patiClassLabel.text = patient.costType;
        hospitalIDLabel.text = patient.inpatientId;
        diagnosisLabel.text = patient.result;
        configSexImageView(patient.sex);
        configPhotImageView("");
    }
    
    private func configSexImageView(sex: String) {
        if sex == "1" {
            patientSexIconImageView.image = UIImage.init(named: "患者列表-4");
        } else if sex == "2" {
            patientSexIconImageView.image = UIImage.init(named: "患者列表-5");
        }
    }
    
    private func configPhotImageView(url: String) {
        patientIconImageView.layer.masksToBounds = true;
        patientIconImageView.layer.cornerRadius = patientIconImageView.bounds.size.width*0.5;
        patientIconImageView.sd_setImageWithURL(NSURL.init(string: url), placeholderImage: UIImage.init(named: "登录页面-1"));
    }
}
