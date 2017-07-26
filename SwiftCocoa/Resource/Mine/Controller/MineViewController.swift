//
//  MineViewController.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/4.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit
import HealthKit


class MineViewController: BaseViewController {
    
    lazy var mineVM = MineViewModel()
    
    var healthStore:HKHealthStore!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Print.dlog("mine willappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNav()
        blindViewModel()
        
    }
    /**
     * 初始化nav
     */
    fileprivate func initNav() {
        setUpCustomNav(title: "我的", hexColorTitle: UIColor.black, hexColorBg: 0xffffff)
        setUpNavShadow()
    }
    
    fileprivate func blindViewModel() {
        
    }
    
    fileprivate func testHealthKit() {
        
        healthStore = HKHealthStore()
        let step = HKObjectType.quantityType(forIdentifier: .stepCount)
        let set = NSSet(objects: step as Any) as? Set<HKObjectType>
        healthStore.requestAuthorization(toShare: nil, read: set) { (isSuccess, error) in
            if isSuccess {
                self.readStepCount()
            }else{
                print("获取授权失败")
            }
        }
        
    }
    
    fileprivate func readStepCount() {
        
        let sampleType = HKQuantityType.quantityType(forIdentifier: .stepCount)
        let start = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let end = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        let now = Date()
        let calender = Calendar.current
        let dateComponent = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: now)
        let hour = dateComponent.hour!
        let minute = dateComponent.minute!
        let second = dateComponent.second!
        let nowDay = Date(timeIntervalSinceNow: -(Double(hour*3600 + minute * 60 + second)))
        let nextDay = Date(timeIntervalSinceNow: -(Double(hour*3600 + minute * 60 + second) + 86400))
        let predicate = HKQuery.predicateForSamples(withStart: nowDay, end: nextDay, options: .init(rawValue: 0))
        let sampleQuery = HKSampleQuery(sampleType: sampleType!, predicate: predicate, limit: 0, sortDescriptors: [start,end]) { (query, results, error) in
            let allStepCount = 0
            for result in results! {
                let quantity = (result as! HKQuantitySample).quantity
                print(quantity)
            }
        }
        
        healthStore.execute(sampleQuery)
        
    }
    
}







