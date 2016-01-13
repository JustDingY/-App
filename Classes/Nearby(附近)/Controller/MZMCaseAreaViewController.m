//
//  MZMCaseAreaViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/9.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMCaseAreaViewController.h"
#import "MZMCaseAreaView.h"
#import "MZMBusinessViewController.h"

@interface MZMCaseAreaViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UIView * topView;
@property (nonatomic, strong) MZMCaseAreaView * areaView;

@end

@implementation MZMCaseAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareNav];
    [self prepareTopView];
    [self prepareTableView];
}

- (void)prepareNav
{
    self.view.backgroundColor = MZMBackColor;
    //导航栏标题
    UILabel * titleLabel = [MZMControl createLabelWithFrame:CGRectMake(0, 0, 100, 20) text:@"大学城" font:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLabel;
    
    //右侧按钮
    UIButton * searchBtn = [MZMControl createButtonWithFrame:CGRectMake(0, 0, 40, 20) text:nil font:10 imageName:@"search_icon_header" bgImageName:nil target:self sel:@selector(searchBtnClick)];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    [self.navigationItem setRightBarButtonItem:rightItem];
    
}

- (void)prepareTopView
{
    NSArray * topColumn = @[@"美食",@"购物",@"生活",@"其它"];
    
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 45)];
    _topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    
    for (int i = 1; i < topColumn.count; i++) {
        UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH / topColumn.count * i, 0, 0.5, 35)];
        view.backgroundColor = MZMCOLOR(215, 215, 215, 1);

        view.centerY = _topView.height * 0.5;
        view.tag = 1000;
        [_topView addSubview:view];
    }
    
    for (int j = 0; j < topColumn.count; j++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(WIDTH / topColumn.count * j, 0, WIDTH / topColumn.count, _topView.height);
        button.tag = 1001 + j;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitle:topColumn[j] forState:UIControlStateNormal];
        [button setTitleColor:MZMCOLOR(102, 102, 102, 1) forState:UIControlStateNormal];
        [button setTitleColor:MZMColor forState:UIControlStateSelected];
        [button addTarget:self action:@selector(topBtnsCLick:) forControlEvents:UIControlEventTouchUpInside];
        [_topView addSubview:button];
    }
}

- (void)prepareTableView
{
    _areaView = [[MZMCaseAreaView alloc] initWithFrame:CGRectMake(0, 45, WIDTH, HEIGHT - 45)];
    [self.view addSubview:self.areaView];
    self.areaView = _areaView;
}

#pragma mark - 搜索按钮响应
- (void)searchBtnClick
{
    
}

- (void)topBtnsCLick:(UIButton*)button
{
    MZMLog(@"%ld",(long)button.tag);
    for (UIView * view in _topView.subviews) {
        if (view.tag !=1000) {
            ((UIButton *)view).selected = NO;
        }
    }
    button.selected = YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController * nextVc = nil;
    if (indexPath > 0) {
        nextVc = [[MZMBusinessViewController alloc] init];
    }
    [self.navigationController pushViewController:nextVc animated:YES];
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    
}


@end
