//
//  ZhiHuDailyViewController.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2021/7/5.
//
// 知乎日报- 首页
import Foundation
import UIKit
import SwiftyJSON
class ZhiHuDailViewController: BaseViewController,SDCycleScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    var sdcCycleScrollView:SDCycleScrollView! //轮播图
    var mainTableView:UITableView! //列表
    var dataList:NSMutableArray? = NSMutableArray()  //数据源
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        requestData()
    }
    
    func requestData() -> Void {
        
        
        AlamofireHelper.get(url: LAEST_URL, parameters: nil) { (res) in
            let jsonData = JSON(res)
            let  top_stories = jsonData["top_stories"].arrayValue
            
            for item in top_stories {
                self.dataList?.add(NewsModel().initJson(jsonDta: item))
            }
            
            self.mainTableView.reloadData();
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
        return dataList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:MainListCell! = tableView.dequeueReusableCell(withIdentifier: "MainListCell") as? MainListCell
        
        if (cell == nil) {

            cell = MainListCell(style: .default, reuseIdentifier: "MainListCell" )
        }
        cell.model = self.dataList?[indexPath.row] as? NewsModel;
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(ZhiHuDailyDetailController(), animated: true)
    }
    
}
