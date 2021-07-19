//
//  ZhiHuDailyDetailViewController.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2021/7/19.
//
//知乎日报- 首页 - 详情
import Foundation

class ZhiHuDailyDetailController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "详情";
        configView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false

    }
    
    func configView()  {
        
    }
    
}
