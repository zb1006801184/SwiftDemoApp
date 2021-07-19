//
//  ZhiHuDailyDetailViewController.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2021/7/19.
//
//知乎日报- 首页 - 详情
import Foundation
import WebKit
class ZhiHuDailyDetailController: BaseViewController,WKUIDelegate {
    public var model : NewsModel?
    var _webView:WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "详情";
        configView()
        
    }
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration();
        _webView = WKWebView(frame: .zero, configuration: webConfiguration)
        _webView.uiDelegate = self;
        view = _webView;
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
        let myURL = URL(string:model?.url ?? "")
        let myRequest = URLRequest(url: myURL!)
        _webView.load(myRequest)
        
    }
    
}
