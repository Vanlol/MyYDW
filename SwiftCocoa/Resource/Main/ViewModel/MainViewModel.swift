//
//  MainViewModel.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/6.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation

class MainViewModel: BaseViewModel {
    
    let mainService = MainService.shared
    
    /**
     * 底部tabbarItem点击后的闭包
     */
    var tabbarItemClickClosure:(() -> Void)?
    
    func loadDiscover(closure:@escaping ((DiscoverModel) -> Void)) {
        mainService.loadTabBarItemRedPoint { (data) in
            if let mod = data as? DiscoverModel {
                closure(mod)
            }
        }
        
    }
    
    func loadMain(closure:@escaping ((MainModel) -> Void)) {
        mainService.loadMainData { (data) in
            if let mod = data as? MainModel {
                closure(mod)
            }
        }
    }
    
    func findBannerUrls(mainMod:MainModel,closure:@escaping(([String]) -> Void)) {
        var urls = [String]()
        for bannerMod in mainMod.banner {
            urls.append(bannerMod.thumb)
        }
//        urls.append(mainMod.banner[0].thumb)
        closure(urls)
    }
    
    func findNoticesStrs(mainMod:MainModel,closure:@escaping(([String]) -> Void)) {
        var notices = [String]()
        for bannerMod in mainMod.msg_list {
            notices.append(bannerMod.title)
        }
        closure(notices)
    }
}
