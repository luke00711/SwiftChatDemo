//
//  MsgInTableViewCell.swift
//  SwiftChatXIBDemo
//
//  Created by 高鑫 on 2017/11/14.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class MsgInTableViewCell: UITableViewCell {
    @IBOutlet weak var inBubble: UIImageView!
  
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var inLabel: UILabel!
    var msg:Message?=nil{
        willSet{
            
         
            if newValue?.contentType == .picMessage{
                if newValue?.im == nil {
                    iv.image=UIImage.init(named: "im")
                }else{
                    iv.image=newValue?.im
                }
               
                inLabel.isHidden=true
                
                iv.isHidden=false
                
            }else{
                iv.isHidden=true
                inLabel.isHidden=false
                inLabel.text=newValue?.text
        
            }
    
          
        }
        
    }
    
  //  var iv:UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        let capInsetsIn = UIEdgeInsets(top: 17, left: 35, bottom: 17, right: 17)
        let inImg = #imageLiteral(resourceName: "in").resizableImage(withCapInsets: capInsetsIn)
        inBubble.image = inImg
      

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
