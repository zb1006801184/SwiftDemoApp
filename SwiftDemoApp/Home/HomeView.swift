//
//  HomeView.swift
//  SwiftDemoApp
//
//  Created by 司成雷 on 2025/4/2.
//

import SwiftUI

struct HomeView: View {
    @State private var currentIndex = 0
     private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ScrollView(content: {
            VStack() {
                bannerView()
            }
        })
        
        
      
    }
    
    //轮播图
    func bannerView() -> some View {
        let imageNames = ["home_banner_1", "home_banner_2", "home_banner_3"]
        let images = imageNames.map { Image($0) }
        return TabView(selection: $currentIndex) {
            ForEach(images.indices, id: \.self) { index in
                images[index]
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .infinity, height: 208)
                    .clipped()
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 208)
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % images.count
            }
        }
    }
    
    
}

#Preview {
    HomeView()
}
