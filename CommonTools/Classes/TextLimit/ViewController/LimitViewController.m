//
//  LimitViewController.m
//  CommonTools
//
//  Created by Celia on 2017/6/29.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "LimitViewController.h"
#import "LimitView.h"

@interface LimitViewController ()

@end

@implementation LimitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"输入控制";
    
    LimitView *limitV = [[LimitView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:limitV];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
