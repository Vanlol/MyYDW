//
//  DiscoverService.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/25.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SwiftyJSON


class DiscoverService {
    
    static let shared = DiscoverService()
    
    
    func loadCommunityRedPoint(success:@escaping((Any) -> Void)) {
        RestAPI.sendGETRequest(request: P.DISCOVERY_ACTIVITY, params: ["mm" : U.getMobile()!], success: { (data) in
            let json = JSON(data!)
            Print.dlog("发现首页\(json)")
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
            success(discoverM)
        }) { (error) in
            
        }
    }
    
    
    
    func loadYDCommunityData(success:@escaping ((Any) -> Void),failed:@escaping (() -> Void)) {
        RestAPI.sendGETRequest(request: P.ACTIVITY_BANNER, params: ["mm":U.getMobile()!], success: { (data) in
            var json = JSON(data!)
            Print.dlog("银多社区首页\(json)")
            let communityModel = YDCommunityModel()
            communityModel.comments_id = json["comments_id"].stringValue
            communityModel.reply_id = json["reply_id"].stringValue
            var topic = [YDCommunityModelTopic]()
            for (_,topicjson):(String,JSON) in json["topic"] {
                let modelTopic = YDCommunityModelTopic()
                modelTopic.views = topicjson["views"].stringValue
                modelTopic.comments = topicjson["comments"].stringValue
                modelTopic.cname = topicjson["cname"].stringValue
                modelTopic.uid = topicjson["uid"].stringValue
                var topicThumb = [YDCommunityModelTopicThumb]()
                for (_,thumbjson) : (String,JSON) in topicjson["thumb"] {
                    let thumbM = YDCommunityModelTopicThumb()
                    thumbM.id = thumbjson["id"].stringValue
                    thumbM.img = thumbjson["img"].stringValue
                    thumbM.thumb = thumbjson["thumb"].stringValue
                    thumbM.uid = thumbjson["uid"].stringValue
                    thumbM.topic_id = thumbjson["topic_id"].stringValue
                    topicThumb.append(thumbM)
                }
                modelTopic.thumb = topicThumb
                modelTopic.favorites = topicjson["favorites"].stringValue
                modelTopic.mobile = topicjson["mobile"].stringValue
                modelTopic.topic_id = topicjson["topic_id"].stringValue
                modelTopic.is_top = topicjson["is_top"].stringValue
                modelTopic.node_id = topicjson["node_id"].stringValue
                modelTopic.addtime = topicjson["addtime"].stringValue
                modelTopic.title = topicjson["title"].stringValue
                modelTopic.avatar = topicjson["avatar"].stringValue
                modelTopic.is_fine = topicjson["is_fine"].stringValue
                modelTopic.username = topicjson["username"].stringValue
                modelTopic.content = topicjson["content"].stringValue
                
                modelTopic.isHiddenImageVi = modelTopic.thumb.count > 0 ? false : true
                modelTopic.viewTrailing = modelTopic.thumb.count > 0 ? 120 : 15
                let viewWidth = modelTopic.thumb.count > 0 ?  (C.SCREEN_WIDTH - 135) : (C.SCREEN_WIDTH - 30)
                var viewHeight:CGFloat = 5
                let contentHeight = modelTopic.content.stringHeightWith(fontSize: 14, width: viewWidth)
                viewHeight += contentHeight > 36 ? 36 : contentHeight + 2
                let titleHeight = modelTopic.title.stringHeightWith(fontSize: 15, width: viewWidth)
                viewHeight += titleHeight > 36 ? 36 : titleHeight
                modelTopic.viewHeight = viewHeight
                
                topic.append(modelTopic)
            }
            communityModel.topic = topic
            var banner = [YDCommunityModelBanner]()
            for (_,bannerjson) : (String,JSON) in json["banner"] {
                let modelBanner = YDCommunityModelBanner()
                modelBanner.id = bannerjson["id"].stringValue
                modelBanner.title = bannerjson["title"].stringValue
                modelBanner.thumb = bannerjson["thumb"].stringValue
                modelBanner.url = bannerjson["url"].stringValue
                modelBanner.sort = bannerjson["sort"].stringValue
                modelBanner.url_pc = bannerjson["url_pc"].stringValue
                banner.append(modelBanner)
            }
            communityModel.banner = banner
            var modular = [YDCommunityModelModular]()
            for (_,modularjson) : (String,JSON) in json["modular"] {
                let modularM = YDCommunityModelModular()
                modularM.node_id = modularjson["node_id"].stringValue
                modularM.ico = modularjson["ico"].stringValue
                modularM.href = modularjson["href"].stringValue
                modularM.cname = modularjson["cname"].stringValue
                modularM.admin_use = modularjson["admin_use"].stringValue
                modular.append(modularM)
            }
            communityModel.modular = modular
            success(communityModel)
        }) { (error) in
            failed()
        }
    }
    
}

