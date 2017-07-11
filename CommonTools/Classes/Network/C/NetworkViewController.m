//
//  NetworkViewController.m
//  CommonTools
//
//  Created by Celia on 2017/7/10.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "NetworkViewController.h"

#import "XDDNetworking.h"
#import "XMNetWorkTools.h"
#import "HYBNetworking.h"

@interface NetworkViewController ()

@end

@implementation NetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"网络请求测试";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [self createBtn:@"XDDNetworkTest" tag:1];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [self createBtn:@"XMNetworkTest" tag:2];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [self createBtn:@"HYBNetworkTest" tag:3];
    [self.view addSubview:btn3];
    
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(self.view.w - 40, 50));
    }];
    
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn1.mas_bottom).offset(20);
        make.left.right.height.equalTo(btn1);
    }];
    
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn2.mas_bottom).offset(20);
        make.left.right.height.equalTo(btn1);
    }];
}

- (UIButton *)createBtn:(NSString *)title tag:(NSInteger)tag {
    
    UIButton *btn = [UIButton initButtonWithTitleFont:15.0f TtileColor:[UIColor whiteColor] TitleName:title backgroundColor:self.view.tintColor radius:0];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = tag;
    
    return btn;
}

- (void)btnAction:(UIButton *)btn {
    
    switch (btn.tag) {
        case 1:
            [self XDDNetworkTest];
            break;
        case 2:
            [self XMNetworkTest];
            break;
        case 3:
            [self HYBNetworkTest];
            break;
        default:
            break;
    }
    
}

- (void)XDDNetworkTest {
    
    
    [[XDDNetworking shareNetworking] sendHttpRequestWithType:HttpRequestTypeGet URL:[goods_cate stringByAppendingString:@"cat="] params:nil successBlock:^(NSDictionary * _Nonnull successDic) {
        
        NSLog(@"XDDNetworking get data :%@",successDic);
        
    } failedBlock:^(NSError * _Nonnull error) {
        
    }];
    
}

- (void)XMNetworkTest {
    
    [XMNetWorkTools request:goods_cate method:XM_GET parameters:@{@"cat_id":@""} tipsShow:self.view finished:^(id JSON, NSError *error) {
        
        NSLog(@"%@",JSON);
        
    }];
    
}

- (void)HYBNetworkTest {
    
    [HYBNetworking getWithUrl:goods_cate refreshCache:YES params:@{@"cat_id":@""} success:^(id response) {
        
        NSLog(@"%@",response);
        
    } fail:^(NSError *error) {
        
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
