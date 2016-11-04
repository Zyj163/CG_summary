//
//  MyView.swift
//  叠加模式
//
//  Created by zhangyongjun on 16/5/27.
//  Copyright © 2016年 张永俊. All rights reserved.
//

import UIKit

class MyView: UIView {

    override func draw(_ rect: CGRect) {
        
        let rect  = CGRect(x: 0, y: 130.0, width: 320.0, height: 50.0)
        let rect1  = CGRect(x: 0, y: 390.0, width: 320.0, height: 50.0)
        
        
        let rect2 = CGRect(x: 20, y: 50.0, width: 10.0, height: 250.0)
        let rect3 = CGRect(x: 40.0, y: 50.0, width: 10.0, height: 250.0)
        let rect4 = CGRect(x: 60.0, y: 50.0, width: 10.0, height: 250.0)
        let rect5 = CGRect(x: 80.0, y: 50.0, width: 10.0, height: 250.0)
        let rect6 = CGRect(x: 100.0, y: 50.0, width: 10.0, height: 250.0)
        let rect7 = CGRect(x: 120.0, y: 50.0, width: 10.0, height: 250.0)
        let rect8 = CGRect(x: 140.0, y: 50.0, width: 10.0, height: 250.0)
        let rect9 = CGRect(x: 160.0, y: 50.0, width: 10.0, height: 250.0)
        let rect10 = CGRect(x: 180.0, y: 50.0, width: 10.0, height: 250.0)
        let rect11 = CGRect(x: 200.0, y: 50.0, width: 10.0, height: 250.0)
        let rect12 = CGRect(x: 220.0, y: 50.0, width: 10.0, height: 250.0)
        let rect13 = CGRect(x: 240.0, y: 50.0, width: 10.0, height: 250.0)
        let rect14 = CGRect(x: 260.0, y: 50.0, width: 10.0, height: 250.0)
        let rect15 = CGRect(x: 280.0, y: 50.0, width: 10.0, height: 250.0)
        
        let rect16 = CGRect(x: 30.0, y: 310.0, width: 10.0, height: 250.0)
        let rect17 = CGRect(x: 50.0, y: 310.0, width: 10.0, height: 250.0)
        let rect18 = CGRect(x: 70.0, y: 310.0, width: 10.0, height: 250.0)
        let rect19 = CGRect(x: 90.0, y: 310.0, width: 10.0, height: 250.0)
        let rect20 = CGRect(x: 110.0, y: 310.0, width: 10.0, height: 250.0)
        let rect21 = CGRect(x: 130.0, y: 310.0, width: 10.0, height: 250.0)
        let rect22 = CGRect(x: 150.0, y: 310.0, width: 10.0, height: 250.0)
        let rect23 = CGRect(x: 170.0, y: 310.0, width: 10.0, height: 250.0)
        let rect24 = CGRect(x: 190.0, y: 310.0, width: 10.0, height: 250.0)
        let rect25 = CGRect(x: 210.0, y: 310.0, width: 10.0, height: 250.0)
        let rect26 = CGRect(x: 230.0, y: 310.0, width: 10.0, height: 250.0)
        let rect27 = CGRect(x: 250.0, y: 310.0, width: 10.0, height: 250.0)
        let rect28 = CGRect(x: 270.0, y: 310.0, width: 10.0, height: 250.0)
        let rect29 = CGRect(x: 290.0, y: 310.0, width: 10.0, height: 250.0)
        
        UIColor.yellow.set()
        UIRectFill(rect)
        
        UIColor.green.setFill()
        UIRectFill(rect1)
        
        UIColor.red.setFill()
        
        UIRectFillUsingBlendMode(rect2, .clear)//清空颜色（黑色）
        UIRectFillUsingBlendMode(rect3, .color)//只有叠加部分显示，且颜色为混合后颜色
        UIRectFillUsingBlendMode(rect4, .colorBurn)
        UIRectFillUsingBlendMode(rect5, .colorDodge)
        UIRectFillUsingBlendMode(rect6, .copy)//正常显示
        UIRectFillUsingBlendMode(rect7, .darken)//正常显示
        UIRectFillUsingBlendMode(rect8, .destinationAtop)//不显示
        UIRectFillUsingBlendMode(rect9, .destinationIn)//不显示
        UIRectFillUsingBlendMode(rect10, .destinationOut)//清空颜色（黑色）
        UIRectFillUsingBlendMode(rect11, .destinationOver)//不显示
        UIRectFillUsingBlendMode(rect12, .difference)//正常显示，且叠加部分显示混合色
        UIRectFillUsingBlendMode(rect13, .exclusion)//正常显示，且叠加部分显示混合色
        UIRectFillUsingBlendMode(rect14, .hardLight)//正常显示
        UIRectFillUsingBlendMode(rect15, .hue)//只有叠加部分显示，且颜色为混合后颜色
        
        
        UIRectFillUsingBlendMode(rect16, .lighten)//只有叠加部分显示，且颜色为混合后颜色
        UIRectFillUsingBlendMode(rect17, .luminosity)
        UIRectFillUsingBlendMode(rect18, .multiply)//正常显示，但叠加部分颜色被清空
        UIRectFillUsingBlendMode(rect19, .normal)//正常显示
        UIRectFillUsingBlendMode(rect20, .overlay)//不显示
        UIRectFillUsingBlendMode(rect21, .plusDarker)//正常显示，但叠加部分颜色被清空
        UIRectFillUsingBlendMode(rect22, .plusLighter)//只有叠加部分显示，且颜色为混合后颜色
        UIRectFillUsingBlendMode(rect23, .saturation)//不显示
        UIRectFillUsingBlendMode(rect24, .screen)//只有叠加部分显示，且颜色为混合后颜色
        UIRectFillUsingBlendMode(rect25, .softLight)//不显示
        UIRectFillUsingBlendMode(rect26, .sourceAtop)//正常显示
        UIRectFillUsingBlendMode(rect27, .sourceIn)//正常显示
        UIRectFillUsingBlendMode(rect28, .sourceOut)//清空颜色（黑色）
        UIRectFillUsingBlendMode(rect29, .xor)//清空颜色（黑色）
    }
}
