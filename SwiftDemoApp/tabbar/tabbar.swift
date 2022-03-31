//
//  tabbar.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2021/7/5.
//

import Foundation
import UIKit
import SwiftHEXColors
import SVGKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        createViewController()
    }
    func createViewController() {
        var tabArray:[UINavigationController] = []
        tabArray.append(createNav(HomeViewController(), title: "首页", image: "tabbar_home", seletImage: "tabbar_home_select.png"))
        tabArray.append(createNav(MenuViewController(), title: "菜单", image: "tabbar_menu.svg", seletImage: "tabbar_menu_select.svg"))
        tabArray.append(createNav(OrderViewController(), title: "订单", image: "tabbar_home", seletImage: "tabbar_home_select.png"))
        tabArray.append(createNav(MineViewController(), title: "我的", image: "tabbar_home", seletImage: "tabbar_home_select.png"))
        self.viewControllers = tabArray
    }
    
    //创建导航栏控制器
    func createNav(_ viewController:UIViewController!,title:String!,image:String!,seletImage:String!) -> UINavigationController {
        
        let _image:UIImage?;
        let _imageSelect:UIImage?;
        //加载SVG图片
        if(image.contains("svg") == true) {
            let svgImage = SVGKImage.init(named: image);
            svgImage?.size = .init(width: 20, height: 20)
            _image = svgImage?.uiImage
            
            let svgImageSelect = SVGKImage.init(named: seletImage);
            svgImageSelect?.size = .init(width: 20, height: 20)
            _imageSelect = SVGKImage.init(named: seletImage).uiImage.withRenderingMode(.alwaysOriginal)
        }else {
            _image =  UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
            _imageSelect =  UIImage(named: seletImage)?.withRenderingMode(.alwaysOriginal)
        }
        
        
        
        
        let item : UITabBarItem = UITabBarItem (title: title, image: _image, selectedImage: _imageSelect)
        
        viewController.tabBarItem = item
        
        self.tabBar.barTintColor=UIColor.clear;
        viewController.tabBarItem!.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(hexString: "#2b4c7e") as Any], for: .normal)
        viewController.tabBarItem!.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(hexString: "#2b4c7e") as Any], for: .selected)
        //导航栏
        let nav = UINavigationController(rootViewController: viewController)
        nav.navigationBar.barTintColor = UIColor.white
        nav.navigationBar.isTranslucent = false
        return nav
        
    }
    
}
