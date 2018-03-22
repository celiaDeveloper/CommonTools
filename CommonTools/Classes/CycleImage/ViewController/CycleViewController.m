//
//  CycleViewController.m
//  CommonTools
//
//  Created by Celia on 2017/6/28.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "CycleViewController.h"
#import "CycleView.h"

@interface CycleViewController ()

@end

@implementation CycleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"图片轮播";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    CycleView *cycleV = [[CycleView alloc] initWithFrame:self.view.bounds];
    cycleV.imagesURLStrings = @[@"http://pic29.nipic.com/20130514/12477194_083818249176_2.jpg",
                                @"http://img1.3lian.com/2015/a1/95/d/105.jpg",
                                @"http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=5e310a4ddb09b3deffb2ec2ba4d606f4/9d82d158ccbf6c81887581cdb63eb13533fa4050.jpg",
                                @"http://pic11.photophoto.cn/20090529/0034034544305310_b.jpg"];
    
    cycleV.selectedImageBlock = ^(NSInteger index) {
        
    };
    
    [self.view addSubview:cycleV];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
