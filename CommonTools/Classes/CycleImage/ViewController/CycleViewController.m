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
    cycleV.imagesURLStrings = @[@"http://www.njnfwl.com/imageRepository/ab1446f4-e25e-4c9d-b30f-54faeaaac848.jpg",
                                @"http://www.njnfwl.com/imageRepository/16ea2773-9ddc-4db4-a5e4-93f2139b0def.jpg",
                                @"http://www.njnfwl.com/imageRepository/94f8caab-8639-432b-803c-9f46f001523a.jpg",
                                @"http://www.njnfwl.com/imageRepository/d287d136-1c94-4600-9e20-ea83a07265d8.jpg"];
    cycleV.selectedImageBlock = ^(NSInteger index) {
        
    };
    
    [self.view addSubview:cycleV];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
