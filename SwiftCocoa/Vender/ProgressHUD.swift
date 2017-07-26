//
//  ProgressHUD.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/25.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class ProgressHUD: UIView {
    
    /**
     *
     */
    public var successClosure:(() -> Void)?
    /**
     * 展示画圈的view
     */
    fileprivate lazy var spinnerVi:UIView = {
        let vi = UIView()
        vi.center = CGPoint(x: UIScreen.main.bounds.width*0.5, y:  UIScreen.main.bounds.height*0.5)
        vi.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        vi.backgroundColor = UIColor.clear
        return vi
    }()
    /**
     * 目前没用
     */
    fileprivate lazy var bgImageVi:UIImageView = {
        let vi = UIImageView(image: UIImage(named: "community_load_wait"))
        vi.frame = CGRect(x: 0, y: 63, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 63)
        return vi
    }()
    /**
     * 动画layer
     */
    fileprivate lazy var hudLa:HUDLayer = {
        let la = HUDLayer()
        la.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        la.anchorPoint = CGPoint.zero
        la.position = CGPoint(x: 15, y: 15)
        return la
    }()
    
    /**
     * 加载失败的图片
     */
    fileprivate lazy var failImageVi:UIImageView = {
        let vi = UIImageView(image: UIImage(named: "nosignal_bg_icon"))
        vi.frame = CGRect(x: (UIScreen.main.bounds.width - 162)*0.5, y: 140, width: 162, height: 150)
        return vi
    }()
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        backgroundColor = 0xf0f0f0.HexColor
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     * 初始化视图(添加视图)
     */
    fileprivate func initView() {
        addSubview(spinnerVi)
        spinnerVi.layer.addSublayer(hudLa)
        hudLa.startAnimation()
    }
    /**
     * 加载成功后移除视图的方法
     */
    public func successDismiss() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
            self.hudLa.endAnimation()
            self.spinnerVi.removeFromSuperview()
            self.successClosure?()
            UIView.animate(withDuration: 1, animations: {
                self.alpha = 0.01
            }, completion: { (complete) in
                self.removeFromSuperview()
            })
        })
    }
    
    /**
     * 加载失败后调用的方法
     */
    public func failed() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
            self.hudLa.endAnimation()
            self.spinnerVi.removeFromSuperview()
            self.successClosure?()
            self.addSubview(self.failImageVi)
        })
    }
    
}

class HUDLayer : CAShapeLayer {
    
    override init() {
        super.init()
        configLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     * 配置layer
     */
    fileprivate func configLayer () {
        let bezierPa = UIBezierPath(arcCenter: CGPoint(x: bounds.size.width*0.5, y: bounds.size.height*0.5), radius: 15, startAngle: CGFloat(-0.5*Double.pi), endAngle: CGFloat(1.625*Double.pi), clockwise: true)
        path = bezierPa.cgPath
        fillColor = nil
        strokeColor = 0xffa177.HexColor.cgColor
        lineWidth = 2
        lineCap = kCALineCapRound
        strokeStart = 0
        strokeEnd = 0
        isHidden = true
    }
    /**
     * 开始旋转动画
     */
    public func startAnimation() {
        isHidden = false
        let rotateAnima = CABasicAnimation()
        rotateAnima.keyPath = "transform.rotation.z"
        rotateAnima.fromValue = 0
        rotateAnima.toValue = 2*Double.pi
        rotateAnima.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        rotateAnima.duration = 1
        rotateAnima.repeatCount = MAXFLOAT
        rotateAnima.fillMode = kCAFillModeForwards
        rotateAnima.isRemovedOnCompletion = false
        add(rotateAnima, forKey: "rotateAnimation")
        strokeEndAnimation()
    }
    /**
     * 结束旋转动画
     */
    public func endAnimation() {
        isHidden = true
        removeAllAnimations()
    }
    /**
     * 闭合路径动画
     */
    public func strokeEndAnimation() {
        let endAnima = CABasicAnimation()
        endAnima.keyPath = "strokeEnd"
        endAnima.fromValue = 0
        endAnima.toValue = 0.95
        endAnima.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        endAnima.duration = 1
        endAnima.repeatCount = 1
        endAnima.fillMode = kCAFillModeForwards
        endAnima.isRemovedOnCompletion = false
        endAnima.delegate = self
        add(endAnima, forKey: "strokeEndAnimation")
    }
    /**
     * 开始路径动画
     */
    public func strokeStartAnimation() {
        let startAnima = CABasicAnimation()
        startAnima.keyPath = "strokeStart"
        startAnima.fromValue = 0
        startAnima.toValue = 0.95
        startAnima.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        startAnima.duration = 1
        startAnima.repeatCount = 1
        startAnima.fillMode = kCAFillModeForwards
        startAnima.isRemovedOnCompletion = false
        startAnima.delegate = self
        add(startAnima, forKey: "strokeStartAnimation")
    }
    
}

extension HUDLayer:CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            let basicAnim = anim as! CABasicAnimation
            if basicAnim.keyPath == "strokeEnd" {
                strokeStartAnimation()
            }else if basicAnim.keyPath == "strokeStart" {
                removeAnimation(forKey: "strokeStartAnimation")
                removeAnimation(forKey: "strokeEndAnimation")
                strokeEndAnimation()
            }
        }
    }
    
}
