//
//  ViewController.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2021/7/5.
//

import UIKit



class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var mainTableView:UITableView!
    var dataList:[String] = ["SnapKit的使用","SwiftyJSON的使用","知乎日报"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
        configTableView()
    }
    
    func configView() -> Void {
        self.title = "首页"
        self.view.backgroundColor = UIColor.white;
    }
    
    func configTableView() -> Void {
        self.mainTableView = UITableView(frame: view.bounds, style: .plain)
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.tableHeaderView = UIView()
        self.mainTableView.tableFooterView = UIView()
        view.addSubview(self.mainTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.dataList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            //知乎日报
            let ZhiHuVC = ZhiHuDailViewController()
            ZhiHuVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ZhiHuVC, animated: true)
        }
    }
}

