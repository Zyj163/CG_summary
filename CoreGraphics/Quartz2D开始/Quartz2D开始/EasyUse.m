//
//  EasyUse.m
//  Quartz2D开始
//
//  Created by zhangyongjun on 15/12/24.
//  Copyright © 2015年 张永俊. All rights reserved.
//

#import "EasyUse.h"

@implementation EasyUse

- (void)drawLine {
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设置绘图信息
    UIBezierPath *path = [UIBezierPath bezierPath];
    //起点
    [path moveToPoint:CGPointMake(10, 10)];
    //终点
    [path addLineToPoint:CGPointMake(125, 125)];
    //  继续拼接路线
    [path addLineToPoint:CGPointMake(240, 10)];
    //自动封口
    [path closePath];
    [[UIColor blueColor] setFill];
    [[UIColor redColor] setStroke];
    CGContextSetLineWidth(ctx, 5);
    //把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    //将上下文渲染到视图
//    CGContextStrokePath(ctx);
//    CGContextFillPath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);//即填充又描边
}

- (void)drawSeperateLine {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //第一条线
    [path moveToPoint:CGPointMake(10, 125)];
    [path addLineToPoint:CGPointMake(230, 125)];
    
    //第二条线
    //    [path moveToPoint:CGPointMake(10, 10)];
    //    [path addLineToPoint:CGPointMake(125, 100)];
    
    //用两个对象管理两条线，便于管理
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(10, 10)];
    [path2 addLineToPoint:CGPointMake(125, 100)];
    
    //通过上下文统一设置线条状态
    //设置线宽
    CGContextSetLineWidth(ctx, 10);
    //设置圆角
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //设置颜色（3种方式）
    //    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    //    [[UIColor redColor] setStroke];
    [[UIColor redColor] set];
    
    CGContextAddPath(ctx, path2.CGPath);
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}

- (void)drawQuadCurve {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPath];
    //先画一条直线
    [path moveToPoint:CGPointMake(10, 125)];
    //通过控制点造成曲线效果
    [path addQuadCurveToPoint:CGPointMake(240, 125) controlPoint:CGPointMake(125, 10)];
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}

- (void)drawShap {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //某个角圆角
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 100, 100) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(40, 40)];//cornerRadii代表用半径度量的圆形面积，这里相当于半径是20
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}

- (void)drawAndControlContext {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //要在添加到上下文之前对上下文进行操作
    CGContextTranslateCTM(ctx, 20, 10);//位移
    CGContextRotateCTM(ctx, M_PI_2);//旋转
    CGContextScaleCTM(ctx, 0.5, 0.8);//缩放
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 150)];
    CGContextAddPath(ctx, path.CGPath);
    [[UIColor redColor] set];
    CGContextFillPath(ctx);
}

/**
 *  在视图将要显示的时候才会调用 rect = self.bounds
 */
- (void)drawRect:(CGRect)rect {
//    [self drawLine]; //连续线条
//    [self drawSeperateLine]; //不连续线条
//    [self drawQuadCurve]; //曲线
//    [self drawshap]; //图形
//    [self drawAndControlContext];//操作上下文
    
//    CGContextSaveGState(ctx);//可以将某些设置好的上下文保存到栈中
//    CGContextRestoreGState(ctx);//恢复保存的上下文
}
































@end



