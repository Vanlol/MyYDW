//
//  String+Category.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/25.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

extension String {
    
    //获得string内容高度
    func stringHeightWith(fontSize:CGFloat, width:CGFloat) -> CGFloat {
        
        let font = UIFont.systemFont(ofSize: fontSize)
        
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineBreakMode = .byWordWrapping;
        
        let attributes = [NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy()]
        
        let text = self as NSString
        
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: attributes, context:nil)
        
        return rect.size.height
        
    }
    
}
