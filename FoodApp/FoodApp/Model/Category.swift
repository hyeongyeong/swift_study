//
//  Category.swift
//  FoodApp
//
//  Created by 현경 on 2021/06/16.
//

import SwiftUI

struct Category: Identifiable {
    
    var id: String = UUID().uuidString
    var image: String
    var title: String
}

var categories = [
    Category(image: "hamburger", title: "Burger"),
    Category(image: "pizza", title: "Pizza"),
    Category(image: "sandwich", title: "Sandwich"),
    Category(image: "cupcake", title: "Cupcake's")
]
