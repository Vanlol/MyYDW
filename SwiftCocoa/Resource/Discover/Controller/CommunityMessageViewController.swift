//
//  CommunityMessageViewController.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/20.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit
import WebKit

class CommunityMessageViewController: BaseViewController {
    
    var userContentCtrl:WKUserContentController!
    
    
    fileprivate lazy var webVi:WKWebView = {
        let webConfig = WKWebViewConfiguration()
        let userContent = WKUserContentController()
        //userContent.add(self, name: "JSMethod")
        webConfig.userContentController = userContent
        //self.userContentCtrl = userContent
        let web = WKWebView(frame: CGRect.zero, configuration: webConfig)
        web.translatesAutoresizingMaskIntoConstraints = false
        web.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -64, right: 0)
        web.backgroundColor = 0xEDF3FF.HexColor
        web.navigationDelegate = self
        web.uiDelegate = self
        return web
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNav()
        initWebView()
        loadUrl()
    }
    /**
     * 注销方法
     */
    deinit {
        //userContentCtrl.removeScriptMessageHandler(forName: "JSMethod")
    }
    
    /**
     * 初始化nav
     */
    fileprivate func initNav() {
        view.backgroundColor = 0xEDF3FF.HexColor
        setUpSystemNav(title: "消息", hexColorBg: 0xffffff)
        navigationItem.leftBarButtonItem = UIBarButtonItem.backItemWithImage(image: "4_nav_return_icon", target: self, action: #selector(backButtonClick))
    }
    //MARK: 返回按钮点击事件
    func backButtonClick() {
        navigationController?.popViewController(animated: true)
    }
    /**
     * 初始化view
     */
    fileprivate func initWebView() {
        view.addSubview(webVi)
        let leading = NSLayoutConstraint(item: webVi, attribute: .leading, relatedBy: .equal, toItem: webVi.superview, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let top = NSLayoutConstraint(item: webVi, attribute: .top, relatedBy: .equal, toItem: webVi.superview, attribute: .top, multiplier: 1.0, constant: 0.0)
        let trailing = NSLayoutConstraint(item: webVi, attribute: .trailing, relatedBy: .equal, toItem: webVi.superview, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let bottom = NSLayoutConstraint(item: webVi, attribute: .bottom, relatedBy: .equal, toItem: webVi.superview, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        webVi.superview?.addConstraints([leading,trailing,top,bottom])
    }
    
    /**
     * 加载url
     */
    fileprivate func loadUrl() {
        let urlStr = W.YD_DONGTAI + U.getMobile()!
        Print.dlog(urlStr)
        webVi.load(URLRequest(url: URL(string: urlStr)!))
    }
}

//extension CommunityMessageViewController:WKScriptMessageHandler {
//    
//    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
//        Print.dlog(userContentController)
//        Print.dlog(message.name)
//    }
//    
//}

extension CommunityMessageViewController:WKUIDelegate {
    
//    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
//        Print.dlog("runJavaScriptAlertPanelWithMessage")
//    }
//    
//    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
//        Print.dlog("runJavaScriptConfirmPanelWithMessage")
//    }
//    
//    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
//        Print.dlog("runJavaScriptTextInputPanelWithPrompt")
//    }
//    
//    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//        Print.dlog("createWebViewWith")
//        return WKWebView()
//    }
//    
//    @available(iOS 10.0, *)
//    func webView(_ webView: WKWebView, shouldPreviewElement elementInfo: WKPreviewElementInfo) -> Bool {
//        Print.dlog("shouldPreviewElement")
//        return true
//    }
//    
//    func webView(_ webView: WKWebView, commitPreviewingViewController previewingViewController: UIViewController) {
//        Print.dlog("commitPreviewingViewController")
//    }
//    
//    @available(iOS 10.0, *)
//    func webView(_ webView: WKWebView, previewingViewControllerForElement elementInfo: WKPreviewElementInfo, defaultActions previewActions: [WKPreviewActionItem]) -> UIViewController? {
//        Print.dlog("previewingViewControllerForElement")
//        return UIViewController()
//    }
    
    
}


extension CommunityMessageViewController:WKNavigationDelegate {
    
    /**
     * 1. 实现decisionHandler回调,允许接入
     */
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        //        Print.dlog("decidePolicyFor")
//        //        Print.dlog(navigationAction.navigationType)
//        //        Print.dlog(navigationAction.request.url)
//        //        Print.dlog(navigationAction.sourceFrame.isMainFrame)
//        //        Print.dlog(navigationAction.targetFrame?.isMainFrame)
//        decisionHandler(.allow)
//    }
    /**
     * 2. didStartProvisionalNavigation
     */
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//        Print.dlog("didStartProvisionalNavigation")
    }
    /**
     * 3. 实现decisionHandler回调,允许接入
     */
//    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
////        Print.dlog("decidePolicyFor")
//        decisionHandler(.allow)
//    }
    /**
     * 4. didCommit
     */
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
//        Print.dlog("didCommit")
    }
    /**
     * 5. didFinish
     */
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        Print.dlog("didFinish")
//        webView.evaluateJavaScript("app.showRed('" + "true,false" + "')") { (data, error) in
//            Print.dlog("调用了JS方法")
//            Print.dlog(data)
//        }
//    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        Print.dlog("didFail")
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        Print.dlog("didReceiveServerRedirectForProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        Print.dlog("didReceive challenge")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        Print.dlog("didFailProvisionalNavigation")
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        Print.dlog("webViewWebContentProcessDidTerminate")
    }
    
    
    
}









