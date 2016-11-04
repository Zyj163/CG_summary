//
//  ViewController.swift
//  绘制到位图
//
//  Created by zhangyongjun on 16/5/27.
//  Copyright © 2016年 张永俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = drawImageAtImageContext()
        
        let imageView = UIImageView.init(image: image)
        imageView.frame = view.bounds
        
        view.addSubview(imageView)
    }

    func drawImageAtImageContext() -> UIImage {
        //获取一个位图上下文
        let size = view.bounds.size
        UIGraphicsBeginImageContext(size)
        
        let image = UIImage.init(named: "20120426103956263")
        image?.draw(in: view.bounds)//注意绘图的位置是相对于画布顶点而言，不是屏幕
        
        //添加水印
        let ctx = UIGraphicsGetCurrentContext()//获取位图上下文
        
        ctx?.move(to: CGPoint(x: 100, y: 178))
        ctx?.addLine(to: CGPoint(x: 270, y: 178))
        UIColor.red.setStroke()
        ctx?.setLineWidth(2)
        
        ctx?.drawPath(using: .stroke)
        
        let str : NSString = "水印"
        str.draw(in: CGRect(x: 100, y: 158, width: 100, height: 30), withAttributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName:UIColor.blue])
        
        //根据位图上下文获取图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        //关闭位图上下文
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }

}

