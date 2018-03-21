//
//  LimitView.m
//  CommonTools
//
//  Created by Celia on 2017/6/29.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "LimitView.h"
#import "CustomTextField.h"
#import "CustomTextView.h"

@interface LimitView ()

@property (nonatomic, strong) CustomTextField *tfOne;
@property (nonatomic, strong) CustomTextField *tfTwo;
@property (nonatomic, strong) CustomTextView *tvThree;
@property (nonatomic, strong) CustomTextView *tvFour;

@end

@implementation LimitView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignKeyboard)]];
        
        [self addSubview:self.tfOne];
        [self addSubview:self.tfTwo];
//        [self addSubview:self.tvThree];
        [self addSubview:self.tvFour];
        
    }
    
    return self;
}

- (CustomTextField *)tfOne {
    
    if (!_tfOne) {
        
        _tfOne = [[CustomTextField alloc] initWithFrame:CGRectMake(self.width / 2 - 150, 64 + 30, 300, 44)];
        
        UILabel *tip = [[UILabel alloc] initWithFrame:CGRectMake(_tfOne.left, _tfOne.top - 20, _tfOne.width, 20)];
        tip.textColor = [UIColor redColor];
        tip.font = [UIFont systemFontOfSize:14.0f];
        tip.text = @"限制输入9位数，1位小数";
        [self addSubview:tip];
        
        _tfOne.placeholder = tip.text;
        _tfOne.lengthLimit = 9;
        _tfOne.limitOnePoint = YES;
        _tfOne.borderStyle = UITextBorderStyleRoundedRect;
    }
    
    return _tfOne;
}

- (CustomTextField *)tfTwo {
    
    if (!_tfTwo) {
        _tfTwo = [[CustomTextField alloc] initWithFrame:CGRectMake(self.width / 2 - 150, _tfOne.bottom + 30, 300, 44)];
        
        UILabel *tip = [[UILabel alloc] initWithFrame:CGRectMake(_tfTwo.left, _tfTwo.top - 20, _tfTwo.width, 20)];
        tip.textColor = [UIColor redColor];
        tip.font = [UIFont systemFontOfSize:14.0f];
        tip.text = @"限制输入8位整数";
        [self addSubview:tip];
        
        _tfTwo.placeholder = tip.text;
        _tfTwo.lengthLimit = 8;
        _tfTwo.limitInteger = YES;
        _tfTwo.borderStyle = UITextBorderStyleRoundedRect;
    }
   
    return _tfTwo;
}

- (CustomTextView *)tvThree {
    
    if (!_tvThree) {
        _tvThree = [[CustomTextView alloc] initWithFrame:CGRectMake(self.width / 2 - 150, _tfTwo.bottom + 30, 300, 44)];
        
        UILabel *tip = [[UILabel alloc] initWithFrame:CGRectMake(_tvThree.left, _tvThree.top - 20, _tvThree.width, 20)];
        tip.textColor = [UIColor redColor];
        tip.font = [UIFont systemFontOfSize:14.0f];
        tip.text = @"限制输入8位整数";
        [self addSubview:tip];
        
        _tvThree.defaultPlace = tip.text;
        _tvThree.lengthLimit = 8;
        _tvThree.limitInteger = YES;
        
        _tvThree.layer.borderWidth = 0.5f;
        _tvThree.layer.cornerRadius = 5.0f;
        _tvThree.layer.masksToBounds = YES;
        
    }
   
    return _tvThree;
}

- (CustomTextView *)tvFour {
    
    if (!_tvFour) {
        _tvFour = [[CustomTextView alloc] initWithFrame:CGRectMake(self.width / 2 - 150, _tfTwo.bottom + 30, 300, 80)];
        
        UILabel *tip = [[UILabel alloc] initWithFrame:CGRectMake(_tvFour.left, _tvFour.top - 20, _tvFour.width, 20)];
        tip.textColor = [UIColor redColor];
        tip.font = [UIFont systemFontOfSize:14.0f];
        tip.text = @"限制输入字数30";
        [self addSubview:tip];
        
        UILabel *tip2 = [[UILabel alloc] initWithFrame:CGRectMake(_tvFour.right - 20, _tvFour.bottom, 20, 18)];
        tip2.textColor = [UIColor redColor];
        tip2.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:tip2];
        
        _tvFour.defaultPlace = tip.text;
        _tvFour.lengthLimit = 30;
        
        _tvFour.layer.borderWidth = 0.5f;
        _tvFour.layer.cornerRadius = 5.0f;
        _tvFour.layer.masksToBounds = YES;
        
        tip2.text = [NSString stringWithFormat:@"%ld",_tvFour.lengthLimit];
        _tvFour.RemainCountBlock = ^(NSInteger remainCount) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                tip2.text = [NSString stringWithFormat:@"%ld",remainCount];
                [tip2 setNeedsDisplay];
            });
            
        };
        
    }
    
    return _tvFour;
    
}



- (void)resignKeyboard {
    
    [self endEditing:YES];
    [HPNOTIF removeObserver:self];
}

- (void)keyboardFrameChange:(NSNotification *)notice {
    //获取键盘弹出前的Rect
    NSValue *keyBoardBeginBounds=[[notice userInfo]objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect beginRect=[keyBoardBeginBounds CGRectValue];
    
    //获取键盘弹出后的Rect
    NSValue *keyBoardEndBounds=[[notice userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect  endRect=[keyBoardEndBounds CGRectValue];
    
    //获取键盘位置变化前后纵坐标Y的变化值
    CGFloat deltaY=endRect.origin.y-beginRect.origin.y;
    NSLog(@"键盘弹出 Y值的变化:%f",deltaY);
    
    if (self.frame.origin.y + deltaY <= 0) {
        //在0.25s内完成self.view的Frame的变化，等于是给self.view添加一个向上移动deltaY的动画
        [UIView animateWithDuration:0.1f animations:^{
            [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y+deltaY, self.frame.size.width, self.frame.size.height)];
        }];
    }
    
}

@end
