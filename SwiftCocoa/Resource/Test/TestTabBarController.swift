//
//  TestTabBarController.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/6.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class TestTabBarController: UITabBarController {
    //MARK: 懒加载的viewModel
    lazy var testViewModel = TestTabBarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
        setUpTabBarItem()
        tabBar.addSubview(centerBtn)
        delegate = self
        blindViewModel()
    }
    
    /**
     * 测试viewModel
     */
    fileprivate func blindViewModel() {
        testViewModel.testTabbarClosure = {() -> Void in
            
        }
    }
    
    /**
     * 设置tabbar背景色与阴影颜色
     */
    fileprivate func setUpTabBar() {
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage(named: "tabbar-light")
        tabBar.layer.shadowOffset = CGSize.zero
        tabBar.layer.shadowColor = 0xaaaaaa.HexColor.cgColor
        tabBar.layer.shadowOpacity = 1
        tabBar.layer.shadowRadius = 2
    }
    /**
     * 设置item字体与颜色
     */
    fileprivate func setUpTabBarItem() {
        let item = UITabBarItem.appearance()
        var norAttrs = [String:Any]()
        norAttrs[NSForegroundColorAttributeName] = 0x8190a7.HexColor
        norAttrs[NSFontAttributeName] = UIFont.systemFont(ofSize: 12)
        var seleAttrs = [String:Any]()
        seleAttrs[NSForegroundColorAttributeName] = 0xffa623.HexColor
        seleAttrs[NSFontAttributeName] = UIFont.systemFont(ofSize: 12)
        item.setTitleTextAttributes(norAttrs, for: .normal)
        item.setTitleTextAttributes(seleAttrs, for: .selected)
    }
    
    fileprivate lazy var centerBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "tabBar_publish_icon"), for: .normal)
        btn.setImage(UIImage(named: "tabBar_publish_click_icon"), for: .highlighted)
        let width = UIScreen.main.bounds.width / CGFloat((self.viewControllers?.count)!)
        let rect = CGRect(x: 0, y: 0, width: width, height: 49)
        btn.frame = rect.offsetBy(dx: 2*width, dy: 0)
        btn.addTarget(self, action: #selector(centerBtnClick), for: .touchUpInside)
        return btn
    }()
    /**
     * 中间按钮点击事件
     */
    func centerBtnClick() {
        Print.dlog("centerBtnClick")
    }
    
}

extension TestTabBarController:UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == tabBar.items?[1] {
            item.image = UIImage(named: "main_tabbar_finance")
            ((viewControllers?[0] as! UINavigationController).viewControllers[0] as! MainViewController).mainVM.tabbarItemClickClosure?()
        }else if item == tabBar.items?[3] {
            item.image = UIImage(named: "main_tabbar_discover")
            ((viewControllers?[0] as! UINavigationController).viewControllers[0] as! MainViewController).mainVM.tabbarItemClickClosure?()
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController == tabBarController.selectedViewController { return false }
        //我的
        if viewController == tabBarController.viewControllers?[4] {
            
        }
        
        return true
    }
    
}
