//
//  ProfileView.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2025/8/22.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var profileData = ProfileData.shared
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // 顶部用户信息区域
                    userHeaderSection
                    
                    // 菜单列表
                    menuListSection
                    
                    // 底部横幅广告
                    bannerSection
                }
            }
            .navigationBarHidden(true)
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
    
    // 顶部用户信息区域
    private var userHeaderSection: some View {
        ZStack {
            // 棕色背景
            Rectangle()
                .fill(Color.brown)
                .frame(height: 200)
            
            VStack(spacing: 0) {
                // 状态栏区域
                HStack {
                    Text("xiaopiu")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    Image(systemName: "wifi")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                    
                    Spacer()
                    
                    Text("上午11:06")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    Spacer()
                    
                    Image(systemName: "bluetooth")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                    
                    Text("100%")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                    
                    Image(systemName: "battery.100")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
                // 使用 Spacer 让用户信息区域垂直居中
                Spacer()
                
                // 用户信息 - 在剩余空间中居中显示
                HStack(spacing: 16) {
                    // 头像
                    Circle()
                        .fill(Color.white.opacity(0.3))
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image(systemName: "person.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                        )
                    
                    // 用户名
                    Text(profileData.userProfile.username)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // 通知铃铛
                    Button(action: {
                        // 通知点击事件
                    }) {
                        Image(systemName: "bell.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    }
                    
                    // 箭头
                    Image(systemName: "chevron.right")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.horizontal, 16)
                
                // 底部 Spacer，让用户信息完全居中
                Spacer()
            }
        }
    }
    
    // 菜单列表区域
    private var menuListSection: some View {
        VStack(spacing: 0) {
            ForEach(profileData.menuItems) { item in
                ProfileMenuRow(item: item)
                
                if item.id != profileData.menuItems.last?.id {
                    Divider()
                        .padding(.leading, 60)
                }
            }
        }
        .background(Color.white)
        .cornerRadius(12)
        .padding(.horizontal, 16)
        .padding(.top, -20) // 向上重叠一部分
    }
    
    // 底部横幅广告
    private var bannerSection: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.6)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 120)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("关注官方微信")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                    Text("【luckincoffee瑞幸咖啡】")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.9))
                    
                    Text("每周都领5折券")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                // 人物图片占位
                Circle()
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 80, height: 80)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white.opacity(0.8))
                    )
            }
            .padding(.horizontal, 20)
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
        .padding(.bottom, 100) // 为底部tab bar留出空间
    }
}

// 菜单行组件
struct ProfileMenuRow: View {
    let item: ProfileMenuItem
    
    var body: some View {
        Button(action: {
            item.action?()
        }) {
            HStack(spacing: 16) {
                // 图标
                Image(systemName: item.icon)
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .frame(width: 24, height: 24)
                
                // 标题
                Text(item.title)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                
                Spacer()
                
                // 副标题
                if let subtitle = item.subtitle {
                    Text(subtitle)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                // 箭头
                if item.hasArrow {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14))
                        .foregroundColor(.gray.opacity(0.6))
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ProfileView()
}
