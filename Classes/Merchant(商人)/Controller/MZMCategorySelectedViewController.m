//
//  MZMCategorySelectedView.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/8.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMCategorySelectedViewController.h"
#import "JSDropDownMenu.h"

@interface MZMCategorySelectedViewController ()<JSDropDownMenuDataSource,JSDropDownMenuDelegate>
{
    NSMutableArray *_data1;
    NSMutableArray *_data2;
    NSMutableArray *_data3;
    
    NSInteger _currentData1Index;
    NSInteger _currentData2Index;
    NSInteger _currentData3Index;
}

@property (nonatomic, strong) JSDropDownMenu * menu;


@end

@implementation MZMCategorySelectedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareDataSource];
    [self prepareUI];
}

- (void)prepareDataSource
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

- (void)prepareUI
{
    _menu = [[JSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 20) andHeight:45];
    _menu.indicatorColor = MZMCOLOR(128, 128, 128, 1);
    _menu.separatorColor = MZMCOLOR(210, 210, 210, 1);
    _menu.textColor = MZMCOLOR(83, 83, 83, 1);
    
    _menu.dataSource = self;
    _menu.delegate = self;
    
    [self.view addSubview:_menu];
}

- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu
{
    return 3;
}

- (BOOL)displayByCollectionViewInColumn:(NSInteger)column
{
    return NO;
}

- (BOOL)haveRightTableViewInColumn:(NSInteger)column
{
    if (column == 0) {
        return YES;
    } else if (column == 1){
        return YES;
    }else
        return 0;
}

- (CGFloat)widthRatioOfLeftColumn:(NSInteger)column
{
    if (column == 0) {
        return 0.3;
    }else if (column == 1){
        return 0.3;
    } else
        return 1;
}

- (NSInteger)currentLeftSelectedRow:(NSInteger)column
{
    if (column == 0) {
        return _currentData1Index;
    }else if (column == 1){
        return _currentData2Index;
    }else if (column == 2){
        return _currentData3Index;
    }
    
    return 0;
}

- (NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow
{
    if (column == 0) {
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
        return  _data3.count;
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
            return [[_data2[0] objectForKey:@"data"] objectAtIndex:1];
        case 2:
            return _data3[0];
            
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
            NSDictionary * menuDic =  [_data1 objectAtIndex:leftRow];
            return [[menuDic objectForKey:@"data"] objectAtIndex:indexPath.row];
        }
        
    } else if (indexPath.column == 1){
        if (indexPath.leftOrRight == 0) {
            NSDictionary * menuDic2 = [_data2 objectAtIndex:indexPath.row];
            return [menuDic2 objectForKey:@"title"];
        } else {
            NSInteger leftRow2 = indexPath.leftRow;
            NSDictionary * menuDic2 = [_data2 objectAtIndex:leftRow2];
            return [[menuDic2 objectForKey:@"data"] objectAtIndex:indexPath.row];
        }
    } else{
        return _data3[indexPath.row];
    }
    
}

- (void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        if (indexPath.leftOrRight == 0) {
            _currentData1Index = indexPath.row;
            return;
        }
    }else if (indexPath.column == 1){
        if (indexPath.leftOrRight == 0) {
            _currentData2Index = indexPath.row;
        }
    }else {
        _currentData3Index = indexPath.row;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
