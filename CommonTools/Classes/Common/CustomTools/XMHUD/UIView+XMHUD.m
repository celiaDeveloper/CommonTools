//
//  UIView+XMHUD.m
//  项目初始化模板(TableBarStyle)
//
//  Created by 秦正华 on 2017/5/17.
//  Copyright © 2017年 qinzhenghua. All rights reserved.
//

#import "UIView+XMHUD.h"

@implementation UIView (XMHUD)




#pragma mark - 提示框调用方法
-(void)showProgress:(NSString *)msg
{
    [XMProgressHUD showProgress:msg inView:self];
}

-(void)showMessage:(NSString *)msg
{
    [XMProgressHUD showMessage:msg inView:self];
}

-(void)show:(NSString *)msg mode:(MBProgressHUDMode)myMode
{
    [XMProgressHUD show:msg inView:self mode:myMode];
}

-(void)showCustomViewImageName:(NSString *)name Message:(NSString *)msg
{
    [XMProgressHUD showCustomViewImageName:name Message:msg inview:self];
}

-(void)hideHUD
{
    [XMProgressHUD hide];
}

-(void)hideHUDAfter:(CGFloat)time
{
    [XMProgressHUD hideAfter:time];
}

@end
