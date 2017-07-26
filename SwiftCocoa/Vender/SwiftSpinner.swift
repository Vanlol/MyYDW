//
//  SwiftSpinner.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/21.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class SwiftSpinner: NSObject {
    
    static let shared = SwiftSpinner()
    
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
    
    fileprivate lazy var smallLay:CircleLayer = {
        let la = CircleLayer(lineW: 3, radius: 25, clockwise: true)
        la.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        la.position = CGPoint(x: 40, y: 40)
        la.anchorPoint = CGPoint(x: 0, y: 0)
        return la
    }()
    
    fileprivate lazy var largeLay:CircleLayer = {
        let la = CircleLayer(lineW: 5, radius: 35, clockwise: false)
        la.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        la.position = CGPoint(x: 40, y: 40)
        la.anchorPoint = CGPoint(x: 0, y: 0)
        return la
    }()
    
    override init() {
        super.init()
    }
    
    fileprivate func initView() {
        let window = UIApplication.shared.windows[0]
        window.addSubview(backgroundVi)
        backgroundVi.addSubview(spinnerVi)
        spinnerVi.layer.addSublayer(smallLay)
        spinnerVi.layer.addSublayer(largeLay)
    }
    
    
    
    public func show() {
        initView()
        startAnimation()
    }
    
    public func dismiss() {
        endAnimation()
        backgroundVi.removeFromSuperview()
    }
    
    fileprivate func startAnimation() {
        let anim = CABasicAnimation()
        anim.keyPath = "transform.rotation.z"
        anim.fromValue = 0
        anim.toValue = Double.pi * 2
        anim.duration = 1
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        anim.repeatCount = MAXFLOAT
        anim.fillMode = kCAFillModeForwards
        anim.isRemovedOnCompletion = false
        spinnerVi.layer.add(anim, forKey: "rotateAnimation")
    }
    
    fileprivate func endAnimation() {
        spinnerVi.layer.removeAnimation(forKey: "rotateAnimation")
        smallLay.strokeEndAnimation()
        largeLay.strokeEndAnimation()
    }
    
    
}

class CircleLayer:CAShapeLayer {
    
    init(lineW:CGFloat,radius:CGFloat,clockwise:Bool) {
        super.init()
        let bezierPa = UIBezierPath(arcCenter: CGPoint(x: bounds.size.width*0.5, y: bounds.size.height*0.5), radius: radius, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: clockwise)
        path = bezierPa.cgPath
        lineWidth = lineW
        strokeStart = 0
        strokeEnd = 0.5
        configLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configLayer() {
        lineCap = kCALineCapRound
        fillColor = nil
        strokeColor = 0xffa177.HexColor.cgColor
        
    }
    
    public func strokeEndAnimation() {
        print("ssss")
        let anim = CABasicAnimation()
        anim.keyPath = "strokeEnd"
        anim.fromValue = 0.5
        anim.toValue = 0.99
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        anim.fillMode = kCAFillModeForwards
        anim.duration = 0.5
        anim.repeatCount = 1
        anim.isRemovedOnCompletion = false
        add(anim, forKey: "stroke")
    }
    
}








