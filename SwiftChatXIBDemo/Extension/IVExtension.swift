//
//  File.swift
//  SwiftChatXIBDemo
//
//  Created by mac on 2021/9/8.
//  Copyright © 2021 高鑫. All rights reserved.
//

import UIKit
extension UIImageView{
    
    func setCornerImage(){
     //   self.clipsToBounds = true
        //异步绘制图像
      DispatchQueue.main.async(execute: {
            //1.建立上下文
        
         UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)

            //获取当前上下文
            let ctx = UIGraphicsGetCurrentContext()
            
            //设置填充颜色
           UIColor.init(red: 245/255.0, green:  245/255.0, blue:  245/255.0, alpha: 1).setFill()
        
            UIRectFill(self.bounds)
            
            //2.添加圆及裁切
            ctx?.addEllipse(in: self.bounds)
            //裁切
            ctx?.clip()
            
            //3.绘制图像
            self.draw(self.bounds)
            
            //4.获取绘制的图像
            let image = UIGraphicsGetImageFromCurrentImageContext()
            
            //5关闭上下文
            UIGraphicsEndImageContext()
            
            DispatchQueue.main.async(execute: {
                self.image = image
            })
        })
    }
    


}
