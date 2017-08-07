//
//  WKCommunityMsgViewController.swift
//  ydzbapp-hybrid
//
//  Created by admin on 2017/8/7.
//  Copyright © 2017年 银多资本. All rights reserved.
//

import UIKit
import WebKit

class WKCommunityMsgViewController: UIViewController {
    
    
    //结果数据
    //fileprivate lazy var comsg:CommMesgModel = CommMesgModel()
    //第一步:web调用我的setData方法,给web返回一个字符串.
    var dataStr = ""
    //let bbsService = FinderService.getInstance
    //let realmU = RealmU.getInstance
    
    var userContent:WKUserContentController!
    
    lazy var webView:WKWebView = {
        let config = WKWebViewConfiguration()
        let userCon = WKUserContentController()
        userCon.add(self, name: "JSMethod")
        config.userContentController = userCon
        self.userContent = userCon
        let vi = WKWebView(frame: CGRect.zero, configuration: config)
        vi.translatesAutoresizingMaskIntoConstraints = false
        vi.navigationDelegate = self
        return vi
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLeftBarItem()
        initView()
        loadUrl()
        loadData()
    }
    //MARK: 初始化导航栏
    func initLeftBarItem() {
        navigationController!.setNavigationBarHidden(false, animated: true)
        let negativeSpacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        negativeSpacer.width = -8
        let backBtn = UIButton()
        let backImage = UIImage(named: "4_nav_return_icon")
        backBtn.frame = CGRect(x: 0, y: 0, width:  backImage!.size.width, height: backImage!.size.height)
        backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        backBtn.setImage(backImage, for: UIControlState.normal)
        backBtn.addTarget(self, action: #selector(backClick), for: UIControlEvents.touchUpInside)
        let backBtnItem = UIBarButtonItem(customView: backBtn)
        navigationItem.leftBarButtonItems = [negativeSpacer, backBtnItem]
    }
    //MARK: 返回
    func backClick() {
        dismiss(animated: true, completion: nil)
    }
    //MARK: 初始化view
    func initView() {
        view.addSubview(webView)
        let leading = NSLayoutConstraint(item: webView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let trailing = NSLayoutConstraint(item: webView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let top = NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)
        let bottom = NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraints([leading,trailing,top,bottom])
    }
    //MARK: 加载url
    func loadUrl(){
        webView.load(URLRequest(url: URL(string: W.BBS_MESG_WEB + U.getMobile()!)!))
    }
    
    //MARK: 加载评论数,回复数等
    func loadData() {
//        bbsService.loadMessageData { (data) in
//            if let rms = data as? CommMesgModel {
//                self.comsg = rms
//                let rep = self.realmU.getCommunityReplyRedPoint().reply_id
//                let com = self.realmU.getCommunityCommunityRedPoint().comments_id
//                var results = [String]()
//                if rms.comments_id == com {
//                    results.append("false")
//                }else{
//                    results.append("true")
//                }
//                if rms.reply_id == rep {
//                    results.append("false")
//                }else{
//                    results.append("true")
//                }
//                self.dataStr = results.joined(separator: ",")
//            }
//        }
    }
    /**
     * 注销方法
     */
    deinit {
        userContent.removeScriptMessageHandler(forName: "JSMethod")
    }
}


extension WKCommunityMsgViewController:WKScriptMessageHandler {

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        Print.dlog(userContentController)
        Print.dlog(message.name)
    }

}


extension WKCommunityMsgViewController:WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Print.dlog("webView --- didFinish")
        webView.evaluateJavaScript("app.showRed('" + self.dataStr + "')", completionHandler: { (data, error) in
            Print.dlog(data as Any)
            Print.dlog(error as Any)
        })
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        Print.dlog("webView --- didStartProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        Print.dlog("webView --- didFail")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        Print.dlog(error)
        Print.dlog("webView --- didFailProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        Print.dlog("webView --- didReceiveServerRedirectForProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        Print.dlog("webView --- decidePolicyFornavigationAction")
        Print.dlog((navigationAction.request.url?.absoluteString)!)
        Print.dlog((navigationAction.request.url)!)
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        Print.dlog("webView --- decidePolicyFornavigationResponse")
        
        decisionHandler(.allow)
    }
    
    
    /*
     *拆分参数数据，上传购买数据
     *返回(类型，外网地址，产品名称)
     */
    func splitParameter(params:String) -> (String, String, String, String, String, String, String, String, String, String, String, String, String){
        var parm = (title: "", thumburl: "", gotourl: "", description: "", addr: "",arrow: "",numbers: "", msg:"", share:"", help:"", rightText:"", id:"", url:"")
        _ = (params as NSString).range(of: "?")
        let result = params.components(separatedBy: "?").last
        let arr = result?.components(separatedBy: "&")
        for str in arr! {
            let ss = str.components(separatedBy: "=")
            if ss.first! == "title" {
                parm.title = ss.last!
            }else if ss.first! == "thumburl" {
                parm.thumburl = ss.last!
            }else if ss.first! == "gotourl" {
                parm.gotourl = ss.last!
            }else if ss.first! == "description" {
                parm.description = ss.last!
            }else if ss.first! == "addr" {
                parm.addr = ss.last!
            }else if ss.first! == "arrow" {
                parm.arrow = ss.last!
            }else if ss.first! == "numbers" {
                parm.numbers = ss.last!
            }else if ss.first! == "msg" {
                parm.msg = ss.last!
            }else if ss.first! == "share" {
                parm.share = ss.last!
            }else if ss.first! == "help" {
                parm.help = ss.last!
            }else if ss.first! == "cname" {
                parm.rightText = ss.last!
            }else if ss.first! == "id" {
                parm.id = ss.last!
            }else if ss.first! == "comment" {
                parm.url = ss.last!
            }
        }
        return parm
    }
    
    
}

