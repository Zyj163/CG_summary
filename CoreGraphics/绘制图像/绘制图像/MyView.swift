//
//  MyView.swift
//  绘制图像
//
//  Created by zhangyongjun on 16/5/27.
//  Copyright © 2016年 张永俊. All rights reserved.
//

import UIKit

class MyView: UIView {

    override func draw(_ rect: CGRect) {
//        drawImageByUIKit(UIGraphicsGetCurrentContext())
        drawImageByCG(UIGraphicsGetCurrentContext())
    }

    func drawImageByUIKit(_ ctx:CGContext?) {
        let image = UIImage.init(named: "20120426103956263")
        image?.draw(in: bounds)
        
//        image?.drawAtPoint(CGPointMake(10, 30))
//
//        image?.drawAsPatternInRect(bounds)
//
//        image?.drawInRect(bounds, blendMode: .Darken, alpha: 0.8)
//
//        image?.drawAtPoint(CGPointMake(10, 30), blendMode: .Darken, alpha: 0.8)
    }
    
    
    //在Core Graphics中坐标系的y轴正方向是向上的，坐标原点在屏幕左下角，y轴方向刚好和UIKit中y轴方向相反。
    func drawImageByCG(_ ctx:CGContext?) {
        let image = UIImage.init(named: "20120426103956263")
        
        //保存修改前的上下文
        ctx?.saveGState()
        
        //上下文变形
        ctx?.scaleBy(x: 1, y: -1)
        ctx?.translateBy(x: 0, y: -bounds.size.height)
        
        ctx?.draw((image?.cgImage)!, in: bounds)
        
        //恢复修改前的上下文
        ctx?.restoreGState()
    }
    
}






















