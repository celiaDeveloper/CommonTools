//
//  HUDViewController.m
//  CommonTools
//
//  Created by Celia on 2017/7/10.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "HUDViewController.h"
#import "UIButton+extension.h"
#import "Masonry.h"

#import "UIView+XMHUD.h"
#import "XMProgressHUD.h"

#import "XTProgressHUD.h"

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
    
    UIButton *btn4 = [self createBtnTitle:@"加载样式 4" tag:4];
    [self.view addSubview:btn4];
    
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
    
    [btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn3.mas_bottom).offset(20);
        make.left.right.height.equalTo(btn1);
    }];
    
    
    UIButton *btn5 = [self createOtherBtnTitle:@"加载样式 5" tag:5];
    [self.view addSubview:btn5];
    
    UIButton *btn6 = [self createOtherBtnTitle:@"加载样式 6" tag:6];
    [self.view addSubview:btn6];
    
    UIButton *btn7 = [self createOtherBtnTitle:@"加载样式 7" tag:7];
    [self.view addSubview:btn7];
    
    [btn5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn4.mas_bottom).offset(20);
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
    
    UIButton *btn = [UIButton initButtonWithTitleFont:15.0 TtileColor:[UIColor whiteColor] TitleName:title backgroundColor:self.view.tintColor radius:0];
    btn.tag = tag;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (UIButton *)createOtherBtnTitle:(NSString *)title tag:(NSInteger)tag {
    
    UIButton *btn = [UIButton initButtonWithTitleFont:15.0 TtileColor:[UIColor whiteColor] TitleName:title backgroundColor:[UIColor purpleColor] radius:0];
    btn.tag = tag;
    [btn addTarget:self action:@selector(otherBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
    
}

- (void)btnAction:(UIButton *)btn {
    
    switch (btn.tag) {
        case 1:
            [self.view showProgress:@"加载中..."];
            break;
        case 2:
            [self.view showMessage:@"数据加载成功"];
            break;
        case 3:
        {
            [self.view show:@"加载失败！！！" mode:MBProgressHUDModeDeterminateHorizontalBar];
            [XMProgressHUD shareHUD].hud.progress = 0.5;//调整progress大小
        }
            break;
        case 4:
            [self.view showCustomViewImageName:@"HOME_BTN3" Message:@"加载完成"];
            break;
        default:
            break;
    }
    
    [self.view hideHUDAfter:3.0];
    
}

- (void)otherBtnAction:(UIButton *)btn {
    
    XTProgressHUD *hud = [XTProgressHUD progressHUD];
    
    switch (btn.tag) {
        case 5:
        {
            [hud showHudAtView:self.view];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [hud hideHud];
            });
        }
            break;
        case 6:
        {
            [hud showHudAtView:self.view withText:@"数据加载中..."];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [hud hideHud];
            });
        }
            break;
        case 7:
            [XTProgressHUD showText:@"加载失败！！！" atView:self.view];
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
