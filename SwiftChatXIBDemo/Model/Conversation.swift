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
    var receiver : User?
    static let convHis :[Conversation] = [
        
        Conversation(name: "聊天记录1", convId: "123",receiver: User(name: "luke", icon: "1")),
        Conversation(name: "聊天记录2", convId: "123",receiver: User(name: "迪丽热巴", icon: "2")),
        Conversation(name: "聊天记录3", convId: "123",receiver: User(name: "黄明昊", icon: "3")),
        Conversation(name: "聊天记录4", convId: "123",receiver: User(name: "道明寺", icon: "4")),
        Conversation(name: "聊天记录5", convId: "123",receiver: User(name: "刘德华", icon: "5")),
        Conversation(name: "聊天记录6", convId: "123",receiver: User(name: "周润发", icon: "6")),
        Conversation(name: "聊天记录7", convId: "123",receiver: User(name: "花泽类", icon: "7"))
      ,Conversation(name: "聊天记录8", convId: "123",receiver: User(name: "赌神", icon: "8"))
     ,Conversation(name: "聊天记录9", convId: "123",receiver: User(name: "茜茜", icon: "9")),
    Conversation(name: "聊天记录10", convId: "123",receiver: User(name: "李四", icon: "10"))
    ]
    
    static var respConversation: Conversation?
}
