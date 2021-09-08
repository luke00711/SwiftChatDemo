//
//  MessageContent.swift
//  SwiftChatXIBDemo
//
//  Created by mac on 2021/9/8.
//  Copyright © 2021 高鑫. All rights reserved.
//

import UIKit
class MessageContent : UIView{
    let w = UIScreen.main.bounds.size.width
    let userIconWidth : CGFloat = 45
    
    lazy var bubble : UIImageView = {
        let lb : UIImageView = UIImageView.init(frame: CGRect.zero)
     
        return lb
    }()
    
    lazy var label : UILabel = {
        let lb : UILabel = UILabel.init(frame: CGRect.zero)
        lb.numberOfLines = 0
     
        lb.lineBreakMode = .byCharWrapping
        lb.isHidden = true
        return lb
    }()
    
    lazy var im : UIImageView = {
        let lb : UIImageView = UIImageView.init(frame: CGRect.zero)
        
        lb.isHidden = true
        return lb
    }()
    
    lazy var userIcon : UIImageView = {
        let lb : UIImageView = UIImageView.init(frame: CGRect.zero)
        lb.backgroundColor = .red
      
        return lb
    }()
    
    
    var mg : Message? {
        willSet{
             switch newValue?.type {
                
                case .messageReceiver:do {
                    self.frame=CGRect.init(x:0, y: 0, width: (newValue?.getWidth())!+10+userIconWidth, height: (newValue?.getHeight())!-10)
                 
                    bubble.frame=CGRect.init(x: userIconWidth+10, y: 10, width: self.frame.size.width, height: self.frame.size.height)
                    
                    userIcon.frame=CGRect.init(x: 5, y: 0, width: userIconWidth, height: userIconWidth)
                   
                    
                    if let ic = Conversation.respConversation?.receiver?.icon {
                        userIcon.image=UIImage.init(named: ic)
                        userIcon.setCornerImage()
                    }
                   
                    let capInsetsIn = UIEdgeInsets(top: 17, left: 35, bottom: 17, right: 17)
                    let inImg = UIImage.init(named: "in")!.resizableImage(withCapInsets: capInsetsIn)
                    
                    bubble.image=inImg
                    
                    label.frame=CGRect.init(x: 10, y: 5, width: (newValue?.getWidth())!, height: (newValue?.getHeight())!)
                    
                    
                 }
                break
                case .messageSender:do{
                    self.frame=CGRect.init(x: w-(newValue?.getWidth())!-10-userIconWidth, y: 0, width: (newValue?.getWidth())!+10+userIconWidth, height: (newValue?.getHeight())!-10)
                    
                    bubble.frame=CGRect.init(x: 0, y: 10, width: self.frame.size.width-userIconWidth-10, height: self.frame.size.height)
                   
                    userIcon.frame=CGRect.init(x: self.frame.size.width-userIconWidth-5, y: 0, width: userIconWidth, height: userIconWidth)
                    
                    if let ic =  User.instance.icon {
                        userIcon.image=UIImage.init(named: ic)
                        userIcon.setCornerImage()
                    }
                 
                    
                    let capInsetsIn = UIEdgeInsets(top: 17, left: 17, bottom: 17, right:35)
                    let inImg = UIImage.init(named: "out")!.resizableImage(withCapInsets: capInsetsIn)
                    
                    bubble.image=inImg
                    label.frame=CGRect.init(x: 5, y:0, width: (newValue?.getWidth())!, height: (newValue?.getHeight())!)
                }
               
             case .none:
                print("")
             }
            
         
            switch newValue?.contentType {
               
               case .textMessage:do {
                
                label.isHidden=false
                im.isHidden=true
                label.text = newValue?.text
                
                }
               break
               case .picMessage:do{
                   label.isHidden=true
                   im.isHidden=false
                   im.image=newValue?.im ?? UIImage.init(named: "im")
               }
              
            case .none:
               print("")
            }
            
        }
    }
    
    private func initView(){
        
        self.addSubview(bubble)
        self.addSubview(userIcon)
//        bubble.makeCons{(maker) in
//            maker.edge.equal(self as Any)
//
//        }
        
        bubble.addSubview(label)
        label.makeCons{(maker) in

            maker.left.equal(bubble).offset(15)
            maker.right.equal(bubble).offset(-15)
            maker.top.equal(bubble).offset(10)
            maker.bottom.equal(bubble).offset(-10)
           
        }
        
        bubble.addSubview(im)
        im.makeCons{(maker) in

            maker.left.equal(bubble).offset(15)
            maker.right.equal(bubble).offset(-15)
            maker.top.equal(bubble).offset(10)
            maker.bottom.equal(bubble).offset(-10)
            
        }
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapView))
        self.addGestureRecognizer(tap)
    }
    
    @objc func tapView(){
        
        let notificationName = Notification.Name(rawValue: "DownloadImageNotification")
        NotificationCenter.default.post(name: notificationName, object: mg)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .red
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
