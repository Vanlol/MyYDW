//
//  LoginViewController.swift
//  SwiftCocoa
//
//  Created by 祁小峰 on 2017/9/14.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    
    @IBOutlet weak var bgImageVi: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNav()
        
//        let str = "2018-01-05T8:03:39.000+08:00"
//        let creat = Date().formatterDate(dateStr: str)
//        let zone = Date().currentZoneDate()
//        let delta = zone.timeIntervalSince(creat)
        
//        let date1 = Date().formatterDate(dateStr: "2018-01-05T8:03:39.000+08:00")
//        let date2 = Date().formatterDate(dateStr: "2018-01-05T8:03:39.000+08:00")
//        let cmps = date2.deltaFrom(date: date1)
        
        let creat = Date().formatterDate(dateStr: "2017-01-04T8:03:39.000+08:00")
        
        print(creat.isYear())
        print(creat.isToday())
        print(creat.isYesterday())
    }
    
    
    
    fileprivate func test1() {
        let str = "2018-01-05T8:03:39.000+08:00"
        let creat = Date().formatterDate(dateStr: str)
        
        let delta = Date().currentZoneDate().timeIntervalSince(creat)
        print(delta)
    }
    
    fileprivate func test2() {
        let calendar = Calendar.current
//        let result = calendar.component(.yearForWeekOfYear, from: Date().currentZoneDate())
//        let zoneDate = Date().currentZoneDate()
//        let year = calendar.component(.minute, from: zoneDate)
//        print(year)
        let creat = Date().formatterDate(dateStr: "2017-02-05T8:03:39.000+08:00")
        
        let cmps = calendar.dateComponents([.year,.month,.day,.yearForWeekOfYear,.weekOfMonth,.weekOfYear], from: creat)
        print(cmps.yearForWeekOfYear!)
        print(cmps.weekOfMonth!)
        print(cmps.weekOfYear!)
        
    }
    
    
    
    
    
    //
    @IBAction func loginButtonClick(_ sender: Any) {
        let testTabC = UIStoryboard(name: "Test", bundle: nil).instantiateViewController(withIdentifier: "TestTabBarControllerID") as! TestTabBarController
        navigationController?.pushViewController(testTabC, animated: true) 
    }
    
    @IBAction func fadeButtonClick(_ sender: Any) {
        let testTabC = UIStoryboard(name: "Test", bundle: nil).instantiateViewController(withIdentifier: "TestTabBarControllerID") as! TestTabBarController
        testTabC.modalPresentationStyle = .currentContext
        var vcs = navigationController?.viewControllers
        vcs?.insert(testTabC, at: 0)
        navigationController?.viewControllers = vcs!
        
        
        navigationController?.popViewController(animated: false)
    }
    // 测试动画
    @IBAction func testAnimationButtonClick(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 2
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transition.type = kCATransitionFade//kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
        transition.subtype = kCATransitionFromTop//kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
        view.layer.add(transition, forKey: "animation")
    }
    
    
}
