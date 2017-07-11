//
//  CycleView.h
//  CommonTools
//
//  Created by Celia on 2017/6/29.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CycleView : UIView

@property (nonatomic, strong) NSArray *imagesURLStrings;

@property (nonatomic, copy) void (^selectedImageBlock)(NSInteger index);

@end
