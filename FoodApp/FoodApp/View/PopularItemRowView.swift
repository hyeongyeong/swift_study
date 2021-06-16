//
//  PopularItemRowView.swift
//  FoodApp
//
//  Created by 현경 on 2021/06/16.
//

import SwiftUI

struct PopularItemRowView: View {
    var item: Popular
    var body: some View {
        
        VStack(spacing: 15){
            
            Image(systemName: "flame")
                .font(.footnote)
                .foregroundColor(.red)
                .padding(8)
                .background(Color.orange.opacity(0.1))
                .clipShape(Circle())
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(-10)
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getRect().width / 3)
            
            Text(item.title)
                .fontWeight(.bold)
            
            Text(item.description)
                .font(.footnote)
                .foregroundColor(.gray)
            
            (
                Text("$ ")
                    .font(.footnote)
                    .foregroundColor(Color("pink"))
                +
                    Text(item.price)
                    .font(.title2)
                    .foregroundColor(.black)
            )
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal, 30)
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
        
    }
}


struct PopularItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

