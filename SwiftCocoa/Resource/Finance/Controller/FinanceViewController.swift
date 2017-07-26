//
//  FinanceViewController.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/4.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class FinanceViewController: BaseViewController {
    
    lazy var financeVM = FinanceViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Print.dlog("finznce willappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNav()
        blindViewModel()
        
        
    }
    /**
     * 初始化Nav
     */
    fileprivate func initNav() {
        setUpSystemNav(title: "产品", hexColorBg: 0x5a5e6d)
        navigationItem.leftBarButtonItem = UIBarButtonItem.itemWithImage(image: "MainTagSubIcon", highImage: "MainTagSubIconClick", target: self, action: #selector(itemClick))
    }
    
    func itemClick() {
        Print.dlog("itemClick")
    }
    
    fileprivate func blindViewModel() {
        
        
        
    }
    
}











