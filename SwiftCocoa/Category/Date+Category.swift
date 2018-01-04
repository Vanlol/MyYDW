//
//  Date+Category.swift
//  SwiftCocoa
//
//  Created by Hengzhan on 2018/1/4.
//  Copyright © 2018年 admin. All rights reserved.
//

import Foundation


extension Date {
    /** 返回当前时间(时区为当前时区) **/
    func currentZoneDate() -> Date {
        let currentDate = Date()
        let zone = NSTimeZone.system
        let time = zone.secondsFromGMT(for: currentDate)
        let nowDate = currentDate.addingTimeInterval(TimeInterval(time))
        return nowDate
    }
    /** 将服务器返回的字符串时间转时间 **/
    func formatterDate(dateStr:String) -> Date {
        let newStr = dateStr.replacingOccurrences(of: "+", with: " ")
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS zz:z"
        let date = fmt.date(from: newStr)
        if date != nil {
            return date!
        }else{
            return Date()
        }
    }
    
}

extension String {
    /** 将服务器返回的字符串时间取时,分,秒 **/
    func getSMH() -> String {
        let dateStr = "没有时间格式"
        if self == "" {
            return dateStr
        }else{
            let newStr = self.components(separatedBy: ".").first
            if newStr == nil {
                return dateStr
            }else{
                let resultStr = newStr?.components(separatedBy: "T").last
                if resultStr == nil {
                    return dateStr
                }else{
                    return resultStr!
                }
            }
        }
    }
    /** 将服务器返回的字符串时间取年,月,日 **/
    func getYMD() -> String {
        let dateStr = "没有时间格式"
        if self == "" {
            return dateStr
        }else{
            let newStr = self.components(separatedBy: ".").first
            if newStr == nil {
                return dateStr
            }else{
                let resultStr = newStr?.components(separatedBy: "T").first
                if resultStr == nil {
                    return dateStr
                }else{
                    return resultStr!
                }
            }
        }
    }
    
    
}


/*
 
 G:      公元时代，例如AD公元
 yy:     年的后2位
 yyyy:   完整年
 MM:     月，显示为1-12,带前置0
 MMM:    月，显示为英文月份简写,如 Jan
 MMMM:   月，显示为英文月份全称，如 Janualy
 dd:     日，2位数表示，如02
 d:      日，1-2位显示，如2，无前置0
 EEE:    简写星期几，如Sun
 EEEE:   全写星期几，如Sunday
 aa:     上下午，AM/PM
 H:      时，24小时制，0-23
 HH:     时，24小时制，带前置0
 h:      时，12小时制，无前置0
 hh:     时，12小时制，带前置0
 m:      分，1-2位
 mm:     分，2位，带前置0
 s:      秒，1-2位
 ss:     秒，2位，带前置0
 S:      毫秒
 Z：      GMT（时区）
 
 */





