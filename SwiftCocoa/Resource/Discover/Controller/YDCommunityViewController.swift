//
//  YDCommunityViewController.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/19.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit
import SDWebImage

class YDCommunityViewController: BaseViewController {
    
    @IBOutlet weak var contentTableView: UITableView!
    
    @IBOutlet weak var bannerView: UIView!
    
    @IBOutlet weak var contentCollectionView: UICollectionView!
    
    fileprivate lazy var infiniteView:InfiniteCircularView = {
        let vi = InfiniteCircularView(frame: CGRect(x: 0, y: 0, width: C.SCREEN_WIDTH, height: 190))
        return vi
    }()
    
    fileprivate lazy var ydcommnuityVM = YDCommunityViewModel()
    fileprivate lazy var ydCommunityM = YDCommunityModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNav()
        initView()
        blindViewModel()
    }
    /**
     * 初始化nav
     */
    fileprivate func initNav() {
        setUpSystemNav(title: "发现", hexColorBg: 0xffffff)
        navigationItem.leftBarButtonItem = UIBarButtonItem.backItemWithImage(image: "4_nav_return_icon", target: self, action: #selector(backButtonClick))
        let searchItem = UIBarButtonItem.itemWithImage(image: "community_main_search", target: self, action: #selector(searchButtonClick))
        let msgItem = UIBarButtonItem.itemWithImage(image: "community_main_mesg", target: self, action: #selector(messageButtonClick))
        navigationItem.rightBarButtonItems = [msgItem,searchItem]
    }
    //MARK: 返回按钮点击事件
    func backButtonClick() {
        navigationController?.popViewController(animated: true)
    }
    //MARK: 搜索按钮点击事件
    func searchButtonClick() {
        if isHud {return}
        let vc = WebTestViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    //MARK: 信息按钮点击事件
    func messageButtonClick() {
        if isHud {return}
        _ = TestSwfitSpinner.shared.show()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5, execute: {
            _ = TestSwfitSpinner.shared.dismiss()
        })
    }
    /**
     * 初始化视图
     */
    fileprivate func initView() {
        initInfiniteVi()
        initCollectionVi()
        initTableVi()
        loadingShow()
    }
    /**
     * 初始化轮播
     */
    fileprivate func initInfiniteVi() {
        bannerView.addSubview(infiniteView)
        infiniteView.didClickBannerImageClosure = {(infiniteVi,index) -> Void in
            
        }
    }
    /**
     * 初始化collectionView
     */
    fileprivate func initCollectionVi() {
        contentCollectionView.collectionViewLayout = YDCommunityFlowLayout()
        contentCollectionView.register(UINib(nibName: "YDCommunityModualCell", bundle: nil), forCellWithReuseIdentifier: "YDCommunityModualCellID")
    }
    /**
     * 初始化tableView
     */
    fileprivate func initTableVi() {
        contentTableView.register(UINib(nibName: "YDCommunityTopicCell", bundle: nil), forCellReuseIdentifier: "YDCommunityTopicCellID")
    }
    /**
     * 绑定viewModel
     */
    fileprivate func blindViewModel() {
        ydcommnuityVM.loadYDCommunity(closure: { (data) in
            self.ydCommunityM = data
            //处理banner数据
            self.ydcommnuityVM.findBannerUrls(data: data, closure: { (urls) in
                self.infiniteView.urlStrs = urls
                self.infiniteView.reloadInfiniteCircularView()
            })
            self.contentCollectionView.reloadData()
            self.contentTableView.reloadData()
            self.loadingDismiss()
        }) { 
            self.loadingFail()
        }
    }
    
}

extension YDCommunityViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ydCommunityM.topic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YDCommunityTopicCellID") as! YDCommunityTopicCell
        
        let cm = ydCommunityM.topic[indexPath.row]
        cell.titleLab.text = cm.title
        cell.contentLab.text = cm.content
        cell.nameLab.text = cm.username
        cell.blueBtn.setTitle(cm.views, for: .normal)
        cell.greenBtn.setTitle(cm.comments, for: .normal)
        cell.redBtn.setTitle(cm.favorites, for: .normal)
        cell.containerViewHeight.constant = cm.viewHeight
        cell.containerViewTrailing.constant = cm.viewTrailing
        cell.contentImageVi.isHidden = cm.isHiddenImageVi
        
        let url = URL(string: cm.avatar)
        if url == nil {
            cell.headerImageVi.image = UIImage(named: "bbs_main_default")
        }else{
            cell.headerImageVi.sd_setImage(with: url!, placeholderImage: UIImage(named: "bbs_main_default")!)
        }
        if cm.thumb.count > 0 {
            if let url = URL(string: cm.thumb[0].thumb) {
                cell.contentImageVi.setImageWith(url)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension YDCommunityViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ydCommunityM.modular.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YDCommunityModualCellID", for: indexPath) as! YDCommunityModualCell
        cell.titleLab.text = ydCommunityM.modular[indexPath.item].cname
        if let url = URL(string: ydCommunityM.modular[indexPath.item].ico) {
            cell.iconImageVi.sd_setImage(with: url)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

class YDCommunityFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        itemSize = CGSize(width: C.SCREEN_WIDTH / 4, height: 80)
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        scrollDirection = .vertical
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
    }
}








