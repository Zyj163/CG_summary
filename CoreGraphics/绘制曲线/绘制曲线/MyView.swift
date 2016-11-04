//
//  MyView.swift
//  绘制曲线
//
//  Created by zhangyongjun on 16/5/27.
//  Copyright © 2016年 张永俊. All rights reserved.
//

import UIKit

class MyView: UIView {

    override func draw(_ rect: CGRect) {
        drawCurve(UIGraphicsGetCurrentContext())
    }
    
    func drawCurve(_ ctx:CGContext?) {
        ctx?.move(to: CGPoint(x: 20, y: 100))
        //二次贝塞尔曲线
        ctx?.addQuadCurve(to: CGPoint(x: 160, y: 0), control: CGPoint(x: 300, y: 100))
        
        ctx?.move(to: CGPoint(x: 20, y: 500));
        //三次贝塞尔曲线
        ctx?.addCurve(to: CGPoint(x: 80, y: 300), control1: CGPoint(x: 240, y: 500), control2: CGPoint(x: 300, y: 300))
        
        UIColor.yellow.setFill()
        UIColor.red.setStroke()
        ctx?.drawPath(using: .fillStroke)
    }

}
