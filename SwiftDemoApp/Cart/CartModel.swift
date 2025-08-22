//
//  CartModel.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2025/8/22.
//

import Foundation

// 购物车商品项
struct CartItem: Identifiable {
    let id = UUID()
    let name: String
    let englishName: String?
    let description: String
    let price: Double
    let originalPrice: Double?
    let imageName: String
    var quantity: Int
    let discount: String?
    let isSelected: Bool
}

// 推荐商品
struct RecommendedItem: Identifiable {
    let id = UUID()
    let name: String
    let englishName: String
    let price: Double
    let originalPrice: Double?
    let imageName: String
}

// 购物车数据管理
class CartData: ObservableObject {
    static let shared = CartData()
    
    @Published var cartItems: [CartItem] = [
        CartItem(
            name: "标准美式",
            englishName: nil,
            description: "大/单份奶/单份糖/热\n仅限打包带走",
            price: 21,
            originalPrice: nil,
            imageName: "coffee_americano",
            quantity: 1,
            discount: "充2赠1",
            isSelected: true
        )
    ]
    
    @Published var recommendedItems: [RecommendedItem] = [
        RecommendedItem(
            name: "金枪鱼谷物沙拉",
            englishName: "Tuna and Mixed Gr...",
            price: 25.08,
            originalPrice: 38,
            imageName: "food_salad_tuna"
        ),
        RecommendedItem(
            name: "意大利烤鸡卷(单卷)",
            englishName: "Italian Roasted Chi...",
            price: 8.58,
            originalPrice: 13,
            imageName: "food_wrap"
        ),
        RecommendedItem(
            name: "经典牛肉土豆泥沙拉",
            englishName: "Beef and Mashed p...",
            price: 25.08,
            originalPrice: 38,
            imageName: "food_salad_beef"
        )
    ]
    
    private init() {}
    
    // 计算总价
    var totalPrice: Double {
        cartItems.filter { $0.isSelected }.reduce(0) { total, item in
            total + (item.price * Double(item.quantity))
        }
    }
    
    // 更新商品数量
    func updateQuantity(for itemId: UUID, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.id == itemId }) {
            if quantity > 0 {
                cartItems[index] = CartItem(
                    name: cartItems[index].name,
                    englishName: cartItems[index].englishName,
                    description: cartItems[index].description,
                    price: cartItems[index].price,
                    originalPrice: cartItems[index].originalPrice,
                    imageName: cartItems[index].imageName,
                    quantity: quantity,
                    discount: cartItems[index].discount,
                    isSelected: cartItems[index].isSelected
                )
            } else {
                cartItems.remove(at: index)
            }
        }
    }
    
    // 添加推荐商品到购物车
    func addRecommendedItem(_ item: RecommendedItem) {
        let cartItem = CartItem(
            name: item.name,
            englishName: item.englishName,
            description: "默认规格",
            price: item.price,
            originalPrice: item.originalPrice,
            imageName: item.imageName,
            quantity: 1,
            discount: nil,
            isSelected: true
        )
        cartItems.append(cartItem)
    }
}
