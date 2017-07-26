//
//  BaseViewController.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/4.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    /**
     * 记录是否正在显示加载动画
     */
    public var isHud = false
    fileprivate lazy var hudView:ProgressHUD = {
        let vi = ProgressHUD(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        return vi
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /**
     * 显示导航栏
     */
    public func showNav() {
        navigationController?.isNavigationBarHidden = false
    }
    /**
     * 隐藏导航栏
     */
    public func hideNav() {
        navigationController?.isNavigationBarHidden = true
    }
    /**
     * 设置导航栏阴影
     */
    public func setUpNavShadow() {
        navigationController?.navigationBar.layer.shadowColor = 0x3C6CDE.HexColor.cgColor
        navigationController?.navigationBar.layer.shadowOffset = CGSize.zero
        navigationController?.navigationBar.layer.shadowOpacity = 0.3
        navigationController?.navigationBar.layer.shadowRadius = 4
    }
    /**
     * 设置导航栏标题,导航栏的标题是"系统的文字,有加粗."
     */
    public func setUpSystemNav(title:String,hexColorBg:Int){
        navigationItem.title = title
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage.colorImage(hex: hexColorBg), for: .any, barMetrics: .default)
    }
    /**
     * 设置导航栏标题,文字颜色与大小等
     */
    public func setUpCustomNav(title:String,hexColorTitle:UIColor,hexColorBg:Int) {
        let titleLab = UILabel()
        titleLab.bounds = CGRect(x: 0, y: 0, width: 150, height: 20)
        titleLab.text = title
        titleLab.textAlignment = .center
        titleLab.textColor = hexColorTitle
        titleLab.font = UIFont.systemFont(ofSize: 17)
        navigationItem.titleView = titleLab
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage.colorImage(hex: hexColorBg), for: .any, barMetrics: .default)
    }
    
    
    public func loadingShow() {
        isHud = true
        view.addSubview(hudView)
        hudView.successClosure = {() -> Void in
            self.isHud = false
        }
    }
    
    public func loadingDismiss() {
        hudView.successDismiss()
    }
    
    public func loadingFail() {
        hudView.failed()
    }
    
}
