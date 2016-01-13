//
//  MZMCollectionViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/10.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMCollectionViewController.h"
#import "MZMCollectionModel.h"
#import "MZMCollectionCell.h"

#import "JSDropDownMenu.h"

@interface MZMCollectionViewController ()<UITableViewDataSource,UITableViewDelegate,JSDropDownMenuDataSource,JSDropDownMenuDelegate>

{
    NSMutableArray * _dataSource;
    UITableView * _tableView;
    
    //下拉菜单
    NSMutableArray * _data;
    NSInteger * _currentDataIndex;
}

@property (nonatomic, strong) JSDropDownMenu * menu;

@end

@implementation MZMCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = MZMBackColor;
    
    [self prepareNav];
    [self prepareTableView];
    [self prepareDataSource];

    [self prepareMenuDataSource];
    [self prepareMenuUI];

}

- (void)prepareNav
{
    UILabel * titleLabel = [MZMControl createLabelWithFrame:CGRectMake(0, 0, 40, 20) text:@"我的收藏" font:18];
    titleLabel.textColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = titleLabel;
    
}

- (void)prepareTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 45, WIDTH, HEIGHT - 45)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark - 下拉菜单
- (void)prepareMenuDataSource
{
    //
    _data = [NSMutableArray arrayWithObjects:@"全部分类",@"酒店",@"KTV",@"电影",@"美食",@"生活", nil];
}

- (void)prepareMenuUI
{
    _menu = [[JSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 20) andHeight:45];
    _menu.indicatorColor = MZMCOLOR(128, 128, 128, 1);
    _menu.separatorColor = MZMCOLOR(210, 210, 210, 1);
    _menu.textColor = MZMCOLOR(83, 83, 83, 1);
    
    _menu.delegate = self;
    _menu.dataSource = self;
    
    [self.view addSubview:_menu];
}

- (void)prepareDataSource
{
    _dataSource = [[NSMutableArray alloc] init];
    for (int i = 0; i < 15; i ++) {
        MZMCollectionModel * model = [[MZMCollectionModel alloc] init];
        model.shopImg = @"business_img";
        model.shopName = @"北京烤鸭";
        model.shopLevel = @"icon_star_group";
        model.evaluateNum = [NSString stringWithFormat:@"%d人评价",2000];
        model.shopType = @"酒店美食";
        model.shopCount = [NSString stringWithFormat:@"%.2f折",9.5];
        model.shopArea = @"明珠广场";
        
        [_dataSource addObject:model];
    }
}

#pragma mark - menu代理方法
- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu
{
    return 1;
}

//是否放置collection
- (BOOL)displayByCollectionViewInColumn:(NSInteger)column
{
    return NO;
}

//是否拥有右侧菜单
- (BOOL)haveRightTableViewInColumn:(NSInteger)column
{
    return NO;
}

//左侧菜单宽度
- (CGFloat)widthRatioOfLeftColumn:(NSInteger)column
{
    return 1;
}

- (NSInteger)currentLeftSelectedRow:(NSInteger)column
{
    
    return _currentDataIndex
    ;

}

- (NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow
{
    return _data.count;
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column
{
    return _data[0];
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForRowAtIndexPath:(JSIndexPath *)indexPath
{
    return _data[indexPath.row];
}

- (void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath
{
    
    _currentDataIndex = indexPath.row;

}

#pragma mark - tableView代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MZMCollectionCell * cell = [tableView dequeueReusableCellWithIdentifier:@""];
    if (!cell) {
        cell = [[MZMCollectionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    }
    
    MZMCollectionModel * model = [_dataSource objectAtIndex:indexPath.row];
    [cell configModel:model];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController * nextVc = nil;
}


@end
