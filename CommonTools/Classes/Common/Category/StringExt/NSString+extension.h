//
//  NSString+extension.h
//  SLYP
//
//  Created by 秦正华 on 2016/11/22.
//  Copyright © 2016年 马晓明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (extension)

/**
 UTF8->解码
 */
-(NSString *)decodeUTF8;


/**
 编码->UTF8
 */
-(NSString *)codeUTF8;

/**
 拼接域名
 */
-(NSString *)appendRN;

/**
 判断字符串是否为空
 
 @param string 需要判断的字符串
 @return 返回值
 */
+ (BOOL) isBlankString:(NSString *)string;

//判断手机号码格式是否正确
+ (BOOL)isTelNumber:(NSString *) telNumber;

//判断密码数字+字母6-18位
+ (BOOL)isPassword:(NSString *) password;

//从字符串中获取数字
+(float)getNumberCharacters:(NSString *)tmp;

/**
 邮箱地址的正则表达式
 
 @param email -
 @return -
 */
+ (BOOL)isValidateEmail:(NSString *)email;

/**
 判断只包含字母和数字
 
 @param userName -
 
 @return -
 */
+ (BOOL)isUserName:(NSString *) userName;

/**
 将当前字符串拼接到cache目录后面

 @return -
 */
-(NSString *)cacheDir;

/**
 将当前字符串拼接到doc目录后面

 @return -
 */
-(NSString *)docDir;

/**
 将当前字符串拼接到tmp目录后面

 @return -
 */
-(NSString *)tmpDir;

/**
 *  计算文字的高度
 *
 *  @param content  所需要计算的文字的内容
 *  @param size     文字的宽高尺寸
 *  @param fontSize 文字的size
 *
 *  @return 整个内容的size
 */
+ (CGSize)content:(NSString *)content boundingRectWithSize:(CGSize)size fontSize:(CGFloat)fontSize;

@end
