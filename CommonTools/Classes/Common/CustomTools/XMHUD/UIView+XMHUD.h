//
//  UIView+XMHUD.h
//  项目初始化模板(TableBarStyle)
//
//  Created by 秦正华 on 2017/5/17.
//  Copyright © 2017年 qinzhenghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMProgressHUD.h"

@interface UIView (XMHUD)

#pragma mark - 提示框调用方法
-(void)showProgress:(NSString *)msg;

-(void)showMessage:(NSString *)msg;

-(void)show:(NSString *)msg mode:(MBProgressHUDMode)myMode;

-(void)showCustomViewImageName:(NSString *)name Message:(NSString *)msg;

-(void)hideHUD;

-(void)hideHUDAfter:(CGFloat)time;

@end
