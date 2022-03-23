//
//  AppDelegate.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2021/7/5.
//

import UIKit
import SwiftUI
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let root  = TabBarViewController()
        self.window?.rootViewController = root
        return true
    }
    
   
}

