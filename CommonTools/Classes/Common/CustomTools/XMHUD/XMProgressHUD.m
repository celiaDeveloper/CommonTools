//
//  QZHProgressHUD.m
//  SLYP
//
//  Created by 秦正华 on 2016/11/25.
//  Copyright © 2016年 马晓明. All rights reserved.
//

#import "XMProgressHUD.h"

@implementation XMProgressHUD

+(instancetype)shareHUD{
    static XMProgressHUD *HUD;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        HUD =[[XMProgressHUD alloc]init];
    });
    return HUD;
}

+(void)hide
{
    if ([XMProgressHUD shareHUD].hud != nil) {
        [[XMProgressHUD shareHUD].hud hideAnimated:YES];
    }
}

+(void)hideAfter:(CGFloat)time
{
    if ([XMProgressHUD shareHUD].hud != nil) {
        [[XMProgressHUD shareHUD].hud hideAnimated:YES afterDelay:time];
    }
}

//显示进度(菊花)
+(void)showProgress:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:MBProgressHUDModeIndeterminate];
}


+(void)showMessage:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:MBProgressHUDModeText];
     [[XMProgressHUD shareHUD].hud hideAnimated:YES afterDelay:2.0];
}


+(void)showCustomViewImageName:(NSString *)name Message:(NSString *)msg inview:(UIView *)view
{
     [self show:msg inView:view mode:MBProgressHUDModeCustomView customImgView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:name]]];
}

//显示自定义提示
+(void)showCustomViewAndMessage:(NSString *)msg inview:(UIView *)view
{
    [self show:msg inView:view mode:MBProgressHUDModeCustomView customImgView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"info_4"]]];
    [[XMProgressHUD shareHUD].hud hideAnimated:YES afterDelay:2.0];
}

+(void)show:(NSString *)msg inView:(UIView *)view mode:(MBProgressHUDMode)myMode{
    [self show:msg inView:view mode:myMode customImgView:nil];
}

+(void)show:(NSString *)msg inView:(UIView *)view mode:(MBProgressHUDMode)myMode customImgView:(UIImageView *)customImgView{
    //如果已有弹框，先消失
    if ([XMProgressHUD shareHUD].hud != nil) {
        [[XMProgressHUD shareHUD].hud hideAnimated:YES];
        [XMProgressHUD shareHUD].hud = nil;
    }
    //4\4s屏幕避免键盘存在时遮挡
    if ([UIScreen mainScreen].bounds.size.height == 480) {
        [view endEditing:YES];
    }
    [XMProgressHUD shareHUD].hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    [QZHProgressHUD shareHUD].hud.dimBackground = YES;    //是否显示透明背景
    //是否设置黑色背景，这两句配合使用
    [XMProgressHUD shareHUD].hud.bezelView.color = [UIColor blackColor];
    [XMProgressHUD shareHUD].hud.contentColor = [UIColor whiteColor];
    [[XMProgressHUD shareHUD].hud setMargin:10];
    [[XMProgressHUD shareHUD].hud setRemoveFromSuperViewOnHide:YES];
    [XMProgressHUD shareHUD].hud.animationType = MBProgressHUDAnimationZoom;
    [XMProgressHUD shareHUD].hud.detailsLabel.text = msg;
    [XMProgressHUD shareHUD].hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    [XMProgressHUD shareHUD].hud.mode = myMode;
    [XMProgressHUD shareHUD].hud.customView = customImgView;
}





@end
