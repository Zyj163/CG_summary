//
//  CircleProgressView.m
//  Quartz2D开始
//
//  Created by zhangyongjun on 15/12/24.
//  Copyright © 2015年 张永俊. All rights reserved.
//

#import "CircleProgressView.h"

@interface CircleProgressView ()

@property (weak, nonatomic) UILabel *progressLabel;

@end

@implementation CircleProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (UILabel *)progressLabel {
    if (!_progressLabel) {
        UILabel *progressLabel = [UILabel new];
        progressLabel.textColor = [UIColor blackColor];
        progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel = progressLabel;
        [self addSubview:progressLabel];
        progressLabel.center = CGPointMake(self.frame.size.width / 2 , self.frame.size.height / 2);
        progressLabel.bounds = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }
    return _progressLabel;
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    self.progressLabel.text = [NSString stringWithFormat:@"%.2f%%", progress * 100];

    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat r = MIN(rect.size.width, rect.size.height) * 0.5;
    CGFloat start = -M_PI_2;
    CGFloat end = -M_PI_2 + M_PI * 2 * self.progress;
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:r startAngle:start endAngle:end clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor greenColor] setFill];
    CGContextAddPath(ctx, path.CGPath);
//    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
//    CGContextDrawPath(ctx, kCGPathFillStroke);
}


@end
