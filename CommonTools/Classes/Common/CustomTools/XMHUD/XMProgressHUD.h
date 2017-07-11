//
//  QZHProgressHUD.h
//  SLYP
//
//  Created by 秦正华 on 2016/11/25.
//  Copyright © 2016年 马晓明. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface XMProgressHUD : NSObject

@property (nonatomic,strong) MBProgressHUD  *hud;

+(instancetype)shareHUD;


/**
 提示框-可选mode

 @param msg 显示文字
 @param view 父视图
 @param myMode mode
 */
+(void)show:(NSString *)msg inView:(UIView *)view mode:(MBProgressHUDMode)myMode;


/**
 立即隐藏
 */
+(void)hide;


/**
 多长时间后执行隐藏

 @param time 时间
 */
+(void)hideAfter:(CGFloat)time;


/**
 菊花提示框

 @param msg 显示文字
 @param view 父视图
 */
+(void)showProgress:(NSString *)msg inView:(UIView *)view;

/**
 自定义提示框

 @param msg 文字
 @param view 父视图
 */
+(void)showCustomViewAndMessage:(NSString *)msg inview:(UIView *)view;


/**
 文字提示框

 @param msg 显示文字
 @param view 父视图
 */
+(void)showMessage:(NSString *)msg inView:(UIView *)view;


/**
 自定义提示框

 @param name image
 @param msg 显示文字
 @param view 父视图
 */
+(void)showCustomViewImageName:(NSString *)name Message:(NSString *)msg inview:(UIView *)view;

@end
