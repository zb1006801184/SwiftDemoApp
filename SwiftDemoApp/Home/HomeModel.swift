import SwiftUI

// 首页数据模型
struct HomeModel {
    // 轮播图数据
    struct BannerItem {
        // 轮播图唯一标识符
        let id: Int
        // 轮播图主标题
        let title: String
        // 轮播图副标题
        let subtitle: String
        // 轮播图详细描述
        let description: String
        // 轮播图背景渐变色彩数组
        let colors: [Color]
    }

    // 功能菜单项数据
    struct MenuItem {
        // 菜单项唯一标识符
        let id: Int
        // 菜单项图标名称
        let icon: String
        // 菜单项标题
        let title: String
        // 菜单项副标题
        let subtitle: String
        // 菜单项背景颜色
        let backgroundColor: Color
        // 菜单项图标颜色
        let iconColor: Color
    }

    // 店铺信息数据
    struct StoreInfo {
        // 店铺名称
        let name: String
        // 店铺距离描述
        let distance: String
        // 是否选择自提模式
        let isPickupSelected: Bool
    }
}
