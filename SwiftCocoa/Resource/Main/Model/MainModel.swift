//
//  MainModel.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/7.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation

class MainModel {
    
    var pri_url = ""
    var msg_list = [MainModelMsg_list]()
    var jixin = 0
    var hu_title = ""
    var money_total = ""
    var products = [MainModelProducts]()
    var banner = [MainModelBanner]()
    var products_version = ""
    var pri_title = ""
    var hu_url = ""
    var ac_url = ""
    var days_total = 0
    var activity_version = ""
    var revenue_total = ""
    var hu = 0
    var banner_product = [MainModelBanner_product]()
    var people_total = ""
    var ac_tan_url = ""
    
}

class MainModelMsg_list {
    
    var id = ""
    var title = ""
    var content = ""
    var time = ""
    
}

class MainModelProducts {
    
    var productId = ""
    var addApr = ""
    var aprDesc = ""
    var cycle = ""
    var apr = ""
    var url = ""
    var desc = [String]()
    var title = ""
    var type = 0
    var base_url = ""
    var name = ""
    var cycleDesc = ""
    
}

class MainModelBanner {
    
    var id = ""
    var title = ""
    var thumb = ""
    var url = ""
    var sort = ""
    var type = ""
    
}

class MainModelBanner_product {
    
    var id = ""
    var title = ""
    var thumb = ""
    var url = ""
    var sort = ""
    
}


