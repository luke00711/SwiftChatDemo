//
//  ChatListViewController.swift
//  SwiftChatXIBDemo
//
//  Created by mac on 2021/9/8.
//  Copyright © 2021 高鑫. All rights reserved.
//

import UIKit
class ChatListViewController : UITableViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Conversation.convHis.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell==nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
            
        }
        let conv : Conversation = Conversation.convHis[indexPath.row]
        
        cell?.textLabel?.text = conv.name
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb :UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let vc : ViewController =  sb.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.hidesBottomBarWhenPushed=true
        vc.conv = Conversation.convHis[indexPath.row]
        self.navigationController?.pushViewController(vc , animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
