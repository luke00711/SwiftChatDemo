//
//  Message.swift
//  SwiftChatXIBDemo
//
//  Created by 高鑫 on 2017/11/14.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import Foundation
import UIKit

enum MessageType{
    case messageSender,messageReceiver
}
enum ContentType{
    case textMessage,picMessage
}

struct Message {
    let isIn : Bool
    let date : NSDate
    let text : String
    var type:MessageType?
    var im : UIImage?
    var contentType:ContentType = .textMessage
    
    func getHeight()->CGFloat{
        switch contentType {
        case .picMessage:
            return 200
        default:
            
            return  textAutoHeight(width: 200, font: UIFont.systemFont(ofSize: 15))+35
        }
    }
  
    
    func getWidth()->CGFloat{
        switch contentType {
        case .picMessage:
            return 200
        default:
            
            return  textAutoWidth(width: 200, font: UIFont.systemFont(ofSize: 15))+35
            
        }
    }
    
    func textAutoHeight(width:CGFloat, font:UIFont) ->CGFloat{

      let string = text

      let origin = NSStringDrawingOptions.usesLineFragmentOrigin

 
     let rect = string.boundingRect(with:CGSize(width: width, height:999),options: origin, attributes: [NSAttributedString.Key.font:font], context:nil)
       return rect.height

    }

    func textAutoWidth(width:CGFloat, font:UIFont) ->CGFloat{

      let string = text

      let origin = NSStringDrawingOptions.usesLineFragmentOrigin

 
     let rect = string.boundingRect(with:CGSize(width: 999, height:999),options: origin, attributes: [NSAttributedString.Key.font:font], context:nil)
       return rect.width

    }

    
}

class Msg {
    static let msgs = [
        [Message(isIn: false, date: NSDate(timeIntervalSinceNow: -12*60*60*24), text: "你叫什么名字?",type: .messageReceiver,contentType: .picMessage),
         Message(isIn: true, date: NSDate(timeIntervalSinceNow: -12*60*60*24), text: "我叫Siri",type: .messageSender)
        ],
        [Message(isIn: false, date: NSDate(timeIntervalSinceNow: -6*60*60*24 - 200), text: "你今年多大？",type: .messageReceiver),
         Message(isIn: true, date: NSDate(timeIntervalSinceNow: -6*60*60*24 - 200), text: "我也不知道",type: .messageSender)
        ],
        [Message(isIn: false, date: NSDate(timeIntervalSinceNow: -6*60*60*24 - 200), text: "今天的足球新闻",type: .messageReceiver),
         Message(isIn: true, date: NSDate(timeIntervalSinceNow: -6*60*60*24 - 200), text: """
世界杯欧洲区预选赛附加赛比赛中，意大利被瑞典淘汰，无缘世界杯。赛后，布冯宣布退出国家队。德罗西、巴尔扎利随后也宣布退出。
布冯1978年1月28日出生，现年39岁。1995年效力于帕尔马，代表球队出战168场。2001年转会加盟尤文图斯，效力至今为球队出战491场。1997年布冯入选国家队，今晨他宣布退出国家队。
""",type: .messageReceiver)
        ],
        [Message(isIn: false, date: NSDate(timeIntervalSinceNow: -60), text: "你在干嘛？",type: .messageReceiver),
         Message(isIn: true, date: NSDate(timeIntervalSinceNow: -60), text: "我在跟你聊天呀,是不是傻asdasdasdasdad",type: .messageSender)
        ]
    ]
}
