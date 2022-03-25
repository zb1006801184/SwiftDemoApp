//
//  tabbar.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2021/7/5.
//

import Foundation
import UIKit

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
        tabArray.append(createNav(MenuViewController(), title: "菜单", image: "tabbar_home", seletImage: "tabbar_home_select.png"))
        self.viewControllers = tabArray
    }
    
    func createNav(_ viewController:UIViewController!,title:String!,image:String!,seletImage:String!) -> UINavigationController {
        
        let item : UITabBarItem = UITabBarItem (title: title, image: UIImage(named: image), selectedImage: UIImage(named: seletImage)?.withRenderingMode(.alwaysOriginal))
        
        viewController.tabBarItem = item
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for:.normal);
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for:.selected)
        self.tabBar.barTintColor=UIColor.clear;
                viewController.tabBarItem!.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .normal)
                viewController.tabBarItem!.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .selected)
        //导航栏
        let nav = UINavigationController(rootViewController: viewController)
        nav.navigationBar.barTintColor = UIColor.white
        nav.navigationBar.isTranslucent = false
        return nav
        
    }
    
}
