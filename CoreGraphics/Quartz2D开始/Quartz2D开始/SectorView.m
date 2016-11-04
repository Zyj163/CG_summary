//
//  SectorView.m
//  Quartz2D开始
//
//  Created by zhangyongjun on 15/12/25.
//  Copyright © 2015年 张永俊. All rights reserved.
//

#import "SectorView.h"

@implementation SectorView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat startA = 0;
    CGFloat endA = 0;
    for (NSInteger i = 0; i < self.progresses.count; i ++) {
        CGFloat r = MIN(rect.size.width, rect.size.height) / 2;
        startA = endA;
        endA = startA + [self.progresses[i] floatValue] * M_PI * 2;
        CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:r startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        CGContextAddPath(ctx, path.CGPath);
        [self.colors[i] setFill];
        CGContextFillPath(ctx);
    }
}


@end
