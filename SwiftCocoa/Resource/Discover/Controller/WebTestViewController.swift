//
//  WebTestViewController.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/21.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit
import WebKit

class WebTestViewController: BaseWKWebViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNav()
        loadUrl()
    }
    
    fileprivate func initNav() {
        setUpSystemNav(title: "消息", hexColorBg: 0xffffff)
        navigationItem.leftBarButtonItem = UIBarButtonItem.backItemWithImage(image: "4_nav_return_icon", target: self, action: #selector(backButtonClick))
    }
    //MARK: 返回按钮点击事件
    func backButtonClick() {
        navigationController?.popViewController(animated: true)
    }
    /**
     * 加载url
     */
    fileprivate func loadUrl() {
//        let urlStr = W.YD_DONGTAI + U.getMobile()!
//        webView.load(URLRequest(url: URL(string: urlStr)!))
        webView.load(URLRequest(url: Bundle.main.url(forResource: "JavaScript", withExtension: "html")!))
    }
    
}

extension WebTestViewController {
    
    override func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        Print.dlog("didStartProvisionalNavigation")
    }
    
    
    
}





















