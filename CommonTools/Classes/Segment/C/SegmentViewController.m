//
//  SegmentViewController.m
//  CommonTools
//
//  Created by Celia on 2017/7/11.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "SegmentViewController.h"
#import "SegmentView.h"

@interface SegmentViewController ()

@end

@implementation SegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"segment control";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    SegmentView *segmentV = [[SegmentView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 64)];
    [self.view addSubview:segmentV];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
