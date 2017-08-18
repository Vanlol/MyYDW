//
//  MainViewController.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/4.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit
import MJRefresh

class MainViewController: BaseViewController {
    
    @IBOutlet weak var tableHeaderVi: UIView!
    
    @IBOutlet weak var contentTableView: UITableView!{
        didSet{
            contentTableView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: -49, right: 0)
            contentTableView.scrollIndicatorInsets = UIEdgeInsets(top: -20, left: 0, bottom: -49, right: 0)
        }
    }
    //MARK: VM
    lazy var mainVM = MainViewModel()
    //MARK: M
    fileprivate lazy var mainM = MainModel()
    //MARK: 登陆后的headerVi
    fileprivate lazy var headerVi:MainHeaderView = {
        let vi = MainHeaderView.mainView()
        return vi
    }()
    //MARK: 未登录的headerVi
    fileprivate lazy var unloginVi:UnLoginHeaderView = {
        let vi = UnLoginHeaderView.unLoginView()
        return vi
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNav()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        setUpRefresh()
        blindViewModel()
    }
    /**
     * 初始化View
     */
    fileprivate func initView() {
        initTableVi()
        initHeaderVi()
    }
    /**
     * 初始化tableView
     */
    fileprivate func initTableVi() {
        contentTableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
        for vi in tableHeaderVi.subviews {
            vi.removeFromSuperview()
        }
        tableHeaderVi.bounds.size.height = 300
        contentTableView.tableHeaderView = tableHeaderVi
    }
    /**
     * 设置刷新
     */
    fileprivate func setUpRefresh() {
        let mjH = MJRefreshNormalHeader {
            //加载首页的数据
            self.mainVM.loadMain { (data) in
                self.contentTableView.mj_header.endRefreshing()
                //处理bannerUrl数据
                self.mainVM.findBannerUrls(mainMod: data, closure: { (urlStrs) in
                    self.headerVi.bannerView.urlStrs = urlStrs
                    self.headerVi.bannerView.reloadInfiniteCircularView()
                })
                //处理公告数据
                self.mainVM.findNoticesStrs(mainMod: data, closure: { (notices) in
                    self.headerVi.noticeView.noticeStrs = notices
                    self.headerVi.noticeView.reloadInfiniteCircularView()
                })
            }
        }
        mjH?.lastUpdatedTimeLabel.isHidden = true
        contentTableView.mj_header = mjH
    }
    
    fileprivate func initHeaderVi() {
        tableHeaderVi.addSubview(headerVi)
        headerVi.moreDeclarationClosure = {() -> Void in
            
        }
        headerVi.bankDepositClosure = {() -> Void in
            
        }
        headerVi.noviceWelfareClosure = {() -> Void in
            
        }
        headerVi.inviteGiftClosure = {() -> Void in
            
        }
        headerVi.signBoardClosure = {() -> Void in
            
        }
        headerVi.bannerView.didClickBannerImageClosure = {(vi,index) -> Void in
            
        }
        headerVi.noticeView.didClickNoticeClosure = {(vi,index) -> Void in
            
        }
    }
    /**
     * 绑定ViewModel
     */
    fileprivate func blindViewModel() {
        //底部tabbar点击事件
        mainVM.tabbarItemClickClosure = {() -> Void in
            
        }
        //加载首页的数据
        mainVM.loadMain { (data) in
            self.mainM = data
            //处理bannerUrl数据
            self.mainVM.findBannerUrls(mainMod: data, closure: { (urlStrs) in
                self.headerVi.bannerView.urlStrs = urlStrs
                self.headerVi.bannerView.reloadInfiniteCircularView()
            })
            //处理公告数据
            self.mainVM.findNoticesStrs(mainMod: data, closure: { (notices) in
                self.headerVi.noticeView.noticeStrs = notices
                self.headerVi.noticeView.reloadInfiniteCircularView()
            })
        }
        
    }
}

extension MainViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id")!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            Print.dlog("1")
            for vi in tableHeaderVi.subviews {
                vi.removeFromSuperview()
            }
            tableHeaderVi.bounds.size.height = 360
            contentTableView.tableHeaderView = tableHeaderVi
            tableHeaderVi.addSubview(unloginVi)
        case 1:
            Print.dlog("2")
        case 2:
            Print.dlog("3")
        default:
            break
        }
    }
    
    
    
}



extension MainViewController  {
    /*
    lazy var cusNavbar:UINavigationBar = {
        let nav = UINavigationBar(frame: CGRect(x: 0, y: 0, width: C.SCREEN_WIDTH, height: 64))
        nav.barStyle = .black
        return nav
    }()
    /**
     * 初始化nav
     */
    fileprivate func initNav () {
        hideNav()
        view.addSubview(cusNavbar)
    }
    */
}



