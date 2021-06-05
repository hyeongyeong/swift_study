//
//  ChatBubble.swift
//  chat
//
//  Created by 현경 on 2021/06/06.
//

import SwiftUI

struct ChatBubble: Shape {
    
    var myMsg : Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight,myMsg ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 15, height: 15))
        
        return Path(path.cgPath)
    }
}
