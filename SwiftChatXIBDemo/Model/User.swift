//
//  User.swift
//  SwiftChatXIBDemo
//
//  Created by mac on 2021/9/8.
//  Copyright © 2021 高鑫. All rights reserved.
//

import Foundation
struct User{
    var name : String?
    var icon : String?
    
    //单例
    static let instance : User = User(name: "admin", icon: "admin")
}
