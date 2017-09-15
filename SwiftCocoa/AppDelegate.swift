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

/*
 * Xcode4之前是使用GCC编译器来翻译代码.
 * GCC编译器: 开源免费的编译器(C/C++/OC/Java...)
 * Xcode4之后使用LLVM编译器.
 * LLVM编译器: (虚拟机 Clang前段就是专门用来编译代码的)
 
 * 编译:
 * cc -c 文件名 翻译我们自己的代码
 * 链接:
 * cc    文件名 将我们自己的代码和系统的以及其他依赖文件的代码组合在一起
 * 
 * 
   cc -c main.c
    --> main.i  替换文件中所有的预处理指令(比如宏)
    --> main.s  汇编
    --> main.o  二进制 01010101
   cc main.o
    --> a.out
   ./a.out      运行
 
  ps: 如果只有警告没有错误,Clang会帮我们翻译代码.如果有错误,那么Clang就不会给我们翻译代码
  注意:Clang编译器在编译的时候只会检查语法错误
      Clang编译器只会在链接的时候检查函数有没有真正的实现
 */

/*  include
 *  #include是C语言预处理指令之一,所谓预处理,就是在编译之前做的处理,预处理指令一般以 # 开头
 *  #include<stdio.h>相当于拷贝stdio.h文件中的内容到当前的文件夹下.
 *  
 *  <> 和 "" 的区别
    >如果使用<>代表会先从开发工具的编译环境中去查找
    >如果编译环境中没有找到,那么会再去系统的编译环境中找
 
    >如果使用""代表会先从当前文件所在的文件夹下面查找
    >如果在当前文件所在的文件夹下面没有找到,那么就会去开发工具的编译环境中去查找
    >如果编译环境中没有找到,那么会再去系统的编译环境中找
    
    注意: include后面不一定要写文件名称,也可以写路径(相对路径 / 全路径)      eg : #include "abc/lnj.txt"
 *
 */


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //button的事件互斥
        UIButton.appearance().isExclusiveTouch = true
        
        U.setMobile(mobile: "b2tTQndEQ2NoUGFnekVqWUZPZEtlQT09")//NWNDMkkvVEVDK1ZCell2UTZiSk5Tdz09 b2tTQndEQ2NoUGFnekVqWUZPZEtlQT09
        setupRootViewController()
        
        return true
    }
    
    fileprivate func setupRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = 0xffffff.HexColor
        let loginVc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewControllerID") as! LoginViewController
        window?.rootViewController = UINavigationController(rootViewController: loginVc)
        window?.makeKeyAndVisible()
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

