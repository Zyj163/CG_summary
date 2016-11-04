//
//  MyView.swift
//  绘制图形
//
//  Created by zhangyongjun on 16/5/27.
//  Copyright © 2016年 张永俊. All rights reserved.
//

import UIKit

class MyView: UIView {

    override func draw(_ rect: CGRect) {
//        drawRectWithCG(UIGraphicsGetCurrentContext())
//        drawEllispe(UIGraphicsGetCurrentContext())
//        drawArc(UIGraphicsGetCurrentContext())
        
        drawWithUIBezierPath(UIGraphicsGetCurrentContext())
        
        drawWithCGPath(UIGraphicsGetCurrentContext())
    }
    
    //矩形
    func drawRectWithCG(_ ctx:CGContext?) {
        let rect = CGRect(x: 20, y: 50, width: 280, height: 50)
        ctx?.addRect(rect)
        ctx?.addArc(center: CGPoint(x: 100, y: 80), radius: 20, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: false)
        ctx?.setFillColor(UIColor.green.cgColor)
        ctx?.setStrokeColor(UIColor.red.cgColor)
//        CGContextDrawPath(ctx, .FillStroke)
        ctx?.fillPath(using: .evenOdd)
    }
    
    //矩形
    func drawRectWithUIKit(_ ctx:CGContext?) {
        let rect1 = CGRect(x: 20, y: 150, width: 280, height: 50)
        let rect2 = CGRect(x: 20, y: 250, width: 280, height: 50)
        let rect3 = CGRect(x: 20, y: 350, width: 280, height: 50)
        let rect4 = CGRect(x: 20, y: 450, width: 280, height: 50)
        //        let rect5 = CGRectMake(20, 550, 280, 50)
        //        let rect6 = CGRectMake(20, 650, 280, 50)
        
        UIColor.yellow.set()//同时设置fill和stroke
        UIRectFill(rect1)
        UIRectFrame(rect2)
        
        UIColor.blue.setFill()
        UIRectFill(rect3)
        
        UIColor.red.setStroke()
        UIRectFrame(rect4)
        
        //        UIColor.purpleColor().setFill()
        //        UIRectFillUsingBlendMode(rect5, .SourceOut)
        //
        //        UIColor.cyanColor().setStroke()
        //        UIRectFrameUsingBlendMode(rect6, .Color)
    }
    
    //椭圆/圆
    func drawEllispe(_ ctx:CGContext?) {
        let rect = CGRect(x: 50, y: 120, width: 300, height: 200)
        ctx?.addEllipse(in: rect)
        UIColor.cyan.set()
        ctx?.drawPath(using: .fillStroke)
    }
    
    //弧形/圆
    func drawArc(_ ctx:CGContext?) {
        ctx?.addArc(center: CGPoint(x: 200, y: 450), radius: 100, startAngle: 0, endAngle: CGFloat.pi * 0.5, clockwise: true)//1代表顺时针，0为逆时针
        UIColor.yellow.set()
        ctx?.drawPath(using: .fillStroke)
    }
    
    func drawWithUIBezierPath(_ ctx:CGContext?) {
        let path = UIBezierPath(rect: CGRect(x: 100, y: 100, width: 200, height: 100))
//        let subPath = UIBezierPath(arcCenter: CGPointMake(150, 150), radius: 50, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: false)
        let subPath2 = UIBezierPath(rect: CGRect(x: 150, y: 100, width: 50, height: 50))
        
//        path.appendPath(subPath)
        path.append(subPath2)
        
        path.usesEvenOddFillRule = true
        
        UIColor.red.setFill()
        path.fill()
    }
    
    func drawWithCGPath(_ ctx:CGContext?) {
        let cgpath = CGMutablePath()
        cgpath.addRect(CGRect(x: 100, y: 250, width: 200, height: 100))
        
        cgpath.addRect(CGRect(x: 150, y: 250, width: 100, height: 100))
        
        ctx?.addPath(cgpath)
        ctx?.setFillColor(UIColor.red.cgColor)
        ctx?.fillPath(using: .evenOdd)
    }

}













