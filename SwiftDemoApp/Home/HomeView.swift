//
//  HomeView.swift
//  SwiftDemoApp
//
//  Created by 司成雷 on 2025/4/2.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var currentIndex = 0
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // 1. 轮播图
                    bannerView()

                    // 2. 店铺信息
                    storeInfoView()

                    // 3. 功能菜单
                    functionMenuView()

                    // 4. 推广横幅
                    promotionBannerView()

                    Spacer(minLength: 100)  // 底部留白，避免被TabBar遮挡
                }
            }
            .navigationBarHidden(true)
        }
    }

    // 轮播图
    func bannerView() -> some View {
        TabView(selection: $currentIndex) {
            ForEach(viewModel.banners, id: \.id) { banner in
                // 使用ViewModel中的轮播图数据
                LinearGradient(
                    colors: banner.colors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .overlay(
                    VStack {
                        Text(banner.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(banner.subtitle)
                            .font(.title3)
                            .foregroundColor(.white)
                        Text(banner.description)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.9))
                    }
                )
                .frame(height: 208)
                .cornerRadius(12)
                .padding(.horizontal, 16)
                .tag(banner.id - 1)  // 调整tag值以匹配数组索引
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 208)
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % viewModel.banners.count
            }
        }
    }

    // 店铺信息视图
    func storeInfoView() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.storeInfo.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                HStack {
                    Image(systemName: "location")
                        .foregroundColor(.gray)
                    Text(viewModel.storeInfo.distance)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            // 自提/外送选择
            HStack(spacing: 0) {
                Button(action: {
                    if !viewModel.isPickupSelected {
                        viewModel.togglePickupDelivery()
                    }
                }) {
                    Text("自提")
                        .font(.system(size: 14))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(viewModel.isPickupSelected ? Color.blue : Color.clear)
                        .foregroundColor(viewModel.isPickupSelected ? .white : .gray)
                }

                Button(action: {
                    if viewModel.isPickupSelected {
                        viewModel.togglePickupDelivery()
                    }
                }) {
                    Text("外送")
                        .font(.system(size: 14))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(!viewModel.isPickupSelected ? Color.blue : Color.clear)
                        .foregroundColor(!viewModel.isPickupSelected ? .white : .gray)
                }
            }
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .padding(.horizontal, 16)
        .padding(.top, 20)
    }

    // 功能菜单视图
    func functionMenuView() -> some View {
        VStack(spacing: 16) {
            ForEach(viewModel.menuItems, id: \.id) { item in
                menuItem(item: item)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 20)
    }

    // 菜单项组件
    func menuItem(item: HomeData.MenuItem) -> some View {
        Button(action: {
            viewModel.handleMenuItemTap(item)
        }) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)

                    Text(item.subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                Spacer()

                Image(systemName: item.icon)
                    .font(.title2)
                    .foregroundColor(item.iconColor)
                    .frame(width: 50, height: 50)
                    .background(item.backgroundColor)
                    .clipShape(Circle())
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
        }
        .buttonStyle(PlainButtonStyle())
    }

    // 推广横幅视图
    func promotionBannerView() -> some View {
        Button(action: {
            viewModel.handlePromotionTap()
        }) {
            HStack {
                // 左侧图标
                Circle()
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
                    .overlay(
                        Image(systemName: "cup.and.saucer.fill")
                            .foregroundColor(.white)
                    )

                VStack(alignment: .leading, spacing: 4) {
                    Text("免费送给好友咖啡")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)

                    Text("各自得一杯")
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                Spacer()

                // 右侧人物形象用渐变色圆形代替
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.blue, Color.purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 60, height: 60)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(
                LinearGradient(
                    colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.horizontal, 16)
        .padding(.top, 20)
    }
}

#Preview {
    HomeView()
}
