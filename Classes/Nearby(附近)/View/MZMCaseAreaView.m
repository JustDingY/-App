//
//  MZMCaseAreaView.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/11.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMCaseAreaView.h"
#import "MZMCaseAreaModel.h"
#import "MZMCaseAreaCell.h"

@interface MZMCaseAreaView ()<UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray * _dataSource;
    UIImageView * _headerView;
    MZMCaseAreaCell * _cell;
}

@end

@implementation MZMCaseAreaView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = MZMBackColor;
        [self prepareDataSource];
        [self prepareHeaderView];
    }
    return self;
}

- (void)prepareDataSource
{
    _dataSource = [NSMutableArray array];
    MZMCaseAreaModel * model = [[MZMCaseAreaModel alloc] init];
    for (int i = 0; i < 10; i ++) {
        model.shopName = @"东方明珠量贩KTV(大学城店)";
        model.areaName = @"大学城";
        model.shopType = @"娱乐";
        model.shopDistance = @"200米";
        model.shopImg = @"001";
        model.shopDetail = @"美国民主党总统竞选人希拉里·克林顿在通往白宫的路上正斗志昂扬,近来民众支持率虽有所下滑,但接连14年当选美国人最尊敬女性,说明她确实有其独到的魅力";
        model.shopLevel = @"icon_star_group";
        model.shopDiscount = @"9.2";
        [_dataSource addObject:model];
    }
}

- (void)prepareHeaderView
{
    _headerView = [MZMControl createImageViewWithFrame:CGRectMake(0, 0, WIDTH, 230) imageName:@"001"];
    self.tableHeaderView = _headerView;
    
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, _headerView.height - 30, WIDTH, 30)];
    backView.backgroundColor = MZMCOLOR(0, 0, 0, 0.2);
    [_headerView addSubview:backView];
    
    UIImageView * indicator = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 10, 15)];
    indicator.image = [UIImage imageNamed:@"location_icon_content"];
    indicator.centerY = backView.height * 0.5;
    [backView addSubview:indicator];
    
    UILabel * countLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(indicator.frame)+2, indicator.y, 100, 15)];
    countLabel.text = [NSString stringWithFormat:@"有%d家商家",20];
    countLabel.textColor = [UIColor whiteColor];
    countLabel.font = [UIFont systemFontOfSize:13];
    countLabel.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:countLabel];
    
    UILabel * distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 80, 0, 60, 15)];
    distanceLabel.text = @"200米";
    distanceLabel.textAlignment = NSTextAlignmentRight;
    distanceLabel.centerY = indicator.centerY;
    distanceLabel.textColor = [UIColor whiteColor];
    distanceLabel.font = [UIFont systemFontOfSize:13];
    [backView addSubview:distanceLabel];
}

#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString * ID = @"reuseIndentifier";
    MZMCaseAreaCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MZMCaseAreaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    MZMCaseAreaModel * model = [_dataSource objectAtIndex:indexPath.section];
    [cell configModel:model];
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    UIViewController * nectVc = nil;
//    if (indexPath > 0) {
//        nectVc = [[MZMBusinessViewController alloc] init];
//    }
//}


@end
