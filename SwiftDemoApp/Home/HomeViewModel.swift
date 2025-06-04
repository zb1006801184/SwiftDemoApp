//
//  HomeViewModel.swift
//  SwiftDemoApp
//
//  Created by 司成雷 on 2025/4/5.
//

import Foundation
import SwiftUI

// 首页数据模型
struct HomeData {
    // 轮播图数据
    struct BannerItem {
        let id: Int
        let title: String
        let subtitle: String
        let description: String
        let colors: [Color]
    }
    
    // 功能菜单项数据
    struct MenuItem {
        let id: Int
        let icon: String
        let title: String
        let subtitle: String
        let backgroundColor: Color
        let iconColor: Color
    }
    
    // 店铺信息数据
    struct StoreInfo {
        let name: String
        let distance: String
        let isPickupSelected: Bool
    }
}

// 首页ViewModel
class HomeViewModel: ObservableObject {
    // 发布的状态属性
    @Published var banners: [HomeData.BannerItem] = []
    @Published var menuItems: [HomeData.MenuItem] = []
    @Published var storeInfo: HomeData.StoreInfo
    @Published var isPickupSelected: Bool = true
    
    // 初始化方法
    init() {
        // 初始化店铺信息
        self.storeInfo = HomeData.StoreInfo(
            name: "青年汇店",
            distance: "距您53m",
            isPickupSelected: true
        )
        
        // 加载数据
        loadBannerData()
        loadMenuData()
    }
    
    // 加载轮播图数据
    private func loadBannerData() {
        banners = [
            HomeData.BannerItem(
                id: 1,
                title: "新用户",
                subtitle: "首件免费",
                description: "再得5折大券包",
                colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.6)]
            ),
            HomeData.BannerItem(
                id: 2,
                title: "限时优惠",
                subtitle: "买一送一",
                description: "精选咖啡特惠",
                colors: [Color.orange.opacity(0.8), Color.red.opacity(0.6)]
            ),
            HomeData.BannerItem(
                id: 3,
                title: "会员专享",
                subtitle: "积分双倍",
                description: "享受更多权益",
                colors: [Color.green.opacity(0.8), Color.teal.opacity(0.6)]
            )
        ]
    }
    
    // 加载功能菜单数据
    private func loadMenuData() {
        menuItems = [
            HomeData.MenuItem(
                id: 1,
                icon: "cup.and.saucer",
                title: "现在下单",
                subtitle: "ORDER NOW",
                backgroundColor: Color.brown.opacity(0.1),
                iconColor: Color.brown
            ),
            HomeData.MenuItem(
                id: 2,
                icon: "wallet.pass",
                title: "咖啡钱包",
                subtitle: "COFFEE WALLET",
                backgroundColor: Color.orange.opacity(0.1),
                iconColor: Color.orange
            ),
            HomeData.MenuItem(
                id: 3,
                icon: "gift",
                title: "送Ta咖啡",
                subtitle: "SEND COFFEE",
                backgroundColor: Color.pink.opacity(0.1),
                iconColor: Color.pink
            ),
            HomeData.MenuItem(
                id: 4,
                icon: "building.2",
                title: "企业账户",
                subtitle: "ENTERPRISE ACCOUNT",
                backgroundColor: Color.green.opacity(0.1),
                iconColor: Color.green
            )
        ]
    }
    
    // 切换自提/外送状态
    func togglePickupDelivery() {
        isPickupSelected.toggle()
    }
    
    // 处理菜单项点击
    func handleMenuItemTap(_ item: HomeData.MenuItem) {
        // 根据不同的菜单项执行不同的操作
        switch item.id {
        case 1:
            // 现在下单
            print("跳转到下单页面")
        case 2:
            // 咖啡钱包
            print("跳转到钱包页面")
        case 3:
            // 送Ta咖啡
            print("跳转到送咖啡页面")
        case 4:
            // 企业账户
            print("跳转到企业账户页面")
        default:
            break
        }
    }
    
    // 处理推广横幅点击
    func handlePromotionTap() {
        print("处理推广横幅点击事件")
    }
}
