//
//  ViewController.swift
//  SwiftChatXIBDemo
//
//  Created by 高鑫 on 2017/11/14.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {
    let w = UIScreen.main.bounds.size.width
    let h = UIScreen.main.bounds.size.height
    var msgs = Msg.msgs
    let formatter = DateFormatter()

    var conv : Conversation?{
        willSet{
            title=newValue?.name
            
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var botContraint: NSLayoutConstraint!
    @IBOutlet weak var sendView: UIView!
    @IBOutlet weak var sendTextView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    @IBOutlet weak var sendBotCt: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
//        msgs.append("1")
        initView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func initView(){
        
        tableView.backgroundColor = UIColor.groupTableViewBackground
      
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 44
    //    tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        let timeNib = UINib(nibName: "MsgTimeTableViewCell", bundle: nil)
        let outNib = UINib(nibName: "MsgOutTableViewCell", bundle: nil)
        let inNib = UINib(nibName: "MsgInTableViewCell", bundle: nil)
        tableView.register(timeNib, forCellReuseIdentifier: "timeCell")
        tableView.register(outNib, forCellReuseIdentifier: "outCell")
        tableView.register(inNib, forCellReuseIdentifier: "inCell")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKB(tapGesture:)))
        tableView.addGestureRecognizer(tapGesture)
   // self.view.addSubview(tableView)
        sendTextView.layer.cornerRadius = 7.5
        NotificationCenter.default.addObserver(self, selector: #selector(keybordShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keybordHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    @IBAction func sendPic(_ sender: Any) {
        
        let picker = UIImagePickerController()
               //设置代理
               picker.delegate = self
               //指定图片控制器类型
               picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
               //设置是否允许编辑
//               picker.allowsEditing = editSwitch.isOn
               //弹出控制器，显示界面
               self.present(picker, animated: true, completion: {
                   () -> Void in
               })
        
    }
    @IBAction func sendMessage(_ sender: Any) {
        
     
        let message=Message(isIn: false, date: NSDate(timeIntervalSinceNow: -12*60*60*24), text: sendTextView.text,type: .messageSender)
        msgs.append([message])
  
    
        sendTextView.text=""
        self.view.endEditing(true)
        
        tableView.reloadData()
        
         scrollToBottom()
        
   
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func hideKB(tapGesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func keybordShow(notification:Notification)  {
        let userinfo: NSDictionary = notification.userInfo! as NSDictionary
        let nsValue = userinfo.object(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRec = nsValue.cgRectValue
        let height = keyboardRec.size.height
      
      
        sendBotCt.constant = height

       
        scrollToBottom()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
       
        switch indexPath.row {
        case 0:
            return 40
        default:
            return  msgs[indexPath.section][indexPath.row-1].getHeight()
        }
    }
    @objc func keybordHide(notification:Notification)  {

        sendBotCt.constant = 0
        scrollToBottom()
      
    }
    func scrollToBottom(){
        DispatchQueue.main.async {[weak self  ] in
            
            let index = NSIndexPath.init(row: 1, section: (self?.msgs.count)!-1)
            self?.tableView.scrollToRow(at: index as IndexPath, at: .bottom, animated: false)
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return msgs.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msgs[section].count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let timeCell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! MsgTimeTableViewCell
            formatter.dateFormat = "MM月dd日 EEEE HH:mm"
            formatter.locale = Locale(identifier: "zh_CN")
            timeCell.timeLabel.text = formatter.string(from: msgs[indexPath.section][0].date as Date)
            return timeCell
        } else {
            let msg = msgs[indexPath.section][indexPath.row - 1]
            if msg.type == .messageReceiver {
                let inCell = tableView.dequeueReusableCell(withIdentifier: "inCell", for: indexPath) as! MsgInTableViewCell
                inCell.msg=msg
                inCell.inLabel.text = msg.text
                return inCell
            } else {
                let outCell = tableView.dequeueReusableCell(withIdentifier: "outCell", for: indexPath) as! MsgOutTableViewCell
                outCell.outLabel.text = msg.text
                return outCell
            }
        }
    }
   
    
    
}

extension ViewController :UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image:UIImage!=info[UIImagePickerControllerOriginalImage] as! UIImage
       
        var message = Message(isIn: false, date: NSDate(timeIntervalSinceNow: -12*60*60*24), text: sendTextView.text,type: .messageReceiver)
        message.contentType = .picMessage
     
        message.im = image
        
        msgs.append([message])
        tableView.reloadData()
        
         scrollToBottom()
        
        picker.dismiss(animated: true, completion:nil)
    }
}
