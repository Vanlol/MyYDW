//
//  YDCommunityViewModel.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/25.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation

class YDCommunityViewModel {
    
    let discoverService = DiscoverService.shared
    
    func loadYDCommunity(closure:@escaping((YDCommunityModel) -> Void),failed:@escaping (() -> Void)) {
        discoverService.loadYDCommunityData(success: { (data) in
            if let mod = data as? YDCommunityModel {
                closure(mod)
            }
        }) { 
            failed()
        }
    }
    
    func findBannerUrls(data:YDCommunityModel,closure:(([String]) -> Void)) {
        var urls = [String]()
        for model in data.banner {
            urls.append(model.thumb)
        }
        closure(urls)
    }
    
}
