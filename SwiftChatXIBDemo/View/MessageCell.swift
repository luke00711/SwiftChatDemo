//
//  MessageCell.swift
//  SwiftChatXIBDemo
//
//  Created by mac on 2021/9/8.
//  Copyright © 2021 高鑫. All rights reserved.
//

import UIKit
class MessageCell : UITableViewCell{
    let content : MessageContent = MessageContent.init(frame: CGRect.zero)
   
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.addSubview(content)
       // self.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var msg : Message?{
        
        willSet{
            content.mg=newValue

         }
      
    }
   
}

