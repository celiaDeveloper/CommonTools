//
//  XDDNetworking.h
//  ColorFulShipper
//
//  Created by Celia on 2017/4/11.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    HttpRequestTypePost,
    HttpRequestTypeGet
}HttpRequestType;


@interface XDDNetworking : NSObject

NS_ASSUME_NONNULL_BEGIN
//在这两个宏之间的代码NS_ASSUME_NONNULL_END，所有简单指针对象都被假定为nonnull
typedef void(^HttpSuccessBlock)(NSDictionary *successDic);
typedef void(^HttpFailedBlock)(NSError *error);


+(XDDNetworking *)shareNetworking;


- (void)sendHttpRequestWithType:(HttpRequestType)type URL:(NSString *)url params:(nullable NSDictionary *)paramsDic successBlock:(HttpSuccessBlock)successBlock failedBlock:(HttpFailedBlock)failedBlock;



NS_ASSUME_NONNULL_END
@end
