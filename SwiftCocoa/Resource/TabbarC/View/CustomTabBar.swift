//
//  CustomTabBar.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/3.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {
    
    fileprivate lazy var centerBtn:UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "tabBar_publish_icon"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "tabBar_publish_click_icon"), for: .highlighted)
        btn.bounds.size = (btn.currentBackgroundImage?.size)!
        btn.addTarget(self, action: #selector(centerBtnClick), for: .touchUpInside)
        return btn
    }()
    /**
     * 中间按钮点击事件
     */
    func centerBtnClick() {
        Print.dlog("centerBtnClick")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(centerBtn)
        testTwo()
        setupTabbarItem()
    }
    /**
     * "toobar"图片上带有阴影
     * "toobar"图片的高度无要求
     */
    fileprivate func testOne(){
        backgroundImage = UIImage()
        shadowImage = UIImage()
        let imgVi = UIImageView(image: UIImage(named: "toobar"))
        imgVi.frame = CGRect(x: 0, y: -5, width: C.SCREEN_WIDTH, height: 54)
        insertSubview(imgVi, at: 0)
    }
    /**
     * "newtabbar"图片上没有阴影
     * "newtabbar"图片的高度必须为"49"
     */
    fileprivate func testTwo(){
        backgroundImage = UIImage(named: "tabbar-light")
        shadowImage = UIImage()
        layer.shadowColor = 0xaaaaaa.HexColor.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 2
        layer.shadowOpacity = 1
    }
    /**
     * 设置背景颜色
     */
    fileprivate func testThree() {
        barTintColor = 0x0.HexColor
        shadowImage = UIImage()
    }
    /**
     * 设置tabbarItem的字体大小与颜色
     */
    fileprivate func setupTabbarItem() {
        var normalAttrs = [String:Any]()
        normalAttrs[NSForegroundColorAttributeName] = 0x8190a7.HexColor
        normalAttrs[NSFontAttributeName] = UIFont.systemFont(ofSize: 12)
        var selectAttrs = [String:Any]()
        selectAttrs[NSForegroundColorAttributeName] = 0xffa623.HexColor
        selectAttrs[NSFontAttributeName] = UIFont.systemFont(ofSize: 12)
        let item = UITabBarItem.appearance()
        item.setTitleTextAttributes(normalAttrs, for: .normal)
        item.setTitleTextAttributes(selectAttrs, for: .selected)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutItems()
        layoutCenterButton()
    }
    /**
     * 重新布局新添加按钮
     */
    fileprivate func layoutCenterButton(){
        let width = bounds.size.width
        let height = bounds.size.height
        centerBtn.center = CGPoint(x: width * 0.5, y: height * 0.5)
        let y:CGFloat = 0
        let w = width / 5
        let h = height
        var index = 0
        for btn in subviews {
            if (!btn.isKind(of: UIControl.classForCoder()) || btn == centerBtn) {} else {
                let count = index > 1 ? (index + 1):index
                let x = w * CGFloat(count)
                btn.frame = CGRect(x: x, y: y, width: w, height: h)
                index += 1
            }
        }
    }
    /**
     * 重新布局Item的距离和位置
     */
    fileprivate func layoutItems(){
        for item in items! {
            item.imageInsets = UIEdgeInsets(top: -3, left: 0, bottom: 3, right: 0)
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}








