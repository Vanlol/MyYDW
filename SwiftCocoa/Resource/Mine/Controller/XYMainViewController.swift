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
    
    static let dynamicTVTag = 1
    static let photoTVTag = 2
    
    fileprivate lazy var headerView:XYHeaderView = {
        let vi = UINib(nibName: "XYHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! XYHeaderView
        vi.frame = CGRect(x: 0, y: 0, width: C.SCREEN_WIDTH, height: 375)
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
        navigationController?.navigationBar.isTranslucent = false
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
        
        let dynamicVC = UIStoryboard(name: "Mine", bundle: nil).instantiateViewController(withIdentifier: "XYDynamicViewControllerID") as! XYDynamicViewController
        addChildViewController(dynamicVC)
        dynamicVC.tableView.tag = XYMainViewController.dynamicTVTag
        dynamicVC.tableView.contentInset = UIEdgeInsets(top: C.SCREEN_WIDTH - 64, left: 0, bottom: 0, right: 0)
        dynamicVC.tableView.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
        
        let photoVC = UIStoryboard(name: "Mine", bundle: nil).instantiateViewController(withIdentifier: "XYPhotoViewControllerID") as! XYPhotoViewController
        addChildViewController(photoVC)
        photoVC.tableView.tag = XYMainViewController.photoTVTag
        photoVC.tableView.contentInset = UIEdgeInsets(top: C.SCREEN_WIDTH - 64, left: 0, bottom: 0, right: 0)
        photoVC.tableView.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
        
        contentScrollView.addSubview(dynamicVC.tableView)
        contentScrollView.addSubview(photoVC.tableView)
        
    }
    //MARK: 重新布局子视图
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for subVC in childViewControllers {
            if subVC.isKind(of: XYDynamicViewController.classForCoder()) {
                subVC.view.frame = CGRect(x: 0, y: 0, width: C.SCREEN_WIDTH, height: C.SCREEN_HEIGHT)
            }else if subVC.isKind(of: XYPhotoViewController.classForCoder()) {
                subVC.view.frame = CGRect(x: C.SCREEN_WIDTH, y: 0, width: C.SCREEN_WIDTH, height: C.SCREEN_HEIGHT)
            }
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let tabVi = object as! UITableView
        /* 没什么卵用的判断 */
        if (contentScrollView.contentOffset.x == 0 && tabVi.tag == XYMainViewController.photoTVTag) || (contentScrollView.contentOffset.x == C.SCREEN_WIDTH && tabVi.tag == XYMainViewController.dynamicTVTag) {
            return
        }
        Print.dlog(tabVi.contentOffset.y)
        if tabVi.contentOffset.y >= -38 {
            headerView.frame.origin.y = -C.SCREEN_WIDTH + 38 + 64
        }else{
            headerView.frame.origin.y = -C.SCREEN_WIDTH - tabVi.contentOffset.y + 64
            
        }
        
    }
    /*
     * 注销观察者模式
     */
    deinit {
        for subVC in childViewControllers {
            if subVC.isKind(of: XYDynamicViewController.classForCoder()) {
                (subVC as! XYDynamicViewController).tableView.removeObserver(self, forKeyPath: "contentOffset", context: nil)
            }else if subVC.isKind(of: XYPhotoViewController.classForCoder()) {
                (subVC as! XYPhotoViewController).tableView.removeObserver(self, forKeyPath: "contentOffset", context: nil)
            }
        }
    }
    
}

extension XYMainViewController:UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
}



