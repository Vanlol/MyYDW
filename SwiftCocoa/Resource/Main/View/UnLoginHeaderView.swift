//
//  UnLoginHeaderView.swift
//  SwiftCocoa
//
//  Created by admin on 2017/8/17.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class UnLoginHeaderView: UIView {
    
    //轮播图
    @IBOutlet weak var bannerView: UIView!
    
    class func unLoginView() -> UnLoginHeaderView {
        let vi = UINib(nibName: "UnLoginHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! UnLoginHeaderView
        
        return vi
    }

}
