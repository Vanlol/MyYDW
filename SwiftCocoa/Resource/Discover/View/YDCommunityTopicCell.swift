//
//  YDCommunityTopicCell.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/25.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class YDCommunityTopicCell: UITableViewCell {
    
    
    //标题文字
    @IBOutlet weak var titleLab: UILabel!
    //内容文字
    @IBOutlet weak var contentLab: UILabel!
    //内容图片
    @IBOutlet weak var contentImageVi: UIImageView!
    //头像图片
    @IBOutlet weak var headerImageVi: UIImageView!{
        didSet{
            headerImageVi.layer.cornerRadius = 11
            headerImageVi.layer.masksToBounds = true
        }
    }
    //昵称文字
    @IBOutlet weak var nameLab: UILabel!
    //查看数按钮
    @IBOutlet weak var blueBtn: UIButton!
    //评论数按钮
    @IBOutlet weak var greenBtn: UIButton!
    //点赞数按钮
    @IBOutlet weak var redBtn: UIButton!
    
    //container距离右部的距离
    @IBOutlet weak var containerViewTrailing: NSLayoutConstraint!
    
    //包含标题与内容的高度
    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!
    //包含点赞,评论的父视图宽度
    @IBOutlet weak var bottomViewWidh: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
