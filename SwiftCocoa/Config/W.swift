//
//  W.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/3.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation

struct W {
    
    static let env = Config().webUrl
    
    /** 存管没完全开通页 有的步骤没走 **/
    static let CUSTODY_APP_JUMP = env + "index.php/App/Custody/appJump/mm/"
    
    /** BBS 银多社区首页信息**/
    static let BBS_MESG_WEB = Config().BBSWebUrl + "index.php/node/show_sqmy?mm="
    
    static let YD_DONGTAI = env + "index.php/App/discover/dynamic/mm/"
    
}
