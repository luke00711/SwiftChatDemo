//
//  Conversation.swift
//  SwiftChatXIBDemo
//
//  Created by mac on 2021/9/8.
//  Copyright © 2021 高鑫. All rights reserved.
//

import Foundation
struct Conversation {
    var name : String?
    var convId : String?
    
    static let convHis :[Conversation] = [Conversation(name: "聊天记录1", convId: "123")]
}
