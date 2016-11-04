//
//  MyView.swift
//  绘制文字
//
//  Created by zhangyongjun on 16/5/27.
//  Copyright © 2016年 张永俊. All rights reserved.
//

import UIKit

class MyView: UIView {

    override func draw(_ rect: CGRect) {
        let str : NSString = "Star Walk is the most beautiful stargazing app you’ve ever seen on a mobile device. It will become your go-to interactive astro guide to the night sky, following your every movement in real-time and allowing you to explore over 200, 000 celestial bodies with extensive information about stars and constellations that you find."
        
        let style = NSMutableParagraphStyle()
        style.alignment = .left
        style.firstLineHeadIndent = 36
        
        let attributes = [NSFontAttributeName : UIFont.systemFont(ofSize: 18), NSForegroundColorAttributeName : UIColor.red, NSParagraphStyleAttributeName : style]
        
        str.draw(in: CGRect(x: 20, y: 50, width: 280, height: 280), withAttributes: attributes)
    }

}
