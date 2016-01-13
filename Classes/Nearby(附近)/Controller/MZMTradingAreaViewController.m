//
//  MZMTradingAreaViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/8.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMTradingAreaViewController.h"
#import "MZMTradingAreaModel.h"
#import "MZMTradingAreaCell.h"

#import "JSDropDownMenu.h"

@interface MZMTradingAreaViewController ()<UITableViewDataSource,UITableViewDelegate,JSDropDownMenuDataSource,JSDropDownMenuDelegate>
{
    UITableView * _tableView;
    NSMutableArray * _dataSource;
    
    //下拉菜单
    NSMutableArray * _data1;
    NSMutableArray * _data2;
    NSMutableArray * _data3;
    NSInteger _currentData1Index;
    NSInteger _currentData2Index;
    NSInteger _currentData3Index;
    
}

@property (nonatomic, strong) JSDropDownMenu * menu;

@end

@implementation MZMTradingAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareNav];
    [self prepareTableView];
    [self prepareDataSource];


}

- (void)prepareNav
{
    UILabel * titleLabel = [MZMControl createLabelWithFrame:CGRectMake(0, 0, 40, 20) text:@"商场商圈" font:18];
    titleLabel.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLabel;
}

#pragma mark - tableView
- (void)prepareTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 45, WIDTH, HEIGHT - 45)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

#pragma mark - tableView dataSource
- (void)prepareDataSource
{
    _dataSource = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        MZMTradingAreaModel * model = [[MZMTradingAreaModel alloc] init];
        model.areaImg = @"001";
        model.areaName = @"明珠广场";
        model.distance = [NSString stringWithFormat:@"%d米",500];
        model.shopCount = [NSString stringWithFormat:@"共有%d家好商家",20];
        model.shopNames = @"北京烤猪蹄,天籁之音KTV,永辉超市,刘一手火锅,日式料理";
        [_dataSource addObject:model];
    }
}


#pragma mark - dropMenu dataSource
- (void)prepareMenuDataSource
{
    //全部分类
    NSArray * food = @[@"全部",@"火锅",@"青年餐厅",@"自助餐",@"西餐",@"日韩料理",@"蛋糕甜点",@"烧烤烤鱼",@"川湘菜",@"江浙菜"];
    NSArray * hotel = @[@"快捷宾馆",@"商务酒店",@"星级酒店",@"招待所"];
    
    //距离
    NSArray * nearby = @[@"全城",@"300米",@"500米",@"1000米",@"3000米"];
    NSArray * recommend = @[@"全城",@"包河路",@"大润发",@"天鹅湖",@"明珠广场",@"步行街"];
    
    
    _data1 = [NSMutableArray arrayWithObjects:@{@"title":@"美食",@"data":food},@{@"title":@"酒店",@"data":hotel}, nil];
    _data2 = [NSMutableArray arrayWithObjects:@{@"title":@"附近",@"data":nearby},@{@"title":@"推荐商圈",@"data":recommend}, nil];
    _data3 = [NSMutableArray arrayWithObjects:@"智能排序",@"离我最近",@"好评优先",@"折扣最低",@"人气最高", nil];
}

#pragma mark - 下拉菜单UI
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

#pragma  mark - menuDelegate
//下拉菜单栏数
- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu
{
    return 3;
}

//是否放置collection
- (BOOL)displayByCollectionViewInColumn:(NSInteger)column
{
    return NO;
}

//是否拥有右侧菜单
- (BOOL)haveRightTableViewInColumn:(NSInteger)column
{
    if (column == 0 || column == 1) {
        return YES;
    }else
        return NO;
}

//左侧菜单宽度
- (CGFloat)widthRatioOfLeftColumn:(NSInteger)column
{
    if (column == 0 || column == 1) {
        return 0.3;
    }else
        return 1;
}

//判断选中左侧栏
- (NSInteger)currentLeftSelectedRow:(NSInteger)column
{
    if (column == 0) {
        return _currentData1Index;
    }else if (column == 1){
        return _currentData2Index;
    }else if (column == 3){
        return _currentData3Index;
    }
    
    return 0;
}

- (NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow
{
    if (column == 0 ) {
        if (leftOrRight == 0) {
            return _data1.count;
        }else{
            NSDictionary * menuDic = [_data1 objectAtIndex:leftRow];
            return [[menuDic objectForKey:@"data"] count];
        }
    }else if (column == 1){
        if (leftOrRight == 0) {
            return _data2.count;
        }else{
            NSDictionary * menuDic2 = [_data2 objectAtIndex:leftRow];
            return [[menuDic2 objectForKey:@"data"] count];
        }
    }else if (column == 2){
        return _data3.count;
    }
    
    return 0;
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column
{
    switch (column) {
        case 0:
            return [[_data1[0] objectForKey:@"data"] objectAtIndex:0];
            break;
        case 1:
            return [[_data2[0] objectForKey:@"data"] objectAtIndex:0];
            break;
        case 2:
            return _data3[0];
            break;
        default:
            return nil;
            break;
    }
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForRowAtIndexPath:(JSIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        if (indexPath.leftOrRight == 0) {
            NSDictionary * menuDic = [_data1 objectAtIndex:indexPath.row];
            return [menuDic objectForKey:@"title"];
        }else{
            NSInteger leftRow = indexPath.leftRow;
            NSDictionary * menuDic = [_data1 objectAtIndex:leftRow];
            return [[menuDic objectForKey:@"data"] objectAtIndex:indexPath.row];
        }
    } else if (indexPath.column == 1){
        if (indexPath.leftOrRight == 0) {
            NSDictionary * menuDic2 = [_data2 objectAtIndex:indexPath.row];
            return [menuDic2 objectForKey:@"title"];
        }else{
            NSInteger leftRow2 = indexPath.leftRow;
            NSDictionary * menuDic2 = [_data2 objectAtIndex:leftRow2];
            return [[menuDic2 objectForKey:@"data"] objectAtIndex:indexPath.row];
        }
    }else{
        return _data3[indexPath.row];
    }
}

- (void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        if (indexPath.leftOrRight == 0) {
            _currentData1Index = indexPath.row;
        }
    }else if (indexPath.column == 1){
        if (indexPath.leftOrRight == 0) {
            _currentData2Index = indexPath.row;
        }
    }else{
        _currentData3Index = indexPath.row;
    }
}

#pragma mark - tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"cell";
    MZMTradingAreaCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MZMTradingAreaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    //取出数据
    MZMTradingAreaModel * model = [_dataSource objectAtIndex:indexPath.row];
    [cell configModel:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController * nextVc = nil;
    if (indexPath > 0) {
        nextVc = [[MZMTradingAreaViewController alloc] init];
    }
    [self.navigationController pushViewController:nextVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
