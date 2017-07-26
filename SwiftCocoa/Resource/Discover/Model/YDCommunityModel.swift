//
//  YDCommunityModel.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/25.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class YDCommunityModel {
    var topic = [YDCommunityModelTopic]()
    var reply_id = ""
    var banner = [YDCommunityModelBanner]()
    var modular = [YDCommunityModelModular]()
    var comments_id = ""
}

class YDCommunityModelTopic {
    var views = ""
    var comments = ""
    var cname = ""
    var uid = ""
    var thumb = [YDCommunityModelTopicThumb]()
    var favorites = ""
    var mobile = ""
    var topic_id = ""
    var is_top = ""
    var node_id = ""
    var addtime = ""
    var title = ""
    var avatar = ""
    var is_fine = ""
    var username = ""
    var content = ""
    /** 可惜我 还没有发现 **/
    var emojiContents = NSMutableAttributedString()   //将字符串转换为表情后的字符串
    var viewHeight:CGFloat = 0                        //view的高度
    var isHiddenImageVi = false                       //是否显示图片
    var viewTrailing:CGFloat = 0                      //view距离右部的距离
}

class YDCommunityModelTopicThumb {
    var id = ""
    var img = ""
    var thumb = ""
    var uid = ""
    var topic_id = ""
}

class YDCommunityModelBanner {
    var id = ""
    var title = ""
    var thumb = ""
    var url = ""
    var sort = ""
    var url_pc = ""
}

class YDCommunityModelModular {
    var node_id = ""
    var ico = ""
    var href = ""
    var cname = ""
    var admin_use = ""
}

