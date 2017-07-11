//
//  CycleView.m
//  CommonTools
//
//  Created by Celia on 2017/6/29.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "CycleView.h"
#import <SDCycleScrollView/SDCycleScrollView.h>

@interface CycleView ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *bannerView;

@property (nonatomic, strong) UITableView *ZYWTableview;

@end

@implementation CycleView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.ZYWTableview];
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    
    return self;
}

#pragma mark ---uitableview delegate ---

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.ZYWTableview dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell -- %ld",indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}


- (SDCycleScrollView *)bannerView
{
    if (!_bannerView) {
        _bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 10, mScreenWidth - 20, 400 * m6PScale) imageURLStringsGroup:nil];
        _bannerView.layer.masksToBounds = YES;
        _bannerView.layer.cornerRadius = 5;
        _bannerView.showPageControl = YES;
        _bannerView.pageControlDotSize = CGSizeMake(15, 15);
        _bannerView.currentPageDotColor = mHexColor(0x20a2e6);
        _bannerView.pageDotColor = [UIColor whiteColor];
        _bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _bannerView.delegate = self;
        _bannerView.placeholderImage = [UIImage imageNamed:@"placeholder-big"];
        _bannerView.autoScrollTimeInterval = 2.0;
    }
    return _bannerView;
}

-(void)setImagesURLStrings:(NSArray *)imagesURLStrings
{
    self.bannerView.imageURLStringsGroup = imagesURLStrings;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%lu张轮播图",(long)index);
    if (self.selectedImageBlock)
    {
        self.selectedImageBlock(index);
    }
}



- (UITableView *)ZYWTableview
{
    if (!_ZYWTableview) {
        _ZYWTableview = [[UITableView alloc] initWithFrame:CGRectMake(10, 64, mScreenWidth - 20, mScreenHeight - 64) style:(UITableViewStyleGrouped)];
        _ZYWTableview.userInteractionEnabled = YES;
//        _ZYWTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _ZYWTableview.showsVerticalScrollIndicator = NO;
        _ZYWTableview.backgroundColor = [UIColor clearColor];
        _ZYWTableview.delegate = self;
        _ZYWTableview.dataSource = self;
        [_ZYWTableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"mainCell"];
        
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mScreenWidth - 20, 400 * m6PScale + 10)];
        _ZYWTableview.tableHeaderView = headView;
        [headView addSubview:self.bannerView];
        _ZYWTableview.tableFooterView = [UIView new];
        
    }
    return _ZYWTableview;
}


@end
