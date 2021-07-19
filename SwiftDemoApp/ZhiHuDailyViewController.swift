//
//  ZhiHuDailyViewController.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2021/7/5.
//

import Foundation
import UIKit
class ZhiHuDailViewController: UIViewController,SDCycleScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    var sdcCycleScrollView:SDCycleScrollView! //轮播图
    var mainTableView:UITableView! //列表
    
    override func viewDidLoad() {
        configView()
        requestData()
    }
    func requestData() -> Void {
        AlamofireHelper.get(url: LAEST_URL, parameters: nil) { (res) in
            print(res)
        } failureHandler: { (error) in
            print(error as Any)
        }


    }
    func configView() -> Void {
        view.backgroundColor = UIColor.white
        title = "知乎日报"
        self.sdcCycleScrollView = SDCycleScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200), shouldInfiniteLoop: true, imageNamesGroup: ["home.png","homeco.png"])
        self.sdcCycleScrollView.delegate = self
        self.mainTableView = UITableView(frame: view.bounds, style: .plain)
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.tableHeaderView = self.sdcCycleScrollView
        self.mainTableView.tableFooterView = UIView()
        self.mainTableView.separatorStyle = UITableViewCell.SeparatorStyle.none;
        view.addSubview(self.mainTableView)
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:MainListCell! = tableView.dequeueReusableCell(withIdentifier: "MainListCell") as? MainListCell
        
        if (cell == nil) {

            cell = MainListCell(style: .default, reuseIdentifier: "MainListCell" )
            
        }
        cell.dataList = ["人在逆境中该如何调整自己的状态？在逆境中该如何调整自己的状态？"];
        
        return cell
    }
    
}
