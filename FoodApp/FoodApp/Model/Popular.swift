//
//  Popular.swift
//  FoodApp
//
//  Created by 현경 on 2021/06/16.
//

import SwiftUI

struct Popular: Identifiable {
    
    var id = UUID().uuidString
    var title: String
    var description: String
    var image: String
    var price: String
}

var popular_Items = [

    Popular(title: "Beef Burger", description: "Cheesy Mozarella", image: "burger1", price: "6.59"),
    Popular(title: "Double Burger", description: "Double Beef", image: "burger2", price: "7.49")
]
