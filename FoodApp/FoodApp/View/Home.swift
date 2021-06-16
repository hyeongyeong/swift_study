//
//  Home.swift
//  FoodApp
//
//  Created by 현경 on 2021/06/14.
//

import SwiftUI

struct Home: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var selectedCategory : Category = categories.first!
    @State var selectedTab: String = "home"
    var body: some View {
        VStack(spacing: 0){
            TabView{
                LandingPage(selectedCategory: $selectedCategory)
                    .tag("home")
                
                Color.pink
                    .tag("heart")
                
                Color.yellow
                    .tag("bell")
                
                Color.red
                    .tag("cart")
            }
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
