//
//  AppDelegate.swift
//  SwiftCocoa
//
//  Created by admin on 2017/6/20.
//  Copyright © 2017年 admin. All rights reserved.
//

/** 代码快捷键
 *  command + \                 添加断点
 *  command + /                 添加单行注释
 *  command + option + 方向键    开/合代码
 *  command + control + E       全部选中某一个变量
 *  command + option + []       上下移动代码
 *  command + []                左右移动代码
 */

/*
 * Mac系统中所有目录都是文件夹
 * Mac系统中所有的东西都存在一个盘里面
 * Mac系统是基于unix系统的
 * iOS系统也是基于unix系统的
 * 正是因为Mac系统是基于unix的,所以Mac系统也支持unix指令
 * ---------------------------------------------------- *
 * 常用的unix命令
 * pwd               : 查看当前所在的位置
 * ls                : 查看当前文件夹中的内容
 * cd                : 进入指定目录
 * mkdir 文件夹名称    : 创建一个文件夹
 * rmdir 文件夹名称    : 删除文件夹
 * cd ../            : 回到上一级文件夹
 * clear             : 清空终端
 * open 文件名称       : 打开文件夹/文件
 * touch 文件名称      : 创建一个文件
 * cat 文件名称        : 查看一个文件
 */




import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //button的事件互斥
        UIButton.appearance().isExclusiveTouch = true
        
        U.setMobile(mobile: "b2tTQndEQ2NoUGFnekVqWUZPZEtlQT09")//NWNDMkkvVEVDK1ZCell2UTZiSk5Tdz09 b2tTQndEQ2NoUGFnekVqWUZPZEtlQT09
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = 0xffffff.HexColor
        //window?.rootViewController = TabBarController()
        window?.rootViewController = UIStoryboard(name: "Test", bundle: nil).instantiateViewController(withIdentifier: "TestTabBarControllerID") as! TestTabBarController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

