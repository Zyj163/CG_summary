//
//  ViewController.m
//  Quartz2D开始
//
//  Created by zhangyongjun on 15/12/24.
//  Copyright © 2015年 张永俊. All rights reserved.
//

#import "ViewController.h"
#import "CircleProgressView.h"
#import "SectorView.h"

@interface ViewController ()

@property (strong, nonatomic) CircleProgressView *progressView;
@property (strong, nonatomic) SectorView *sector;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _progressView = [CircleProgressView new];
    _progressView.frame = CGRectMake(0, 30, 100, 100);
    [self.view addSubview:_progressView];
    _progressView.progress = 0.7;
    
    
    _sector = [SectorView new];
    _sector.frame = CGRectMake(0, 150, self.view.frame.size.width, 100);
    [self.view addSubview:_sector];
    _sector.progresses = @[@0.2, @0.3,@0.4,@0.1];
    _sector.colors = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor yellowColor]];
}

@end
