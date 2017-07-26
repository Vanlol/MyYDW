//
//  MainService.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/7.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SwiftyJSON


class MainService {
    
    static let shared = MainService()
    
    func loadMainData(closure: @escaping ((Any) -> Void)) {
        RestAPI.sendGETRequest(request: P.HOME_USER_DATA, params: ["mm" : U.getMobile()!], success: { (data) in
            var json = JSON(data!)
            Print.dlog("首页:\(json)")
            let mainM = MainModel()
            mainM.pri_url = json["pri_url"].stringValue
            var msg_list = [MainModelMsg_list]()
            for (_,subJson) : (String,JSON) in json["msg_list"] {
                let msg_listM = MainModelMsg_list()
                msg_listM.id = subJson["id"].stringValue
                msg_listM.title = subJson["title"].stringValue
                msg_listM.content = subJson["content"].stringValue
                msg_listM.time = subJson["time"].stringValue
                msg_list.append(msg_listM)
            }
            mainM.msg_list = msg_list
            mainM.jixin = json["jixin"].intValue
            mainM.hu_title = json["hu_title"].stringValue
            mainM.money_total = json["money_total"].stringValue
            var products = [MainModelProducts]()
            for (_,subJson) : (String,JSON) in json["products"] {
                let productsM = MainModelProducts()
                productsM.productId = subJson["productId"].stringValue
                productsM.addApr = subJson["addApr"].stringValue
                productsM.aprDesc = subJson["aprDesc"].stringValue
                productsM.cycle = subJson["cycle"].stringValue
                productsM.apr = subJson["apr"].stringValue
                productsM.url = subJson["url"].stringValue
                productsM.desc = subJson["desc"].arrayObject as! [String]
                productsM.title = subJson["title"].stringValue
                productsM.type = subJson["type"].intValue
                productsM.base_url = subJson["base_url"].stringValue
                productsM.name = subJson["name"].stringValue
                productsM.cycleDesc = subJson["cycleDesc"].stringValue
                products.append(productsM)
            }
            mainM.products = products
            var banner = [MainModelBanner]()
            for (_,subJson) : (String,JSON) in json["banner"] {
                let bannerM = MainModelBanner()
                bannerM.id = subJson["id"].stringValue
                bannerM.title = subJson["title"].stringValue
                bannerM.thumb = subJson["thumb"].stringValue
                bannerM.url = subJson["url"].stringValue
                bannerM.sort = subJson["sort"].stringValue
                bannerM.type = subJson["type"].stringValue
                banner.append(bannerM)
            }
            mainM.banner = banner
            mainM.products_version = json["products_version"].stringValue
            mainM.pri_title = json["pri_title"].stringValue
            mainM.hu_url = json["hu_url"].stringValue
            mainM.ac_url = json["ac_url"].stringValue
            mainM.days_total = json["days_total"].intValue
            mainM.activity_version = json["activity_version"].stringValue
            mainM.revenue_total = json["revenue_total"].stringValue
            mainM.hu = json["hu"].intValue
            var banner_product = [MainModelBanner_product]()
            for (_,subJson) : (String,JSON) in json["banner_product"] {
                let banner_productM = MainModelBanner_product()
                banner_productM.id = subJson["id"].stringValue
                banner_productM.title = subJson["title"].stringValue
                banner_productM.thumb = subJson["thumb"].stringValue
                banner_productM.url = subJson["url"].stringValue
                banner_productM.sort = subJson["sort"].stringValue
                banner_product.append(banner_productM)
            }
            mainM.banner_product = banner_product
            mainM.people_total = json["people_total"].stringValue
            mainM.ac_tan_url = json["ac_tan_url"].stringValue
            closure(mainM)
        }) { (error) in
            
        }
    }
    
    func loadTabBarItemRedPoint(closure: @escaping ((Any) -> Void)) {
        RestAPI.sendGETRequest(request: P.DISCOVERY_ACTIVITY, params: ["mm" : U.getMobile()!], success: { (data) in
            var json = JSON(data!)
            //Print.dlog("发现:\(json)")
            let discoverM = DiscoverModel()
            discoverM.img_src = json["img_src"].stringValue
            discoverM.bbs_url = json["bbs_url"].stringValue
            discoverM.art_id = json["art_id"].stringValue
            discoverM.save_time = json["save_time"].intValue
            discoverM.risk = json["risk"].arrayObject as! [String]
            discoverM.bbs = json["bbs"].stringValue
            discoverM.img_id = json["img_id"].stringValue
            discoverM.reply_id = json["reply_id"].stringValue
            discoverM.hu_title = json["hu_title"].stringValue
            discoverM.comments_id = json["comments_id"].stringValue
            discoverM.img_title = json["img_title"].stringValue
            discoverM.mm = json["mm"].stringValue
            discoverM.activity = json["activity"].stringValue
            discoverM.shop_sign = json["shop_sign"].stringValue
            discoverM.hu_url = json["hu_url"].stringValue
            discoverM.bbs_sign = json["bbs_sign"].stringValue
            discoverM.base_url = json["base_url"].stringValue
            discoverM.news = json["news"].stringValue
            discoverM.shop = json["shop"].stringValue
            discoverM.notice = json["notice"].stringValue
            discoverM.weixin = json["weixin"].intValue
            discoverM.shop_url = json["shop_url"].stringValue
            discoverM.report = json["report"].arrayObject as! [String]
            discoverM.dynamic_id = json["dynamic_id"].stringValue
            closure(discoverM)
        }) { (error) in
            
        }
    }
    
}

