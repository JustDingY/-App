//
//  MZMAppraiseViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/28.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMAppraiseView.h"
#import "MZMAppraiseCell.h"
#import "MZMAppraiseModel.h"
#import "MZMAppraiseHeaderView.h"

@interface MZMAppraiseView ()<UITableViewDataSource,UITableViewDelegate>
{
//    UITableView * _tableView;
    NSMutableArray * _dataSource;
    MZMAppraiseCell * cell;
}

@end

@implementation MZMAppraiseView

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    self.view.backgroundColor = MZMCOLOR(215, 215, 215, 1);
//
//    [self prepareDataSource];
//    [self prepareTableView];
//}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = MZMBackColor;
        self.frame = CGRectMake(0, 1, WIDTH, HEIGHT - 64 - 44);
        self.dataSource = self;
        self.delegate = self;
        
        MZMAppraiseHeaderView * headerView = [[MZMAppraiseHeaderView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 57)];
        headerView.backgroundColor = [UIColor whiteColor];
        self.tableHeaderView = headerView;
        
        [self prepareDataSource];
    }
    return self;
}


- (void)prepareDataSource
{
    _dataSource = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i ++) {
        MZMAppraiseModel * model = [[MZMAppraiseModel alloc] init];
        model.headImageName = @"007";
        model.userName = @"背景三";
        model.message = @"近些年屋顶俯拍变得越来越流行,一名俄罗斯小伙OlegCricket更是推陈出新,加进了许多独特而又极其危险的元素。其中的一些场景中,他将自己悬挂在距离地面数百英尺的屋顶上或起重机顶上。更甚者,他由朋友抓着胳膊悬挂在高楼半空中,并拍摄了一组令人叹为观止的空中图片。";
        model.appraiseDate = @"2015-12-23";
        model.appraiseLevel = @"icon_star_group";
        
        NSMutableArray * imageNames = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 3; i++) {
            [imageNames addObject:@"defalutbg_floor_item"];
        }
        model.imageNames = imageNames;
        
        [_dataSource addObject:model];
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MZMAppraiseModel * model = [_dataSource objectAtIndex:indexPath.row];
    if (!cell) {
        cell = [[MZMAppraiseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    }
    cell.headImageName = model.headImageName;
    cell.userName = model.userName;
    cell.message = model.message;
    cell.imageNames = model.imageNames;
    cell.appraiseDate = model.appraiseDate;
    cell.appraiseLevel = model.appraiseLevel;
    
    return cell.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * celIde = @"cell";
    MZMAppraiseCell * appraiseCell = [tableView dequeueReusableCellWithIdentifier:celIde];
    if (!appraiseCell) {
        appraiseCell = [[MZMAppraiseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celIde];
    }
    //取出数据
    MZMAppraiseModel * model = [_dataSource objectAtIndex:indexPath.row];
    appraiseCell.headImageName = model.headImageName;
    appraiseCell.userName = model.userName;
    appraiseCell.message = model.message;
    appraiseCell.appraiseDate = model.appraiseDate;
    appraiseCell.appraiseLevel = model.appraiseLevel;
    appraiseCell.imageNames = model.imageNames;
    
    return appraiseCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    if (section == 0) {
//        return 50.0;
//    }
    return 1.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
