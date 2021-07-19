//
//  BaseViewController.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2021/7/19.
//

import Foundation
class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() -> Void {
        navigationController!.navigationBar.topItem?.title = ""
        view.backgroundColor = UIColor.white;
    }
    
}
