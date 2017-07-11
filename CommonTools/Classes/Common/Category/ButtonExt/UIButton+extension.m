//
//  UIButton+extension.m
//  SLYP
//
//  Created by 秦正华 on 2016/11/16.
//  Copyright © 2016年 马晓明. All rights reserved.
//

#import "UIButton+extension.h"

@implementation UIButton (extension)

+(instancetype)initButtonWithTitleFont:(CGFloat)font TtileColor:(UIColor *)titlecolor TitleName:(NSString *)titlename
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:titlename forState:UIControlStateNormal];
    [btn setTitleColor:titlecolor forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:font]];
    return btn;
}

-(void)setButtonWithTitleFont:(CGFloat)font TtileColor:(UIColor *)titlecolor TitleName:(NSString *)titlename
{
    [self setTitle:titlename forState:UIControlStateNormal];
    [self setTitleColor:titlecolor forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont systemFontOfSize:font]];
}


+(instancetype)initButtonWithTitleFont:(CGFloat)font TtileColor:(UIColor *)titlecolor backGroundColor:(UIColor *)backcolor ImageName:(NSString *)imagename TitleName:(NSString *)titlename
{
    titlename = titlename == nil ? @"" : titlename;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
    [btn setTitle:titlename forState:UIControlStateNormal];
    [btn setTitleColor:titlecolor forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:font]];
    return btn;
}

-(void)setButtonWithTitleFont:(CGFloat)font TtileColor:(UIColor *)titlecolor backGroundColor:(UIColor *)backcolor ImageName:(NSString *)imagename TitleName:(NSString *)titlename
{
    [self setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
    [self setTitle:titlename forState:UIControlStateNormal];
    [self setTitleColor:titlecolor forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont systemFontOfSize:font]];
}

+(instancetype)initButtonWithTitleFont:(CGFloat)font TtileColor:(UIColor *)titlecolor TitleName:(NSString *)titlename backgroundColor:(UIColor *)backcolor radius:(CGFloat)radius
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:titlename forState:UIControlStateNormal];
    [btn setTitleColor:titlecolor forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:font]];
    btn.backgroundColor = backcolor;
    if (radius > 0) {
        btn.layer.cornerRadius = radius;
        btn.layer.masksToBounds = YES;
    }
    return btn;
}

-(void)setButtonWithTitleFont:(CGFloat)font TtileColor:(UIColor *)titlecolor TitleName:(NSString *)titlename backgroundColor:(UIColor *)backcolor radius:(CGFloat)radius
{
    [self setTitle:titlename forState:UIControlStateNormal];
    [self setTitleColor:titlecolor forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont systemFontOfSize:font]];
    self.backgroundColor = backcolor;
    if (radius > 0) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
    }
}

@end
