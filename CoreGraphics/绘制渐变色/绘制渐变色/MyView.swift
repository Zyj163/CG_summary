//
//  MyView.swift
//  绘制渐变色
//
//  Created by zhangyongjun on 16/5/27.
//  Copyright © 2016年 张永俊. All rights reserved.
//

/*
 Quartz 2D的渐变方式分为两种：
 
 a.线性渐变：渐变色以直线方式从开始位置逐渐向结束位置渐变
 
 b.径向渐变：以中心点为圆心从起始渐变色向四周辐射，直到终止渐变色
 
 在iOS中绘制渐变还需要注意一点就是指定颜色空间，所谓颜色空间就是不同颜色在不同的维度上取值最终组成一种颜色的过程。就拿RGB来说，如果将红色、绿色、蓝色看成是x、y、z轴坐标系，那么在三个坐标上分别取0~255范围内的不同值则可以组成各类颜色。当然，不同颜色空间的“坐标系”也是不同的（也就是说颜色表示的方式是不同的），常用的颜色空间除了RGB还有CMYK（印刷业常用这种颜色模式）、Gray。
 
 在使用Quartz 2D绘图时我们的颜色除了使用常规的方法（如何前面CGContextSetRGBFillColor(CGContextRef context, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)方法）设置RGB和透明度外，有时还会遇到颜色参数是一个数组情况。如使用颜色空间填充时用到的CGContextSetFillColor(CGContextRef context, const CGFloat *components)方法，这个时候components数组中具体是如何存储颜色就要根据颜色空间而定，如果颜色空间使用RGB则数组中的元素四个为一组，分别是red（红）、green（绿）、blue（蓝）、alpha（透明度）；如果使用CMYK颜色空间，那么数组中的元素五个为一组，分别是cyan（青）、magenta（洋红）、yellow（黄）、black（黑）、alpha（透明度）
 */

import UIKit

class MyView: UIView {

    override func draw(_ rect: CGRect) {
        drawLinearGradient(UIGraphicsGetCurrentContext())
//        drawRadialGradient(UIGraphicsGetCurrentContext())
    }

    //线性渐变
    func drawLinearGradient(_ ctx:CGContext?) {
        //选择颜色空间
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        //裁切处一块矩形用于显示，注意必须先裁切再调用渐变
        //CGContextClipToRect(context, CGRectMake(20, 50, 280, 300));
        //裁切还可以使用UIKit中对应的方法
        UIRectClip(CGRect(x: 20, y: 50, width: 280, height: 300));
        
        
        /*指定渐变色
         space:颜色空间
         components:颜色数组,注意由于指定了RGB颜色空间，那么四个数组元素表示一个颜色（red、green、blue、alpha），
         如果有三个颜色则这个数组有4*3个元素
         locations:颜色所在位置（范围0~1），这个数组的个数不小于components中存放颜色的个数
         count:渐变个数，等于locations的个数
         */
        let components : [CGFloat] = [248.0/255.0,86.0/255.0,86.0/255.0,1,
                              249.0/255.0,127.0/255.0,127.0/255.0,1,
                              1.0,1.0,1.0,1.0]
        let locations : [CGFloat] = [0.0, 0.3, 1.0]
        let gradient = CGGradient(colorSpace: colorSpace, colorComponents: components, locations: locations, count: 3)
        
        /*绘制线性渐变
         context:图形上下文
         gradient:渐变色
         startPoint:起始位置
         endPoint:终止位置
         options:绘制方式,kCGGradientDrawsBeforeStartLocation 开始位置之前就进行绘制，到结束位置之后不再绘制，
         kCGGradientDrawsAfterEndLocation开始位置之前不进行绘制，到结束点之后继续填充
         */
        ctx?.drawLinearGradient(gradient!, start: CGPoint.zero, end: CGPoint(x: bounds.size.width, y: bounds.size.height), options: .drawsBeforeStartLocation)
        
    }
    
    //径向渐变
    func drawRadialGradient(_ ctx:CGContext?) {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorSpace, colors: [UIColor.clear.cgColor, UIColor.green.cgColor, UIColor.red.cgColor] as CFArray, locations: [0.0, 0.3, 1.0])
        /*绘制径向渐变
         context:图形上下文
         gradient:渐变色
         startCenter:起始点位置
         startRadius:起始半径（通常为0，否则在此半径范围内容无任何填充）
         endCenter:终点位置（通常和起始点相同，否则会有偏移）
         endRadius:终点半径（也就是渐变的扩散长度）
         options:绘制方式,kCGGradientDrawsBeforeStartLocation 开始位置之前就进行绘制，但是到结束位置之后不再绘制，
         kCGGradientDrawsAfterEndLocation开始位置之前不进行绘制，但到结束点之后继续填充
         */
        ctx?.drawRadialGradient(gradient!, startCenter: CGPoint(x: 160, y: 284), startRadius: 20, endCenter: CGPoint(x: 165, y: 289), endRadius: 150, options: .drawsBeforeStartLocation)
    }
    
}


















