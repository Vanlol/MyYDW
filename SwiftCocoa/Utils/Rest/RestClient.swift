//
//  RestClient.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/7.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import AFNetworking

class RestClient : AFHTTPSessionManager {
    
    static let shared = RestClient()
    
    class var sharedInstance:RestClient {
        //设置超时时间30秒
        shared.requestSerializer.willChangeValue(forKey: "timeoutInterval")
        shared.requestSerializer.timeoutInterval = 30
        shared.requestSerializer.didChangeValue(forKey: "timeoutInterval")
        return shared
    }
    
}

