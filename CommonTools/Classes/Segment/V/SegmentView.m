//
//  SegmentView.m
//  CommonTools
//
//  Created by Celia on 2017/7/11.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "SegmentView.h"
#import <DZNSegmentedControl.h>

@interface SegmentView ()<DZNSegmentedControlDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) DZNSegmentedControl *control;
@property (nonatomic, strong) UITableView *receiveTableV;
@property (nonatomic, strong) UITableView *sendTableV;

@property (nonatomic, copy) NSArray *receiveData;
@property (nonatomic, copy) NSArray *sendData;

@end

@implementation SegmentView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.receiveData = [self makeData:@"收货方"];
        self.sendData = [self makeData:@"发货方"];
        
        [self addSubview:self.control];
        [self addSubview:self.sendTableV];
        [self addSubview:self.receiveTableV];
        
        self.sendTableV.hidden = YES;
    }
    
    return self;
}

- (NSArray *)makeData:(NSString *)str {
    
    NSMutableArray *tempArr = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        
        NSString *tepS = [NSString stringWithFormat:@"%@--%d",str,i];
        [tempArr addObject:tepS];
    }
    
    return tempArr.copy;
}

- (DZNSegmentedControl *)control {
    
    if (!_control) {
        _control = [[DZNSegmentedControl alloc] initWithItems:@[@"收货方",@"发货方"]];
        
        [[DZNSegmentedControl appearance] setBackgroundColor:[UIColor colorWithRed:0.97 green:0.97 blue:1.00 alpha:1.00]];
        [[DZNSegmentedControl appearance] setTintColor:[UIColor colorWithRed:0.36 green:0.66 blue:0.85 alpha:1.00]];
        [[DZNSegmentedControl appearance] setHairlineColor:[UIColor clearColor]];
        
        [[DZNSegmentedControl appearance] setFont:[UIFont fontWithName:@"EuphemiaUCAS" size:15.0]];
        [[DZNSegmentedControl appearance] setSelectionIndicatorHeight:2.5];
        [[DZNSegmentedControl appearance] setAnimationDuration:0.125];
        
        
        _control.tintColor =[UIColor colorWithRed:0.36 green:0.66 blue:0.85 alpha:1.00];
        
        _control.frame = CGRectMake(0, 0, self.width, 44);
        _control.delegate = self;
        _control.selectedSegmentIndex = 0;
        _control.bouncySelectionIndicator = NO;
        _control.height = 44.0f;
        _control.showsCount = NO;
        
        [_control addTarget:self action:@selector(didChangeSegment:) forControlEvents:UIControlEventValueChanged];
    }
   
    return _control;
}

- (void)didChangeSegment:(DZNSegmentedControl *)control {
    
    if (control.selectedSegmentIndex == 0) {
        self.receiveTableV.hidden = NO;
        self.sendTableV.hidden = YES;
        [self.receiveTableV reloadData];
    }else {
        self.receiveTableV.hidden = YES;
        self.sendTableV.hidden = NO;
        [self.sendTableV reloadData];
    }
    
}

- (UITableView *)receiveTableV {
    
    if (!_receiveTableV) {
        _receiveTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, self.control.bottom, self.width, self.height - self.control.bottom) style:UITableViewStylePlain];
        _receiveTableV.dataSource = self;
        _receiveTableV.delegate = self;
        _receiveTableV.tableFooterView = [UIView new];
    }
    
    return _receiveTableV;
}

- (UITableView *)sendTableV {
    
    if (!_sendTableV) {
        _sendTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, self.control.bottom, self.width, self.height - self.control.bottom) style:UITableViewStylePlain];
        _sendTableV.dataSource = self;
        _sendTableV.delegate = self;
        _sendTableV.tableFooterView = [UIView new];
    }
    
    return _sendTableV;
}

#pragma mark - tableview 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.control.selectedSegmentIndex == 0) {
        return self.receiveData.count;
    }else {
        return self.sendData.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.control.selectedSegmentIndex == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse_receive"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse_receive"];
        }
        cell.textLabel.text = self.receiveData[indexPath.row];
        
        return cell;
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse_send"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse_send"];
        }
        cell.textLabel.text = self.sendData[indexPath.row];
        
        return cell;
    }
    
}

@end
