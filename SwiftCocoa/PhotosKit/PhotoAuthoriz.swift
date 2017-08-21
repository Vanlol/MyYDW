//
//  PhotoAuthoriz.swift
//  SwiftCocoa
//
//  Created by admin on 2017/8/21.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import Photos

class PhotoAuthoriz:NSObject {
    //图片资源库,获取相册的访问权限,可以监听图片资源的变化
    fileprivate let photoLibrary = PHPhotoLibrary.shared()
    
    override init() {
        super.init()
        photoLibrary.register(self)
    }
    
    deinit {
        photoLibrary.unregisterChangeObserver(self)
    }
    //检测授权状态
    func checkAuthorizationState(allow:@escaping(() -> Void),denie:@escaping(() -> Void)) {
        
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:          //允许访问
            Print.dlog("允许访问")
            allow()
        case .denied:              //拒绝访问
            Print.dlog("拒绝访问")
        case .notDetermined:       //还没选择"允许"或"拒绝", ps : 第一次进APP会来这里
            Print.dlog("询问")
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == .authorized{
                    allow()
                }else{
                    denie()
                }
            })
        case .restricted:          //没有授权
            Print.dlog("没有授权")
            denie()
        }
    }
    
}

extension PhotoAuthoriz:PHPhotoLibraryChangeObserver {
    
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        Print.dlog("相册发生变化")
    }
    
}






