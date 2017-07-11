//
//  UIButton+extension.h
//  SLYP
//
//  Created by 秦正华 on 2016/11/16.
//  Copyright © 2016年 马晓明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (extension)

/**
 创建文字btn
 */
+(instancetype)initButtonWithTitleFont:(CGFloat)font TtileColor:(UIColor *)titlecolor TitleName:(NSString *)titlename;

-(void)setButtonWithTitleFont:(CGFloat)font TtileColor:(UIColor *)titlecolor TitleName:(NSString *)titlename;

/**
 创建文字图片btn
 */
+(instancetype)initButtonWithTitleFont:(CGFloat)font TtileColor:(UIColor *)titlecolor backGroundColor:(UIColor *)backcolor ImageName:(NSString *)imagename TitleName:(NSString *)titlename;

-(void)setButtonWithTitleFont:(CGFloat)font TtileColor:(UIColor *)titlecolor backGroundColor:(UIColor *)backcolor ImageName:(NSString *)imagename TitleName:(NSString *)titlename;


/**
 创建文字圆角btn
 */
+(instancetype)initButtonWithTitleFont:(CGFloat)font TtileColor:(UIColor *)titlecolor TitleName:(NSString *)titlename backgroundColor:(UIColor *)backcolor radius:(CGFloat)radius;

-(void)setButtonWithTitleFont:(CGFloat)font TtileColor:(UIColor *)titlecolor TitleName:(NSString *)titlename backgroundColor:(UIColor *)backcolor radius:(CGFloat)radius;

@end
