//
//  MainHeaderView.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/7.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class MainHeaderView: UIView {
    
    //MARK: 初始化方法
    class func mainView() -> MainHeaderView {
        let vi = UINib(nibName: "MainHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! MainHeaderView
        vi.frame = CGRect(x: 0, y: 0, width: 375, height: 300)
        return vi
    }
    
    //MARK: 公告父视图
    @IBOutlet weak var declarationView: UIView!
    //MARK: BannerView视图
    lazy var bannerView:InfiniteCircularView = {
        let vi = InfiniteCircularView(frame: CGRect(x: 0, y: 0, width: C.SCREEN_WIDTH, height: 200))
        return vi
    }()
    //MARK: 公告视图
    lazy var noticeView:InfiniteNoticeView = {
        let vi = InfiniteNoticeView(frame: CGRect(x: 0, y: 0, width: C.SCREEN_WIDTH, height: self.declarationView.bounds.size.height))
        return vi
    }()
    //MARK: 更多公告点击回调
    var moreDeclarationClosure:(() -> Void)?
    //MARK: 银行存管点击回调
    var bankDepositClosure:(() -> Void)?
    //MARK: 新手福利点击回调
    var noviceWelfareClosure:(() -> Void)?
    //MARK: 邀请有礼点击回调
    var inviteGiftClosure:(() -> Void)?
    //MARK: 每日签到点击回调
    var signBoardClosure:(() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    //MARK: 初始化View
    fileprivate func initView() {
        addSubview(bannerView)
        declarationView.addSubview(noticeView)
    }
    
    //MARK: 更多公告按钮点击事件
    @IBAction func moreDeclarationBtnClick(_ sender: Any) {
        moreDeclarationClosure?()
    }
    //MARK: 银行存管按钮点击事件
    @IBAction func bankDespositBtnClick(_ sender: Any) {
        bankDepositClosure?()
    }
    //MARK: 新手福利按钮点击事件
    @IBAction func noviceWelfareBtnClick(_ sender: Any) {
        noviceWelfareClosure?()
    }
    //MARK: 邀请有礼按钮点击事件
    @IBAction func inviteGiftBtnClick(_ sender: Any) {
        inviteGiftClosure?()
    }
    //MARK: 每日签到按钮点击事件
    @IBAction func signBoardBtnClick(_ sender: Any) {
        signBoardClosure?()
    }
    
}
