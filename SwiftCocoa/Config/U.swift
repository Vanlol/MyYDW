//
//  U.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/3.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation

/**-------------新项目需要---------------**/
let suiteName = "com.yinduoziben.app"     //需要换成项目地址
let KeyNetType = "netWorkType"           //网络环境类型
let KeyMobile = "mobile"                //手机号 NWNDMkkvVEVDK1ZCell2UTZiSk5Tdz09

let userDefault = UserDefaults(suiteName: suiteName)!

class U: NSObject {
    //MARK: 获取网络状态环境
    class func getNetWorkType() -> String? {
        if let type = userDefault.object(forKey:  KeyNetType) as? String {
            return type
        }else{
            return ""
        }
    }
    //MARK: 设置网络状态环境
    class func setNetWorkType(newtWorkType:String) {
         userDefault.set(newtWorkType, forKey: KeyNetType)
    }
    //MARK: 获取手机号
    class func getMobile() -> String? {
        if let al = userDefault.object(forKey: KeyMobile) as? String {
            return al
        }else{
            return ""
        }
    }
    //MARK: 设置手机号
    class func setMobile(mobile:String) {
        userDefault.set(mobile, forKey: KeyMobile)
    }
    
}

