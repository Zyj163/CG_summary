//
//  MyView.swift
//  基础
//
//  Created by zhangyongjun on 16/5/27.
//  Copyright © 2016年 张永俊. All rights reserved.
//

import UIKit

class MyView: UIView {

    override func draw(_ rect: CGRect) {
        //上下文
        let ctx = UIGraphicsGetCurrentContext()
        
        //创建路径
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 20, y: 50))
        path.addLine(to: CGPoint(x: 20, y: 100))
        path.addLine(to: CGPoint(x: 300, y: 100))
//        CGPathCloseSubpath(path)
        
        //添加路径到上下文
        ctx?.addPath(path)
        
        ctx?.closePath()
        
        //设置上下文状态属性
        ctx?.setStrokeColor(red: 1, green: 0, blue: 0, alpha: 1)
        ctx?.setFillColor(red: 0, green: 1, blue: 0, alpha: 1)
        ctx?.setLineWidth(2)
        ctx?.setLineCap(.round)//设置顶点样式,（20,50）和（300,100）是顶点
        ctx?.setLineJoin(.round)//设置连接点样式，(20,100)是连接点
        
        /*
         设置线段样式
         phase：虚线开始的位置
         lengths：虚线长度间隔（例如下面的定义说明第一条线段长度8，然后间隔3重新绘制8点的长度线段，当然这个数组可以定义更多元素）
         count：虚线数组元素个数
         */
        let lengths : [CGFloat] = [18.0, 9.0]
        ctx?.setLineDash(phase: 0, lengths: lengths)
        
        /*
         设置阴影
         offset：偏移量
         blur：模糊度
         color：阴影颜色
         */
        let color = UIColor.blue.cgColor
        ctx?.setShadow(offset: CGSize(width: 2, height: 2), blur: 0.8, color: color)
        
        //绘制图像到指定图形上下文
        /*CGPathDrawingMode是填充方式,枚举类型
         kCGPathFill:只有填充（非零缠绕数填充），不绘制边框
         kCGPathEOFill:奇偶规则填充（多条路径交叉时，奇数交叉填充，偶交叉不填充）
         kCGPathStroke:只有边框
         kCGPathFillStroke：既有边框又有填充
         kCGPathEOFillStroke：奇偶填充并绘制边框
         */
        ctx?.drawPath(using: .fillStroke)
        
    }

}
