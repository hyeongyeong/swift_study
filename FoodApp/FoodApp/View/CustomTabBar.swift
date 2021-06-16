//
//  CustomTabBar.swift
//  FoodApp
//
//  Created by 현경 on 2021/06/17.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: String
    @Namespace var animation
    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(animation: animation, image: "home", selectedTab: $selectedTab)
            TabBarButton(animation: animation, image: "heart", selectedTab: $selectedTab)
            Button(action: {}, label: {
                Image("search")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color("pink"))
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
                
                
            })
            .offset(y: -38)
            
            TabBarButton(animation: animation, image: "bell", selectedTab: $selectedTab)
            TabBarButton(animation: animation, image: "cart", selectedTab: $selectedTab)
        }
        .padding(.top)
        .padding(.vertical, -10)
        .padding(.bottom, getSafeArea().bottom == 0 ? 15: getSafeArea().bottom )
        .background(Color.white)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func getSafeArea()->UIEdgeInsets{
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

struct TabBarButton: View {
    var animation: Namespace.ID
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()){
                selectedTab = image}
        }, label: {
            VStack(spacing: 6) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundColor(selectedTab == image ? Color("pink") : Color.gray.opacity(0.4))
                
                if selectedTab == image{
                    Circle()
                        .fill(Color("pink"))
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .frame(width: 8, height: 8)
                }
                
            }
            .frame(maxWidth: .infinity)
            
        })
    }
}
