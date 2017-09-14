//
//  XYPhotoViewController.swift
//  SwiftCocoa
//
//  Created by 祁小峰 on 2017/9/13.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class XYPhotoViewController: BaseTableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.isTranslucent = false
        tableView.register(UINib(nibName: "XYDynamicCell", bundle: nil), forCellReuseIdentifier: "XYDynamicCellID")
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "XYDynamicCellID") as! XYDynamicCell
        
        cell.contentView.backgroundColor = UIColor.red
        
        return cell
    }
    
    
    
    
}
