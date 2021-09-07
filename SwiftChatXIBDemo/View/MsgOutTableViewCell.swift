//
//  MsgOutTableViewCell.swift
//  SwiftChatXIBDemo
//
//  Created by 高鑫 on 2017/11/14.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class MsgOutTableViewCell: UITableViewCell {

    @IBOutlet weak var outBubble: UIImageView!
    @IBOutlet weak var outLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        let capInsetsOut = UIEdgeInsets(top: 17, left: 17, bottom: 17, right: 35)
        let outImg = #imageLiteral(resourceName: "out").resizableImage(withCapInsets: capInsetsOut)
        outBubble.image = outImg
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
