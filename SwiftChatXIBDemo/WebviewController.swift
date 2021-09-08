//
//  WebviewController.swift
//  SwiftChatXIBDemo
//
//  Created by mac on 2021/9/8.
//  Copyright © 2021 高鑫. All rights reserved.
//

import UIKit
import WebKit
class WebviewController : UIViewController{
    
    @IBOutlet weak var web: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        web.load(URLRequest.init(url: URL.init(string: "http://ak.jyanke.com/mcollege/home")!))
        
    }
}
