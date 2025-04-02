//
//  ContentView.swift
//  SwiftDemoApp
//
//  Created by 司成雷 on 2025/4/1.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            
        //tabbar
        TabView {
            //首页
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("首页")
                }
            
            //分类
            HomeView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("分类")
                }
            
            //购物车
            HomeView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("购物车")
                }
            
            //我的
            HomeView()
                .tabItem {
                    Image(systemName: "person")
                    Text("我的")
                }
        }
        
    
    }
}

#Preview {
    ContentView()
}
