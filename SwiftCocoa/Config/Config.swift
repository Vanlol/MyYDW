//
//  Config.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/3.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
/*
 运行环境
 dev本地开发，webTest外网测试，production生产,productionText 218生产测试 ,kengFive 银多5.0 ,UATfive  uat测试接口
 */
enum Env {
    case dev, webTest, production ,productionText , kengFive ,five , UATfive, SITfive , BaiSi
}

struct Config {
    /***** 切换环境修改这里 开始 ******/
    //应用运行环境（dev本地开发，webTest外网测试，production生产,productionText 218生产测试）
    
    let env = Env.five
    
    /***** 切换环境修改这里 结束 ******/
    
    var phpApi = ""             //php接口地址
    var javaApi = ""            //java接口地址
    var webUrl = ""             //web页面地址
    var xieyiUrl = ""           //协议地址
    var BBSWebUrl = ""          //临时加的论坛外网地址
    
    
    init() {
        switch env {
        //本地开发环境
        case .dev:
            phpApi = "http://192.168.1.225:15520/Member/"
            javaApi = "http://192.168.0.216:8081/api/"
            webUrl = "http://192.168.1.233/yinduowx4119/"
        //外网测试环境
        case .webTest:
            phpApi = "http://121.43.118.86:15520/Member/"
            javaApi = "http://121.43.118.86:7777/api/"
            xieyiUrl = "http://121.43.118.86:6016/"
            webUrl = "http://m.yinduoziben.net/"
            BBSWebUrl = "http://121.43.118.86:3016/"
        //生产环境11
        case .production:
            phpApi = "https://www.yinduowang.com/papic/Member/"
            javaApi = "http://www.yinduowang.com/api/"
            webUrl = "http://appc.yinduoziben.com/"
            xieyiUrl = "http://www.yinduowang.com/"
            BBSWebUrl = "http://bbsc.yinduowang.com/"
        //218生产测试环境
        case .productionText:
            phpApi = "http://218.244.133.47:10401/Member/"
            javaApi = "http://www.yinduowang.com/api/"
            webUrl = "http://appc.yinduoziben.com/"
            xieyiUrl = "http://www.yinduowang.com/"
            BBSWebUrl = "http://114.55.58.147:3017/"
        case .kengFive:
            phpApi = "http://112.124.106.105:21111/Member/"
            javaApi = "http://121.43.118.86:7777/api/"
            xieyiUrl = "http://112.124.106.105:21112/"
            webUrl = "http://112.124.106.105:21113/"
            BBSWebUrl = "http://121.43.118.86:3016/"
        case .five:
            phpApi = "http://121.40.92.117:21111/Member/"
            javaApi = "http://121.40.92.117:7777/api/"
            xieyiUrl = "http://121.40.92.117:21112/"
            webUrl = "http://121.40.92.117:21113/"
            BBSWebUrl = "http://121.40.92.117:21114/"
        case .UATfive:
            phpApi = "http://121.43.118.86:21114/Member/"
            javaApi = "http://121.43.118.86:7777/api/"
            xieyiUrl = "http://121.40.92.117:21115/"
            webUrl = "http://121.43.118.86:21116/"
            BBSWebUrl = "http://121.43.118.86:3016/"
        case .SITfive:
            phpApi = "http://121.43.118.86:11114/Member/"
            javaApi = "http://121.40.92.117:7777/api/"
            xieyiUrl = "http://121.43.118.86:11115/"
            webUrl = "http://121.43.118.86:11116/"
            BBSWebUrl = "http://121.43.118.86:3016/"
        case .BaiSi:
            phpApi = "http://121.43.118.86:11114/Member/"
            javaApi = "http://121.40.92.117:7777/api/"
            xieyiUrl = "http://121.43.118.86:11115/"
            webUrl = "http://121.43.118.86:11116/"
            BBSWebUrl = "http://121.43.118.86:3016/"
        }
    }
    
    
}
