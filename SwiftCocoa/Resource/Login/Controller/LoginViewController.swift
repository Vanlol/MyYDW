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
