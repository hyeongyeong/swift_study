//
//  MsgModel.swift
//  chat
//
//  Created by 현경 on 2021/06/05.
//

import SwiftUI
import FirebaseFirestoreSwift


struct MsgModel: Codable, Identifiable, Hashable {
    
    @DocumentID var id : String?
    var msg : String
    var user : String
    var timeStamp: Date
    
    enum CodingKeys: String, CodingKey{
        case id
        case msg
        case user
        case timeStamp
    }
}
