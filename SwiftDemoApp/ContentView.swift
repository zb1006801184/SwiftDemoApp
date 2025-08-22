//
//  ContentView.swift
//  SwiftDemoApp
//
//  Created by 司成雷 on 2025/4/1.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // TabBar主界面
        TabView {
            // 首页
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("首页")
                }

            // 菜单
            MenuView()
                .tabItem {
                    Image(systemName: "cup.and.saucer.fill")
                    Text("菜单")
                }

            // 订单
            OrderView()
                .tabItem {
                    Image(systemName: "doc.text.fill")
                    Text("订单")
                }

            // 购物车
            CartView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("购物车")
                }
            
            // 我的
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("我的")
                }
        }
        .accentColor(.blue) // 设置选中状态的颜色
    }
}

// 临时占位视图 - 订单页面
struct OrderView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("订单页面")
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .navigationTitle("订单")
        }
    }
}

// 临时占位视图 - 我的页面
struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("我的页面")
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .navigationTitle("我的")
        }
    }
}

#Preview {
    ContentView()
}
