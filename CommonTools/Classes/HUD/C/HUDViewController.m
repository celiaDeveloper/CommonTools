//
//  HUDViewController.m
//  CommonTools
//
//  Created by Celia on 2017/7/10.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "HUDViewController.h"

#import "UIView+HPProgressHUD.h"

#import "HPProgressHUD.h"

@interface HUDViewController ()

@end

@implementation HUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"加载视图各式样式";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *btn1 = [self createBtnTitle:@"加载样式 1" tag:1];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [self createBtnTitle:@"加载样式 2" tag:2];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [self createBtnTitle:@"加载样式 3" tag:3];
    [self.view addSubview:btn3];
    
//    UIButton *btn4 = [self createBtnTitle:@"加载样式 4" tag:4];
//    [self.view addSubview:btn4];
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(50);
    }];
    
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn1.mas_bottom).offset(20);
        make.left.right.height.equalTo(btn1);
    }];
    
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn2.mas_bottom).offset(20);
        make.left.right.height.equalTo(btn1);
    }];
    
//    [btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(btn3.mas_bottom).offset(20);
//        make.left.right.height.equalTo(btn1);
//    }];
    
    
    UIButton *btn5 = [self createOtherBtnTitle:@"加载样式 5" tag:5];
    [self.view addSubview:btn5];
    
    UIButton *btn6 = [self createOtherBtnTitle:@"加载样式 6" tag:6];
    [self.view addSubview:btn6];
    
    UIButton *btn7 = [self createOtherBtnTitle:@"加载样式 7" tag:7];
    [self.view addSubview:btn7];
    
    [btn5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn3.mas_bottom).offset(20);
        make.left.right.height.equalTo(btn1);
    }];
    
    [btn6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn5.mas_bottom).offset(20);
        make.left.right.height.equalTo(btn1);
    }];
    
    [btn7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn6.mas_bottom).offset(20);
        make.left.right.height.equalTo(btn1);
    }];
}

- (UIButton *)createBtnTitle:(NSString *)title tag:(NSInteger)tag {
    
    UIButton *btn = [UIButton initButtonTitleFont:15.0 titleColor:[UIColor whiteColor] titleName:title backgroundColor:self.view.tintColor radius:0];
    btn.tag = tag;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (UIButton *)createOtherBtnTitle:(NSString *)title tag:(NSInteger)tag {
    
    UIButton *btn = [UIButton initButtonTitleFont:15.0 titleColor:[UIColor whiteColor] titleName:title backgroundColor:[UIColor purpleColor] radius:0];
    btn.tag = tag;
    [btn addTarget:self action:@selector(otherBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
    
}

- (void)btnAction:(UIButton *)btn {
    
    switch (btn.tag) {
        case 1:
            [self.view showLoading:@"加载中..."];
            break;
        case 2:
            [self.view showMessage:@"数据加载成功"];
            break;
        case 3:
            [self.view showFailure:@"加载失败"];
            break;
        
        default:
            break;
    }
    
    [self.view hideAfter:3.0];
    
}

- (void)otherBtnAction:(UIButton *)btn {

    switch (btn.tag) {
        case 5:
        {
            [HPProgressHUD showLoading:@"加载中..."];
            [HPProgressHUD hideAfter:3.0];
        }
            break;
        case 6:
            [HPProgressHUD showMessage:@"数据加载中" inView:self.view];
            break;
        case 7:
            [HPProgressHUD showFailure:@"加载失败" inView:self.view];
            break;
        default:
            break;
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
