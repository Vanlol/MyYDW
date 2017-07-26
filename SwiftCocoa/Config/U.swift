//
//  U.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/3.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation

/**-------------新项目需要---------------**/
let suiteName = "com.yinduoziben.app"   //需要换成项目地址
let KeyMobile = "mobile"                //手机号 NWNDMkkvVEVDK1ZCell2UTZiSk5Tdz09



let userDefault = UserDefaults(suiteName: suiteName)!

class U: NSObject {
    
    class func getMobile() -> String? {
        if let al = userDefault.object(forKey: KeyMobile) as? String {
            return al
        }else{
            return ""
        }
    }
    
    class func setMobile(mobile:String) {
        userDefault.set(mobile, forKey: KeyMobile)
    }
    
}

