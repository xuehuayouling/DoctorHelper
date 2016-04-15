//
//  ColorUtils.swift
//  移动医生
//
//  Created by 杨生青 on 16/4/14.
//  Copyright © 2016年 杨生青. All rights reserved.
//

import UIKit

class ColorUtils: NSObject {

    class func colorFromString(str: NSString?) -> UIColor? {
        if (str == nil) {
            return nil;
        }
        if (str!.length < 6) {
            return nil;
        }
        var subStr:NSString = str!.uppercaseString;
        var color = 0;
        for _ in 1...6 {
            color <<= 4;
            let sub:NSString = subStr.substringToIndex(1);
            if sub == "A" {
                color += 10;
            } else if sub == "B" {
                color += 11;
            } else if sub == "C" {
                color += 12;
            } else if sub == "D" {
                color += 13;
            } else if sub == "E" {
                color += 14;
            } else if sub == "F" {
                color += 15;
            } else {
                color += sub.integerValue;
            }
            subStr = subStr.substringFromIndex(1);
        }
        let blue = color % 0x100;
        color >>= 8;
        let green = color % 0x100;
        color >>= 8;
        let red = color % 0x100;
        return UIColor.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0);
    }
    
    
}
