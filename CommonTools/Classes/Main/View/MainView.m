//
//  MainView.m
//  CommonTools
//
//  Created by Celia on 2017/6/27.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "MainView.h"
#import "MainViewCell.h"

#import "CycleViewController.h"
#import "LimitViewController.h"
#import "HUDViewController.h"
#import "NetworkViewController.h"
#import "SegmentViewController.h"

@interface MainView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *titleArray;

@end

@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.titleArray = @[@"图片循环播放",@"输入框格式限制",@"菊花加载视图",@"http请求测试",@"segment control"];
        
        [self addSubview:self.tableView];
        
    }
    
    return self;
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.w, self.h) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerNib:[UINib nibWithNibName:@"MainViewCell" bundle:nil] forCellReuseIdentifier:@"MainCell"];
    }
    return _tableView;
}

#pragma mark - delegate 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.Label setText:self.titleArray[indexPath.row]];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
        {
            NSLog(@"轮播");
            CycleViewController *cycleVC = [[CycleViewController alloc] init];
            UIViewController *VC = [_tableView getCurrentViewController];
            [VC.navigationController pushViewController:cycleVC animated:YES];
        }
            break;
        case 1:
        {
            LimitViewController *limitVC = [[LimitViewController alloc] init];
            UIViewController *vc = [_tableView getCurrentViewController];
            [vc.navigationController pushViewController:limitVC animated:YES];
        }
            break;
        case 2:
        {
            HUDViewController *HUDVC = [[HUDViewController alloc] init];
            UIViewController *vc = [_tableView getCurrentViewController];
            [vc.navigationController pushViewController:HUDVC animated:YES];
        }
            break;
        case 3:
        {
            NetworkViewController *networkVC = [[NetworkViewController alloc] init];
            UIViewController *vc = [_tableView getCurrentViewController];
            [vc.navigationController pushViewController:networkVC animated:YES];
        }
            break;
        case 4:
        {
            SegmentViewController *segmentVC = [[SegmentViewController alloc] init];
            UIViewController *vc = [_tableView getCurrentViewController];
            [vc.navigationController pushViewController:segmentVC animated:YES];
        }
            break;
        default:
            break;
    }
    
}

@end
