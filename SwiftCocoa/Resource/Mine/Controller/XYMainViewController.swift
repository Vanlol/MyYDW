//
//  XYMainViewController.swift
//  SwiftCocoa
//
//  Created by 祁小峰 on 2017/9/13.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class XYMainViewController: BaseViewController {
    
    @IBOutlet weak var contentScrollView: UIScrollView!
    
    fileprivate lazy var headerView:XYHeaderView = {
        let vi = UINib(nibName: "XYHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! XYHeaderView
        vi.frame = CGRect(x: 0, y: 64, width: C.SCREEN_WIDTH, height: C.SCREEN_WIDTH)
        return vi
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNav()
        addSubViews()
    }
    
    /**
     * 初始化nav
     */
    fileprivate func initNav() {
        setUpSystemNav(title: "个人中心", hexColorBg: 0xffffff)
        navigationItem.leftBarButtonItem = UIBarButtonItem.backItemWithImage(image: "4_nav_return_icon", target: self, action: #selector(backButtonClick))
    }
    //MARK: 返回按钮点击事件
    func backButtonClick() {
        navigationController?.popViewController(animated: true)
    }
    //MARK: 添加子试图
    fileprivate func addSubViews() {
        view.addSubview(headerView)
        contentScrollView.contentOffset = CGPoint.zero
        contentScrollView.contentSize = CGSize(width: 2*C.SCREEN_WIDTH, height: 0)
        
    }
    
}

extension XYMainViewController:UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
}



