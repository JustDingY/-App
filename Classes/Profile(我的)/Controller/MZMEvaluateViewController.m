//
//  MZMEvaluateViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/10.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMEvaluateViewController.h"
#import "MZMEvaluateModel.h"
#import "MZMEvaluateViewCell.h"

@interface MZMEvaluateViewController ()

{
    NSMutableArray * _dataSource;
    MZMEvaluateViewCell * cell;
}

@end

@implementation MZMEvaluateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = MZMBackColor;
    
    self.tableView.separatorColor = MZMCOLOR(215, 215, 215, 1);
    
    [self prepareDataSource];
    [self prepareHeaderView];
    
    
}

- (void)prepareHeaderView
{
    //头视图
    UIImageView * View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
    View.image = [UIImage imageNamed:@"profile_header_bg"];
    self.tableView.tableHeaderView = View;
    
    UIImageView * headerBack = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15, 71, 71)];
    headerBack.backgroundColor = MZMCOLOR(255, 255, 255, 0.2);
    headerBack.layer.masksToBounds = YES;
    headerBack.layer.cornerRadius = headerBack.width * 0.5;
    headerBack.centerX = WIDTH * 0.5;

    [View addSubview:headerBack];
    
    UIImageView * headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 66, 66)];
    headerView.image = [UIImage imageNamed:@"007"];
    headerView.layer.masksToBounds = YES;
    headerView.layer.cornerRadius = headerView.width * 0.5;
    headerView.center = headerBack.center;
    [View addSubview:headerView];
    
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerBack.frame)+5, 80, 20)];
    nameLabel.text = @"背景三";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.centerX = headerBack.centerX;
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = [UIFont systemFontOfSize:15];
    [View addSubview:nameLabel];
    
    UILabel * evaluateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(nameLabel.frame)+5, 40, 20)];
    evaluateLabel.text = [NSString stringWithFormat:@"评价%d",9];
    evaluateLabel.font = [UIFont systemFontOfSize:13];
    evaluateLabel.textColor = [UIColor whiteColor];
    evaluateLabel.centerX = headerBack.centerX;
    [View addSubview:evaluateLabel];
    
}

- (void)prepareDataSource
{
    _dataSource = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        MZMEvaluateModel * model = [[MZMEvaluateModel alloc] init];
        model.shopImg = @"profile_store_icon";
        model.shopName = @"金釜川烤肉（新地店）";
        model.evaluteDate = @"2013-09-01";
        model.evaluteLevel = @"icon_star_group";
        model.evaluteContent = @"斯里兰卡盛产蓝宝石、红宝石等名贵宝石,其中星光蓝宝石因其顶部会呈现出六道星芒而得名。此前发现的世界上最大星光蓝宝石重1395克拉。";
        NSMutableArray * imageNames = [[NSMutableArray alloc] init];
        for (int i = 0 ; i < 5; i++) {
            [imageNames addObject:@"defalutbg_floor_item"];
        }
        model.imageNames = imageNames;
        [_dataSource addObject:model];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MZMEvaluateModel * model = [_dataSource objectAtIndex:indexPath.row];
    if (!cell) {
        cell = [[MZMEvaluateViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    }
    cell.shopViewName = model.shopImg;
    cell.shopName = model.shopName;
    cell.date = model.evaluteDate;
    cell.levelViewName = model.evaluteLevel;
    cell.content = model.evaluteContent;
    cell.imageNames = model.imageNames;
    
    return cell.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellId = @"cell";
    MZMEvaluateViewCell * evaluateCell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!evaluateCell) {
        evaluateCell = [[MZMEvaluateViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    //取出
    MZMEvaluateModel * model = [_dataSource objectAtIndex:indexPath.section];
    evaluateCell.shopViewName = model.shopImg;
    evaluateCell.shopName = model.shopName;
    evaluateCell.date = model.evaluteDate;
    evaluateCell.levelViewName = model.evaluteLevel;
    evaluateCell.content = model.evaluteContent;
    evaluateCell.imageNames = model.imageNames;
    
    return evaluateCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}


@end
