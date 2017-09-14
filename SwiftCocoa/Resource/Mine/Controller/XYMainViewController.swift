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
    let floatViHeight:CGFloat = 38
    let headerViHeight:CGFloat = 400
    
    
    fileprivate lazy var headerView:XYHeaderView = {
        let vi = UINib(nibName: "XYHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! XYHeaderView
        vi.frame = CGRect(x: 0, y: 0, width: C.SCREEN_WIDTH, height: 400)
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
        dynamicVC.tableView.contentInset = UIEdgeInsets(top: headerViHeight - 64, left: 0, bottom: 64, right: 0)
        dynamicVC.tableView.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
        
        let photoVC = UIStoryboard(name: "Mine", bundle: nil).instantiateViewController(withIdentifier: "XYPhotoViewControllerID") as! XYPhotoViewController
        addChildViewController(photoVC)
        photoVC.tableView.tag = XYMainViewController.photoTVTag
        photoVC.tableView.contentInset = UIEdgeInsets(top: headerViHeight - 64, left: 0, bottom: 64, right: 0)
        photoVC.tableView.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
        
        contentScrollView.addSubview(dynamicVC.tableView)
        contentScrollView.addSubview(photoVC.tableView)
        
    }
    //MARK: 重新布局子视图
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Print.dlog("viewDidLayoutSubviews")
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
        Print.dlog(tabVi.contentOffset.y)//-336
        if tabVi.contentOffset.y >= -floatViHeight {
            headerView.frame.origin.y = -headerViHeight + floatViHeight + 64
            
            if tabVi.tag == XYMainViewController.dynamicTVTag {
                let anotherTabVi = view.viewWithTag(XYMainViewController.photoTVTag) as! UITableView
                if anotherTabVi.contentOffset.y < -floatViHeight {
                    anotherTabVi.contentOffset = CGPoint(x: 0, y: -floatViHeight)
                }
            }else{
                let anotherTabVi = view.viewWithTag(XYMainViewController.dynamicTVTag) as! UITableView
                if anotherTabVi.contentOffset.y < -floatViHeight {
                    anotherTabVi.contentOffset = CGPoint(x: 0, y: -floatViHeight)
                }
            }
            
        }else{
            headerView.frame.origin.y = -headerViHeight + 64 - tabVi.contentOffset.y
            
            if (tabVi.contentOffset.y < -floatViHeight && tabVi.contentOffset.y >= -headerViHeight) {
                let tag = tabVi.tag == XYMainViewController.dynamicTVTag ? XYMainViewController.photoTVTag : XYMainViewController.dynamicTVTag
                let anotherTabVi = view.viewWithTag(tag) as! UITableView
                anotherTabVi.contentOffset = tabVi.contentOffset
            }
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
        if scrollView.isKind(of: UITableView.classForCoder()) {
            return
        }
        
    }
    
}



