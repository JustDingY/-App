//
//  MZMSearchPageViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/19.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMSearchPageViewController.h"
#import "MZMSeachBar.h"
@interface MZMSearchPageViewController ()

@property (nonatomic, strong) UIButton * cleanBtn;
@property (nonatomic, strong) UICollectionView * hotView;
@property (nonatomic, strong) UICollectionView * collectionView;

@end

@implementation MZMSearchPageViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = MZMCOLOR(237, 237, 237, 1);
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
   
    self.tableView.frame = CGRectMake(0, 0, WIDTH, [self.tableView numberOfRowsInSection:1]* 44);
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self prepareSearchBar];
    [self prepareConformBtn];

}

- (void)prepareSearchBar
{
    MZMSeachBar * searchBar = [MZMSeachBar searchBar];
    searchBar.borderStyle = UITextBorderStyleRoundedRect;
    searchBar.frame = CGRectMake(0, 0, 260, 30);
    self.navigationItem.titleView = searchBar;
}

- (void)prepareConformBtn
{
    
    UIButton * searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(0, 0, 50, 20);
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    
    [self.navigationItem setRightBarButtonItem:rightItem];
}

- (void)prepareCollectionView
{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 5;
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    flowLayout.itemSize = CGSizeMake(50, (WIDTH - 30)/3);
    flowLayout.headerReferenceSize = CGSizeMake(WIDTH, 20);
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, WIDTH, 55*3) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = MZMCOLOR(249, 249, 249, 1);
    
    //注册cell的类
    [_collectionView registerClass:[UIButton class] forCellWithReuseIdentifier:@"buttons"];
    
}

- (void)searchClick
{
    MZMLog(@"开始搜索");
}


- (UIButton *)cleanBtn
{
    if (!_cleanBtn) {
        _cleanBtn = [MZMControl createButtonWithFrame:CGRectMake(0, 0, WIDTH, 44) text:@"清除搜索记录" font:15 imageName:@"" bgImageName:@"" target:self sel:@selector(cleanBtnClick)];

        [_cleanBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
    }
    return _cleanBtn;
}

#pragma mark - 清除搜索记录按钮方法
- (void)cleanBtnClick
{
    MZMLog(@"清除搜索记录");
}

#pragma mark - 实现collectionView协议方法
- (NSInteger)countOfCollectionView
{
    return 1;
}

#pragma mark - cell分割线左端对齐
-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}



#pragma mark - tableView的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@""];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    }
    
    
    
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    UIView * backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor whiteColor];
    
    cell.backgroundView = backgroundView;
    if (indexPath.row == 10) {
        [cell.contentView addSubview:self.cleanBtn];
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageView.image = [UIImage imageNamed:@"icon_search_record"];
        cell.textLabel.text = @"圣龙书画商务酒店";
        cell.textLabel.textColor = MZMCOLOR(129, 129, 129, 1);
    }
    return  cell;
}


@end
