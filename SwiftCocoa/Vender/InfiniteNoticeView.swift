//
//  InfiniteNoticeView.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/14.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class InfiniteNoticeView: UIView {
    //MARK: 点击回调的闭包
    var didClickNoticeClosure:((InfiniteNoticeView,Int) -> Void)?
    //MARK: 一共有多少个区
    fileprivate let totalSections = 1000
    //MARK: 定时器
    fileprivate var timer:Timer!
    //MARK: 公告数组
    lazy var noticeStrs = [String]()
    //MARK: 轮播滑动视图
    fileprivate lazy var contentCollectionView:UICollectionView = {
        let vi = UICollectionView(frame: self.bounds, collectionViewLayout: InfiniteNoticeLayout())
        vi.register(InfiniteNoticeCollectionViewCell.self, forCellWithReuseIdentifier: "InfiniteNoticeCollectionViewCellID")
        vi.delegate = self
        vi.dataSource = self
        return vi
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: 刷新banner的方法
    func reloadInfiniteCircularView() {
        if noticeStrs.count <= 1 {
            contentCollectionView.reloadData()
            stopTimer()
        }else{
            stopTimer()
            contentCollectionView.reloadData()
            contentCollectionView.scrollToItem(at: IndexPath(item: 0, section: totalSections/2), at: .top, animated: false)
            startTimer()
        }
    }
    //MARK: 开启定时器
    fileprivate func startTimer() {
        let time = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(nextNotice), userInfo: nil, repeats: true)
        RunLoop.main.add(time, forMode: .commonModes)
        timer = time
    }
    //MARK: 关闭定时器
    fileprivate func stopTimer() {
        if timer == nil { return }
        timer.invalidate()
        timer = nil
    }
    //MARK: 初始化View
    fileprivate func initView(){
        addSubview(contentCollectionView)
    }
    //MARK: 定时器方法
    @objc fileprivate func nextNotice() {
        guard contentCollectionView.indexPathsForVisibleItems.count != 0 else {
            return
        }
        let currentIndexPath = contentCollectionView.indexPathsForVisibleItems.last!
        let currentIndexPathReset = IndexPath(item: currentIndexPath.item, section: totalSections/2)
        contentCollectionView.scrollToItem(at: currentIndexPathReset, at: .top, animated: false)
        var nextItem = currentIndexPathReset.item + 1
        var nextSection = currentIndexPathReset.section
        if nextItem == noticeStrs.count {
            nextItem = 0
            nextSection += 1
        }
        let nextIndexPath = IndexPath(item: nextItem, section: nextSection)
        contentCollectionView.scrollToItem(at: nextIndexPath, at: .top, animated: true)
    }
}

extension InfiniteNoticeView:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return totalSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noticeStrs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfiniteNoticeCollectionViewCellID", for: indexPath) as! InfiniteNoticeCollectionViewCell
        cell.conLabel.text = noticeStrs[indexPath.item]
        return cell
    }
    //MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if noticeStrs.count == 0 { return }
        didClickNoticeClosure?(self,indexPath.item)
    }
    
}

class InfiniteNoticeLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        scrollDirection = .vertical
        itemSize = CGSize(width: (collectionView?.bounds.size.width)!, height: (collectionView?.bounds.size.height)!)
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.isPagingEnabled = true
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.isScrollEnabled = false
    }
}

class InfiniteNoticeCollectionViewCell: UICollectionViewCell {
    //MARK: 公告内容
    fileprivate lazy var conLabel:UILabel = {
        let lab = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        lab.textAlignment = .left
        lab.textColor = 0x8190a7.HexColor
        lab.font = UIFont.systemFont(ofSize: 15)
        lab.numberOfLines = 1
        lab.lineBreakMode = .byTruncatingTail
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 初始化视图
    fileprivate func initView() {
        backgroundColor = UIColor.clear
        contentView.addSubview(conLabel)
    }
    
}

