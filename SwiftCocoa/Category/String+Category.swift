//
//  String+Category.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/25.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit
import Foundation

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
    
    //getitemurl:getItemUrl?id=2833&cname=%25u7528%25u6237%25u4EA4%25u6D41&comment=  webView返回的secume.
    //%25u7528%25u6237%25u4EA4%25u6D41解码
    //unescape解码,
    func unescape() -> String {
        let a = replacingOccurrences(of: "%u", with: "\\u")
        let transform:NSString = "Any-Hex/Java"
        let convertedString = a.mutableCopy() as! NSMutableString
        CFStringTransform(convertedString, nil, transform , true)
        var tmp = ""
        var indexS = 0
        let srcMain = convertedString as String
        while (indexS < srcMain.characters.count){
            let indexR = srcMain.index(srcMain.startIndex, offsetBy: indexS)
            if (srcMain[indexR] == "%" ){
                let indR1 = srcMain.index(indexR, offsetBy: 1)
                if (srcMain[indR1]=="u"){
                    let s1 = srcMain.index(indR1, offsetBy: 1)
                    let e1 = srcMain.index(indR1, offsetBy: 5)
                    let hex = srcMain[s1..<e1]
                    let value = UInt32(strtoul(hex, nil, 16))
                    let dao:String = String(describing: UnicodeScalar(value)!)
                    tmp += dao
                    indexS += 6
                }else{
                    let s1 = srcMain.index(indR1, offsetBy: 0)
                    let e1 = srcMain.index(indR1, offsetBy: 2)
                    let hex = srcMain[s1..<e1]
                    let value = UInt32(strtoul(hex, nil, 16))
                    let dao:String = String(describing: UnicodeScalar(value)!)
                    tmp += dao
                    indexS += 3
                }
            }else{
                tmp += String(srcMain[indexR])
                indexS+=1
            }
        }
        return tmp
    }
    //getitemurl:getItemUrl?id=2833&cname=%25u7528%25u6237%25u4EA4%25u6D41&comment=
    /*
     *拆分参数数据，上传购买数据
     *返回(类型，外网地址，产品名称)
     */
    func splitParameter() -> (String, String, String, String, String, String, String, String, String, String, String, String, String){
        var parm = (title: "", thumburl: "", gotourl: "", description: "", addr: "",arrow: "",numbers: "", msg:"", share:"", help:"", rightText:"", id:"", url:"")
        _ = range(of: "?")
        let result = components(separatedBy: "?").last
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
    
    
    
    /*
     加密过程: 手机号 + "KEY"  ----(AES加密)---->   获得Data   ----加密结构Base64转码---->    获得试用的密钥
     */
    //MARK: AES128加密.
    func AES128Crypt() -> String {
        let key = "yinduozibenjiami"
        let ketData = (key as NSString).data(using: String.Encoding.utf8.rawValue)
        
        let mobileData = (self as NSString).data(using: String.Encoding.utf8.rawValue)
        
        let result = mobileData?.AES128Cryptt(operation: CCOperation(kCCEncrypt), keyData: ketData!)
        if result!.length > 0 {
            let str = result!.base64EncodedString(options: .lineLength64Characters)
            return str
        }else{
            Print.dlog("加密出错了!!!")
            return self
        }
    }
    
    
}
