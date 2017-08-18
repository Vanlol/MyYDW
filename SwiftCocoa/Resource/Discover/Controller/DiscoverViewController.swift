//
//  DiscoverViewController.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/4.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseTableViewController {
    
    @IBOutlet weak var ydsqRedVi: UIView!   //银多社区红点
    @IBOutlet weak var gfggRedVi: UIView!   //官方公告红点
    @IBOutlet weak var yddtRedVi: UIView!   //银多动态红点
    @IBOutlet weak var xxplRedVi: UIView!   //信息披露红点
    @IBOutlet weak var jfscRedVi: UIView!   //积分商城红点
    @IBOutlet weak var safeDays: UILabel!   //安全运营时间x天
    @IBOutlet weak var versionLab: UILabel! //当前版本号
    
    
    lazy var discoverVM = DiscoverViewModel()
    fileprivate lazy var discoverM = DiscoverModel()
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
        versionLab.text = Tools.getLocalVersion()
    }
    
    fileprivate func blindViewModel() {
        discoverVM.loadDiscoverRedPoint { (model) in
            self.discoverM = model
        }
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





