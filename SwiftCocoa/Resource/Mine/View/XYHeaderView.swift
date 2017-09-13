//
//  XYHeaderView.swift
//  SwiftCocoa
//
//  Created by 祁小峰 on 2017/9/13.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class XYHeaderView: UIView {
    
    //头像
    @IBOutlet weak var headImageView: UIImageView!{
        didSet{
            headImageView.layer.cornerRadius = 40
            headImageView.layer.masksToBounds = true
        }
    }
    //动态按钮点击事件
    @IBAction func dynamicButtonClick(_ sender: Any) {
        Print.dlog("dynamicButtonClick")
    }
    //相册按钮点击事件
    @IBAction func photoButtonClick(_ sender: Any) {
        Print.dlog("photoButtonClick")
    }
    //头像按钮点击事件
    @IBAction func headButtonClick(_ sender: Any) {
        Print.dlog("headButtonClick")
    }
    
    
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        
        return view == self ? nil : view
    }
    
}
