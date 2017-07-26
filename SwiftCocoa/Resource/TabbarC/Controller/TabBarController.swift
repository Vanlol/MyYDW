//
//  TabBarController.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/3.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(CustomTabBar(), forKeyPath: "tabBar")
        addChildVC()
        delegate = self
    }
    /**
     * 添加子控制器
     */
    fileprivate func addChildVC() {
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewControllerID")
        let financeVC = UIStoryboard(name: "Finance", bundle: nil).instantiateViewController(withIdentifier: "FinanceViewControllerID")
        let discoverVC = UIStoryboard(name: "Discover", bundle: nil).instantiateViewController(withIdentifier: "DiscoverViewControllerID")
        let mineVC = UIStoryboard(name: "Mine", bundle: nil).instantiateViewController(withIdentifier: "MineViewControllerID")
        setupChildVC(viewController: mainVC, titleStr: "首页", image: "main_tabbar_home", selectImage: "main_tabbar_home_select")
        setupChildVC(viewController: financeVC, titleStr: "产品", image: "main_tabbar_finance_point", selectImage: "main_tabbar_finance_select")
        setupChildVC(viewController: discoverVC, titleStr: "发现", image: "main_tabbar_discover_point", selectImage: "main_tabbar_discove_select")
        setupChildVC(viewController: mineVC, titleStr: "我的", image: "main_tabbar_asset", selectImage: "main_tabbar_asset_select")
    }
    /**
     * 设置子控制器
     */
    fileprivate func setupChildVC(viewController:UIViewController,titleStr:String,image:String,selectImage:String) {
        viewController.tabBarItem.title = titleStr
        viewController.tabBarItem.image = UIImage(named: image)
        viewController.tabBarItem.selectedImage = UIImage(named: selectImage)
        let nav = UINavigationController(rootViewController: viewController)
        addChildViewController(nav)
    }
    
}

extension TabBarController:UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        //防止tabbarController的连点
        if tabBarController.selectedViewController == viewController { return false }
        //首页
        if viewController == tabBarController.viewControllers?[0] {
            ((viewController as! UINavigationController).viewControllers[0] as! MainViewController).mainVM.tabbarItemClickClosure?()
        }
        //产品
        if viewController == tabBarController.viewControllers?[1] {
        }
        //发现
        if viewController == tabBarController.viewControllers?[3] {
        }
        //我的
        if viewController == tabBarController.viewControllers?[4] {
        }
        
        return true
    }
    
}




