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
        //let urlStr = W.YD_DONGTAI + U.getMobile()!
        let urlStr = "http://121.40.92.117:21114/index.php/node/show?page=1&node_id=1&mm=b2tTQndEQ2NoUGFnekVqWUZPZEtlQT09"
        webView.load(URLRequest(url: URL(string: urlStr)!))
        //http://121.40.92.117:21114/index.php/node/show?page=1&node_id=1&mm=b2tTQndEQ2NoUGFnekVqWUZPZEtlQT09
        //webView.load(URLRequest(url: Bundle.main.url(forResource: "JavaScript", withExtension: "html")!))
    }
    
}

extension WebTestViewController {
    
    override func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        Print.dlog("didStartProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        
        
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        //getitemurl:getItemUrl?id=2833&cname=%25u7528%25u6237%25u4EA4%25u6D41&comment=
        switch (navigationAction.request.url?.scheme)! {
        case "getitemurl":
            let parm = (navigationAction.request.url?.absoluteString)!.splitParameter()
            Print.dlog(parm.10)
            Print.dlog(parm.11)
            
            let a = parm.10.unescape().unescape()
            Print.dlog(a)
            
        default:
            break
        }
        
        decisionHandler(.allow)
    }
    
    
    
    
    
}





















