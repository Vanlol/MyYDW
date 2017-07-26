//
//  DiscoverViewController.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/4.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseTableViewController {
    
    
    
    
    lazy var discoverVM = DiscoverViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Print.dlog("discover willappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNav()
        blindViewModel()
    }
    /**
     * 初始化nav
     */
    fileprivate func initNav() {
        setUpSystemNav(title: "发现", hexColorBg: 0xffffff)
        setUpNavShadow()
    }
    
    fileprivate func blindViewModel() {
        
        
        
    }
    
    //MARK: 联系客服按钮点击事件
    @IBAction func connectCustomerButtonClick(_ sender: Any) {
        
    }
    //MARK: 银多社区按钮点击事件
    @IBAction func ydCommunityButtonClick(_ sender: Any) {
        tabPushVCWith(storyboardName: "Discover", vcId: "YDCommunityViewControllerID")
    }
    
}

extension DiscoverViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            Print.dlog("官方公告页")
        case 2:
            Print.dlog("银多动态页")
        case 3:
            Print.dlog("信息披露页")
        case 4:
            Print.dlog("了解银多页")
        case 5:
            Print.dlog("积分商城页")
        case 6:
            Print.dlog("帮助中心页")
        case 7:
            Print.dlog("意见反馈页")
        default:
            break
        }
    }
    
}





