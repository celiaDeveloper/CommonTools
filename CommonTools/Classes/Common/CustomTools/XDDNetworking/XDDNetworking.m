//
//  XDDNetworking.m
//  ColorFulShipper
//
//  Created by Celia on 2017/4/11.
//  Copyright © 2017年 skyApple. All rights reserved.
//


#import "XDDNetworking.h"
#import "NSDictionary+null.h"
#import "JSONModel.h"

@implementation XDDNetworking

+(XDDNetworking *)shareNetworking {
    static XDDNetworking *requestObj = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (requestObj == nil) {
            requestObj = [[XDDNetworking alloc] init];
        }
    });
    
    return requestObj;
}

- (NSMutableURLRequest *)httpHeaderSettingType:(HttpRequestType)type URL:(NSString *)url params:(NSDictionary *)paramsDic {
    
    NSURL *requestURL = [NSURL URLWithString:url];
    NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:requestURL];
    
    //http body 设置
    if (paramsDic != nil) {
        
//        NSData *bodyData = [NSJSONSerialization dataWithJSONObject:paramsDic options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSString *temp = @"cat_id= ";
        [theRequest setHTTPBody:[temp dataUsingEncoding:NSUTF8StringEncoding]];
        
    }
    
    //http header 设置
    NSString *httpMethod = (type == HttpRequestTypeGet ? @"GET" : @"POST");
    [theRequest setHTTPMethod:httpMethod];
    
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [theRequest addValue:@"Ios" forHTTPHeaderField:@"equipmentType"];
    
    NSLog(@"请求头 all Header :%@", theRequest.allHTTPHeaderFields);
    
    return theRequest;
}

//异步http请求
- (void)sendHttpRequestWithType:(HttpRequestType)type URL:(nonnull NSString *)url params:(NSDictionary *)paramsDic successBlock:(HttpSuccessBlock)successBlock failedBlock:(HttpFailedBlock)failedBlock {
    
    NSMutableURLRequest *theRequest = [self httpHeaderSettingType:type URL:url params:paramsDic];
    [theRequest setTimeoutInterval:30.0];
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *sessionData = [session dataTaskWithRequest:theRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            
            if (failedBlock) {
                failedBlock(error);
            }
            
        }else {
            
            if (data) {
              
                NSError *err = nil;
                NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&err];
                NSDictionary *returnDic = [jsonDic dictionaryByReplacingNullsWithBlanks];
                
                if (err) {
                    NSLog(@"json 解析失败 %@",err);
                }
                
                if (successBlock) {
                    successBlock(returnDic);
                }
            }
            
        }
        
    }];
    
    [sessionData resume];
    
}

#pragma mark - 获取当前时间
- (NSString *)getCurrentTime {
    NSDate *date = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSString *DateTime = [formatter stringFromDate:date];
    return DateTime;
}

#pragma mark - model 转 string
- (NSString *)stringFromModel:(JSONModel *)model {
    
    NSDictionary *dic = [model toDictionary];
    NSString *temp = [NSString stringWithFormat:@"%@",dic];
    
    NSMutableString *mutStr = [NSMutableString stringWithString:temp];
    
    NSRange range = {0,temp.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
}

- (NSString *)jsonStringFromModel:(JSONModel *)model {
    
    NSDictionary *dataDic = [model toDictionary];
    
    NSString * headerData = [self jsonStringFromDic:dataDic];
    
    return headerData;
}

- (NSString *)jsonStringFromDic:(NSDictionary *)dataDic {
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataDic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    NSString *dataString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    
    NSString * headerData = dataString;
    headerData = [headerData stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; //去除掉首尾的空白字符和换行字符
    headerData = [headerData stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    headerData = [headerData stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return headerData;
}

@end
