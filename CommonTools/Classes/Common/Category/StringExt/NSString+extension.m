//
//  NSString+extension.m
//  SLYP
//
//  Created by 秦正华 on 2016/11/22.
//  Copyright © 2016年 马晓明. All rights reserved.
//

#import "NSString+extension.h"

@implementation NSString (extension)

-(NSString *)decodeUTF8
{
    return [self stringByRemovingPercentEncoding];
//   return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


-(NSString *)codeUTF8
{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLUserAllowedCharacterSet]];
}

-(NSString *)appendRN
{
    return [RN stringByAppendingPathComponent:self.lastPathComponent];
}

+ (BOOL) isBlankString:(NSString *)string
{
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+ (BOOL)isTelNumber:(NSString *) telNumber
{
    NSString *pattern = @"^1+[3578]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}

+ (BOOL)isPassword:(NSString *) password
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
}

+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)isUserName:(NSString *) userName
{
    NSString *pattern = @"^([A-Z]|[a-z]|[0-9]){6,20}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userName];
    return isMatch;
}

+(float)getNumberCharacters:(NSString *)tmp{
    NSCharacterSet* nonDigits =[[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    float numbers =[[tmp stringByTrimmingCharactersInSet:nonDigits] floatValue];
    return numbers;
}

-(NSString *)cacheDir
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    return [path stringByAppendingPathComponent:self.lastPathComponent];

}

-(NSString *)docDir
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    return [path stringByAppendingPathComponent:self.lastPathComponent];
    
}

-(NSString *)tmpDir
{
    NSString *path = NSTemporaryDirectory();
    return [path stringByAppendingPathComponent:self.lastPathComponent];
    
}

/**
 *  计算文字的高度
 */
+ (CGSize)content:(NSString *)content boundingRectWithSize:(CGSize)size fontSize:(CGFloat)fontSize
{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    
    CGSize retSize = [content boundingRectWithSize:size
                                           options:
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                        attributes:attribute
                                           context:nil].size;
    
    return retSize;
}

@end
