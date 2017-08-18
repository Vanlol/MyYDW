//
//  DiscoverViewModel.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/25.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation

class DiscoverViewModel {
    let discoverService = DiscoverService.shared
    
    func loadDiscoverRedPoint(closure:@escaping((DiscoverModel) -> Void)) {
        discoverService.loadCommunityRedPoint { (data) in
            if let mod = data as? DiscoverModel {
                closure(mod)
            }
        }
    }
    
}
