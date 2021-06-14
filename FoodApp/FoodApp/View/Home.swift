//
//  Home.swift
//  FoodApp
//
//  Created by 현경 on 2021/06/14.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            HStack{
                Button(action: {}, label: {
                    Image(systemName: "circle.grid.2x2")
                        .font(.title2)
                        .padding(10)
                        .background(Color("pink").opacity(0.12))
                        .foregroundColor(Color("pink"))
                        .cornerRadius(8)
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:30, height: 30)
                        .padding(10)
                        .background(Color.black.opacity(0.08))
                        .foregroundColor(Color("pink"))
                        .cornerRadius(8)
                })
            }
            .overlay(
                HStack(spacing: 4){
                    Image("mapmarker")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width:18, height: 18)
                        .foregroundColor(Color("pink"))
                    Text("California, US")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            )
            .padding()
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
