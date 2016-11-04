//
//  MyView.swift
//  按自定义样式填充
//
//  Created by zhangyongjun on 16/5/27.
//  Copyright © 2016年 张永俊. All rights reserved.
//

/*
 1.在使用填充模式时首先要构建一个符合CGPatternDrawPatternCallback签名的方法，这个方法专门用来创建“瓷砖”。注意：如果使用有颜色填充模式，需要设置填充色。例如我们定义一个方法drawTile绘制以下瓷砖（有颜色填充）
 
 2.接着需要指定一个填充的颜色空间，这个颜色空间跟前面绘制渐变的颜色空间不太一样，前面创建渐变使用的颜色空间是设备无关的，我们需要基于这个颜色空间创建一个颜色空间专门用于填充（注意对于有颜色填充创建填充颜色空间参数为NULL，不用基于设备无关的颜色空间创建）。
 
 3.然后我们就可以使用CGPatternCreate方法创建一个填充模式，创建填充模式时需要注意其中的参数，在代码中已经做了一一解释（这里注意对于有颜色填充模式isColored设置为true，否则为false）。
 
 4.最后调用CGContextSetFillPattern方法给图形上下文指定填充模式（这个时候注意最后一个参数，如果是有颜色填充模式最后一个参数为透明度alpa的地址，对于无颜色填充模式最后一个参数是当前填充颜色空间的颜色数组）。
 
 5.绘制图形，这里我们绘制一个矩形。
 */

import UIKit

let TILE_SIZE : CGFloat = 20.0

class MyView: UIView {
    
    var f : CGPatternDrawPatternCallback?
    
    override func draw(_ rect: CGRect) {
//        drawBackgroundWithColoredPattern(UIGraphicsGetCurrentContext())
        drawBackgroundWithPattern(UIGraphicsGetCurrentContext())
    }
    
    //有颜色填充模式
    func drawBackgroundWithColoredPattern(_ ctx:CGContext?) {
        //获取颜色空间
        //模式填充颜色空间,注意对于有颜色填充模式，这里传nil
        let colorSpace = CGColorSpace(patternBaseSpace: nil)
        //将填充色颜色空间设置为模式填充的颜色空间
        ctx?.setFillColorSpace(colorSpace!)
        
        //设置填充模式回调函数
        var callback = CGPatternCallbacks(version: 0, drawPattern:{(info, ctx) in
            //这部分是由CoreGraphics内部调用，不能使用其他framework
            //设置填充色
            ctx.setFillColor(red: 254.0/255.0, green: 52.0/255.0, blue: 90.0/255.0, alpha: 1)
            ctx.fill(CGRect(x: 0, y: 0, width: TILE_SIZE, height: TILE_SIZE))
            ctx.fill(CGRect(x: TILE_SIZE, y: TILE_SIZE, width: TILE_SIZE, height: TILE_SIZE))
            } , releaseInfo: nil)
        
        //创建样式
        /*填充模式
         info:传递给callback的参数
         bounds:瓷砖大小
         matrix:形变
         xStep:瓷砖横向间距
         yStep:瓷砖纵向间距
         tiling:贴砖的方法
         isClored:绘制的瓷砖是否已经指定了颜色(对于有颜色瓷砖此处指定位true)
         callbacks:回调函数
         */
        let pattern = CGPattern(info: nil, bounds: CGRect(x: 0, y: 0, width: 2*TILE_SIZE, height: 2*TILE_SIZE), matrix: CGAffineTransform.identity, xStep: 2*TILE_SIZE, yStep: 2*TILE_SIZE, tiling: .noDistortion, isColored: true, callbacks: &callback)
        
        //注意最后一个参数对于有颜色瓷砖指定为透明度的参数地址，对于无颜色瓷砖则指定当前颜色空间对应的颜色数组
        var alpha : CGFloat = 1.0
        ctx?.setFillPattern(pattern!, colorComponents: &alpha)
        
        UIRectFill(bounds)
    }
    
    //无颜色填充模式
    func drawBackgroundWithPattern(_ ctx:CGContext?) {
        
        let colorSpace = CGColorSpace(patternBaseSpace: CGColorSpaceCreateDeviceRGB())
        ctx?.setFillColorSpace(colorSpace!)
        
        var callback = CGPatternCallbacks.init(version: 0, drawPattern: { (_, ctx) in
            //这部分是由CoreGraphics内部调用，不能使用其他framework
            ctx.fill(CGRect(x: 0, y: 0, width: 20, height: 20))
            ctx.fill(CGRect(x: 20, y: 20, width: 20, height: 20))
            }, releaseInfo: nil)
        //创建样式
        let pattern = CGPattern(info: nil, bounds: CGRect(x: 0, y: 0, width: 2*TILE_SIZE, height: 2*TILE_SIZE), matrix: CGAffineTransform.identity, xStep: 2*TILE_SIZE, yStep: 2*TILE_SIZE, tiling: .noDistortion, isColored: false, callbacks: &callback)
        
        let components : [CGFloat] = [254.0/255.0,52.0/255.0,90.0/255.0,1.0]
        ctx?.setFillPattern(pattern!, colorComponents: components)
        
        UIRectFill(bounds)
    }

}














