//
//  JDSwiftSpinner.swift
//  SwiftCocoa
//
//  Created by admin on 2017/8/10.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class JDSwiftSpinner: NSObject {
    
    static let shared = JDSwiftSpinner()
    
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
    
    fileprivate lazy var lineLa:JDLineLayer = {
        let la = JDLineLayer()
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
    }
    
    public func dismiss() {
        backgroundVi.removeFromSuperview()
    }
    
}


class JDLineLayer : CAShapeLayer {
    
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
        strokeColor = 0x797C8F.HexColor.cgColor
        lineWidth = 3
        
        let gradient = CAGradientLayer()
        
        
    }
    
    
}

extension JDLineLayer:CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
    }
    
}

