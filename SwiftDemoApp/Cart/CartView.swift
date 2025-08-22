//
//  CartView.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2025/8/22.
//

import SwiftUI

struct CartView: View {
    @StateObject private var cartData = CartData.shared
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(spacing: 0) {
                        // 顶部横幅
                        bannerSection
                        
                        // 购物车商品列表
                        cartItemsSection
                        
                        // 推荐商品区域
                        recommendedSection
                        
                        // 底部空白，为结算栏留出空间
                        Color.clear.frame(height: 80)
                    }
                }
                
                // 底部结算栏
                checkoutBar
            }
            .navigationTitle("购物车")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // 顶部横幅
    private var bannerSection: some View {
        ZStack {
            Image(systemName: "cup.and.saucer.fill")
                .font(.system(size: 100))
                .foregroundColor(.brown.opacity(0.3))
                .frame(maxWidth: .infinity, maxHeight: 120)
                .background(
                    LinearGradient(
                        colors: [Color.brown.opacity(0.1), Color.orange.opacity(0.1)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            VStack(spacing: 8) {
                Text("luckin coffee的新鲜")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text("喝下第一口，你就会懂")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
            }
        }
        .frame(height: 120)
        .background(Color.brown.opacity(0.6))
        .cornerRadius(12)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
    
    // 购物车商品列表
    private var cartItemsSection: some View {
        VStack(spacing: 16) {
            if cartData.cartItems.isEmpty {
                VStack(spacing: 16) {
                    Image(systemName: "cart")
                        .font(.system(size: 60))
                        .foregroundColor(.gray.opacity(0.5))
                    
                    Text("购物车是空的")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 60)
            } else {
                ForEach(cartData.cartItems) { item in
                    CartItemRow(item: item)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }
    
    // 推荐商品区域
    private var recommendedSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("猜你喜欢")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button("换一批") {
                    // 换一批逻辑
                }
                .foregroundColor(.blue)
                .font(.subheadline)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(cartData.recommendedItems) { item in
                        RecommendedItemCard(item: item)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .padding(.top, 24)
    }
    
    // 底部结算栏
    private var checkoutBar: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("应付合计")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("¥\(Int(cartData.totalPrice))")
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Button(action: {
                // 去结算逻辑
            }) {
                Text("去结算")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 120, height: 50)
                    .background(Color.blue)
                    .cornerRadius(25)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.white)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -2)
    }
}

// 购物车商品行
struct CartItemRow: View {
    let item: CartItem
    @StateObject private var cartData = CartData.shared
    
    var body: some View {
        HStack(spacing: 12) {
            // 选择框
            Button(action: {
                // 切换选择状态
            }) {
                Image(systemName: item.isSelected ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(item.isSelected ? .blue : .gray)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                // 商品信息
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(item.name)
                                .font(.headline)
                                .fontWeight(.medium)
                            
                            if let discount = item.discount {
                                Text(discount)
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 2)
                                    .background(Color.orange)
                                    .cornerRadius(4)
                            }
                        }
                        
                        Text(item.description)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                    }
                    
                    Spacer()
                }
                
                // 价格和数量控制
                HStack {
                    Text("¥\(Int(item.price))")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                    
                    Spacer()
                    
                    // 数量控制
                    HStack(spacing: 16) {
                        Button(action: {
                            let newQuantity = max(0, item.quantity - 1)
                            cartData.updateQuantity(for: item.id, quantity: newQuantity)
                        }) {
                            Image(systemName: "minus.circle")
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                        
                        Text("\(item.quantity)")
                            .font(.headline)
                            .frame(minWidth: 20)
                        
                        Button(action: {
                            cartData.updateQuantity(for: item.id, quantity: item.quantity + 1)
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }
}

// 推荐商品卡片
struct RecommendedItemCard: View {
    let item: RecommendedItem
    @StateObject private var cartData = CartData.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // 商品图片
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 120, height: 80)
                
                Image(systemName: getImageIcon())
                    .font(.system(size: 30))
                    .foregroundColor(.brown)
            }
            
            // 商品信息
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(2)
                
                Text(item.englishName)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                HStack {
                    Text("¥\(String(format: "%.2f", item.price))")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                    
                    if let originalPrice = item.originalPrice {
                        Text("¥\(Int(originalPrice))")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .strikethrough()
                    }
                }
                
                Button(action: {
                    cartData.addRecommendedItem(item)
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
            }
        }
        .frame(width: 120)
        .padding(8)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
    }
    
    private func getImageIcon() -> String {
        if item.name.contains("沙拉") {
            return "leaf.fill"
        } else if item.name.contains("卷") {
            return "takeoutbag.and.cup.and.straw.fill"
        } else {
            return "fork.knife"
        }
    }
}

#Preview {
    CartView()
}
