//
//  ViewController.m
//  CommonTools
//
//  Created by Celia on 2017/6/27.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    MainView *mainView = [[MainView alloc] initWithFrame:CGRectMake(0, HPNavBarH, HPScreenWidth, HPScreenWidth - HPNavBarH)];
    mainView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:mainView];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
