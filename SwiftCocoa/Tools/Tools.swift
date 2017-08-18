//
//  Tools.swift
//  SwiftCocoa
//
//  Created by admin on 2017/8/18.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation

class Tools {
    //获取本地的版本号
    class func getLocalVersion() -> String {
        let infoDict = Bundle.main.infoDictionary! as [String:Any]
        let version = infoDict["CFBundleShortVersionString"] as! String
        let ver = "当前版本:" + version
        return ver
    }
    
}


