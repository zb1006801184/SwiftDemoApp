//
//  ProfileModel.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2025/8/22.
//

import Foundation

// 个人信息模型
struct UserProfile {
    let id: String
    let username: String
    let avatar: String
    let coffeeBalance: Int
    let couponCount: Int
}

// 菜单项模型
struct ProfileMenuItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let subtitle: String?
    let hasArrow: Bool
    let action: (() -> Void)?
    
    init(title: String, icon: String, subtitle: String? = nil, hasArrow: Bool = true, action: (() -> Void)? = nil) {
        self.title = title
        self.icon = icon
        self.subtitle = subtitle
        self.hasArrow = hasArrow
        self.action = action
    }
}

// 个人中心数据管理
class ProfileData: ObservableObject {
    static let shared = ProfileData()
    
    @Published var userProfile = UserProfile(
        id: "user001",
        username: "xiaopiu_😊",
        avatar: "person.crop.circle.fill",
        coffeeBalance: 7,
        couponCount: 6
    )
    
    let menuItems: [ProfileMenuItem] = [
        ProfileMenuItem(
            title: "个人资料",
            icon: "person.circle",
            action: {
                print("跳转到个人资料")
            }
        ),
        ProfileMenuItem(
            title: "咖啡钱包",
            icon: "cup.and.saucer",
            subtitle: "7杯",
            action: {
                print("跳转到咖啡钱包")
            }
        ),
        ProfileMenuItem(
            title: "优惠券",
            icon: "ticket",
            subtitle: "6张",
            action: {
                print("跳转到优惠券")
            }
        ),
        ProfileMenuItem(
            title: "兑换优惠",
            icon: "gift",
            action: {
                print("跳转到兑换优惠")
            }
        ),
        ProfileMenuItem(
            title: "发票管理",
            icon: "doc.text",
            action: {
                print("跳转到发票管理")
            }
        ),
        ProfileMenuItem(
            title: "帮助反馈",
            icon: "heart",
            action: {
                print("跳转到帮助反馈")
            }
        )
    ]
    
    private init() {}
}