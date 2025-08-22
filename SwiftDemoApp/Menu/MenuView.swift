//
//  MenuView.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2025/8/22.
//

import SwiftUI

struct MenuView: View {
    @State private var selectedCategory: MenuCategory = .popular
    @State private var cartItems: [String: Int] = [:]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // 顶部横幅广告
                    bannerSection
                    
                    // 分类导航
                    categorySection
                    
                    // 商品列表
                    menuItemsSection
                }
            }
            .navigationTitle("选择咖啡和小食")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // 横幅广告区域
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
                
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(.horizontal, 20)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
    
    // 分类导航区域
    private var categorySection: some View {
        VStack(spacing: 0) {
            // 分类标签
            HStack {
                ForEach([MenuCategory.popular, MenuCategory.popular], id: \.self) { category in
                    Button(action: {
                        selectedCategory = category
                    }) {
                        Text(category.rawValue)
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(selectedCategory == category ? .blue : .gray)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            // 左侧分类菜单
            HStack(alignment: .top, spacing: 0) {
                // 左侧分类列表
                VStack(alignment: .leading, spacing: 16) {
                    categoryButton("大师咖啡", isSelected: false)
                    categoryButton("零度拿铁", isSelected: false)
                    categoryButton("瑞纳冰", isSelected: false)
                    categoryButton("经典饮品", isSelected: true, hasDiscount: true)
                    categoryButton("健康轻食", isSelected: false)
                    categoryButton("鲜榨果蔬汁", isSelected: false)
                    Spacer()
                }
                .frame(width: 100)
                .padding(.leading, 16)
                .padding(.top, 16)
                
                // 右侧商品列表区域
                VStack(spacing: 16) {
                    // 大师咖啡分组标题
                    HStack {
                        Text("大师咖啡")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("WBC（世界咖啡师大赛）冠军团队研配")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 16)
                    
                    // 商品列表
                    LazyVStack(spacing: 16) {
                        ForEach(MenuData.shared.menuItems) { item in
                            MenuItemRow(item: item, cartItems: $cartItems)
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .background(Color.white)
            }
        }
    }
    
    // 商品列表区域（简化版，主要内容在上面的分类区域中）
    private var menuItemsSection: some View {
        EmptyView()
    }
    
    // 分类按钮
    private func categoryButton(_ title: String, isSelected: Bool, hasDiscount: Bool = false) -> some View {
        HStack {
            VStack(alignment: .leading) {
                if hasDiscount {
                    Text("66折优惠")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.orange)
                        .cornerRadius(4)
                }
                
                Text(title)
                    .font(.system(size: 14))
                    .fontWeight(isSelected ? .semibold : .regular)
                    .foregroundColor(isSelected ? .black : .gray)
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

// 菜单项行视图
struct MenuItemRow: View {
    let item: MenuItem
    @Binding var cartItems: [String: Int]
    
    var body: some View {
        HStack(spacing: 12) {
            // 商品图片
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.brown.opacity(0.3))
                    .frame(width: 80, height: 80)
                
                Image(systemName: "cup.and.saucer.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.brown)
                
                // 优惠标签
                if let discount = item.discount {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text(discount)
                                .font(.caption2)
                                .foregroundColor(.white)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color.orange)
                                .cornerRadius(4)
                        }
                    }
                    .frame(width: 80, height: 80)
                }
            }
            
            // 商品信息
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.headline)
                    .fontWeight(.medium)
                
                Text(item.englishName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(item.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack {
                    Text("¥ \(Int(item.price))")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    // 添加按钮
                    Button(action: {
                        addToCart(item.id.uuidString)
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 28))
                            .foregroundColor(.blue)
                    }
                }
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
    
    private func addToCart(_ itemId: String) {
        cartItems[itemId, default: 0] += 1
    }
}

#Preview {
    MenuView()
}
