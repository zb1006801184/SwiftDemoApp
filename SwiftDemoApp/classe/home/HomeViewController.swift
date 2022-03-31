//
//  HomeViewController.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2022/3/25.
//

import Foundation
import SVGKit
class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
//        initView()
    }
    func initView() -> Void {
        let svgView = UIImageView(frame: .init(x: 100, y: 100, width: 100, height: 100))

        let lockImage: SVGKImage = SVGKImage(contentsOfFile: Bundle.main.path(forResource: "tabbar_menu_select", ofType: "svg"))
                svgView.image = lockImage.uiImage

        
        self.view.addSubview(svgView)
    }
}
