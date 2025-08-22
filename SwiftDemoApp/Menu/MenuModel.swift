//
//  MenuModel.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2025/8/22.
//

import Foundation

// 商品类别
enum MenuCategory: String, CaseIterable {
    case popular = "人气Top"
    case masterCoffee = "大师咖啡"
    case signature = "零度拿铁"
    case frappuccino = "瑞纳冰"
    case classic = "经典饮品"
    case light = "健康轻食"
    case juice = "鲜榨果蔬汁"
}

// 商品规格
enum CoffeeSize: String, CaseIterable {
    case large = "大"
    case medium = "单糖"
    case hot = "热"
}

// 菜单商品模型
struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let englishName: String
    let description: String
    let price: Double
    let originalPrice: Double?
    let imageName: String
    let category: MenuCategory
    let isHot: Bool
    let sizes: [CoffeeSize]
    let discount: String?
}

// 菜单数据
class MenuData {
    static let shared = MenuData()
    
    let menuItems: [MenuItem] = [
        MenuItem(
            name: "榛果拿铁",
            englishName: "Hazelnut Latte",
            description: "默认人: 大/单糖/热",
            price: 27,
            originalPrice: nil,
            imageName: "coffee_latte",
            category: .popular,
            isHot: true,
            sizes: [.large, .medium, .hot],
            discount: "充2送1"
        ),
        MenuItem(
            name: "拿铁",
            englishName: "Latte",
            description: "默认人: 大/无糖/热",
            price: 24,
            originalPrice: nil,
            imageName: "coffee_latte",
            category: .popular,
            isHot: true,
            sizes: [.large, .hot],
            discount: "充2送1"
        ),
        MenuItem(
            name: "香草拿铁",
            englishName: "Vanilla Latte",
            description: "默认人: 大/单糖/热",
            price: 27,
            originalPrice: nil,
            imageName: "coffee_latte",
            category: .popular,
            isHot: true,
            sizes: [.large, .medium, .hot],
            discount: "充2送1"
        ),
        MenuItem(
            name: "焦糖拿铁",
            englishName: "Caramel Latte",
            description: "默认人: 大/单糖/热",
            price: 29,
            originalPrice: nil,
            imageName: "coffee_latte",
            category: .popular,
            isHot: true,
            sizes: [.large, .medium, .hot],
            discount: nil
        )
    ]
    
    private init() {}
}
