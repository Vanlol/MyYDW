//
//  TestSwfitSpinner.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/24.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class TestSwfitSpinner: NSObject {
    
    static let shared = TestSwfitSpinner()
    
    fileprivate lazy var backgroundVi:UIView = {
        let vi = UIView()
        vi.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        vi.backgroundColor = UIColor.clear
        return vi
    }()
    
    fileprivate lazy var spinnerVi:UIView = {
        let vi = UIView()
        vi.center = CGPoint(x: UIScreen.main.bounds.width*0.5, y:  UIScreen.main.bounds.height*0.5)
        vi.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)
        vi.backgroundColor = UIColor.clear
        return vi
    }()
    
    fileprivate lazy var lineLa:LineLayer = {
        let la = LineLayer()
        la.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        la.anchorPoint = CGPoint.zero
        la.position = CGPoint(x: 40, y: 40)
        return la
    }()
    
    override init() {
        super.init()
        
    }
    /**
     * 初始化视图(添加视图)
     */
    fileprivate func initView() {
        let window = UIApplication.shared.windows[0]
        window.addSubview(backgroundVi)
        backgroundVi.addSubview(spinnerVi)
        spinnerVi.layer.addSublayer(lineLa)
    }
    
    public func show() {
        initView()
        lineLa.startAnimation()
    }
    
    public func dismiss() {
        lineLa.endAnimation()
        backgroundVi.removeFromSuperview()
    }
}

class LineLayer : CAShapeLayer {
    
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
        let bezierPa = UIBezierPath(arcCenter: CGPoint(x: bounds.size.width*0.5, y: bounds.size.height*0.5), radius: 30, startAngle: CGFloat(-0.5*Double.pi), endAngle: CGFloat(1.625*Double.pi), clockwise: true)
        path = bezierPa.cgPath
        fillColor = nil
        strokeColor = 0xffa177.HexColor.cgColor
        lineWidth = 3
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
        rotateAnima.duration = 1.2
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

extension LineLayer:CAAnimationDelegate {
    
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

