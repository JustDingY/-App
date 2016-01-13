//
//  MZMHomeViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/16.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMHomeViewController.h"
#import "MZMSeachBar.h"
#import "MZMMessageViewController.h"
#import "MZMTest1ViewController.h"
#import "MZMDropdownMenu.h"
#import "MZMSearchPageViewController.h"
#import "MZMBusinessViewController.h"
#import "MZMMessageViewController.h"

#import "MZMMenuButton.h"
//#import "MJRefresh.h"


#import "MZMHomeBusinessModel.h"
#import "MZMHomeBusinessCell.h"
#import "MZMCellTitleView.h"

#import "MZMCaseAreaViewController.h"
#import "MZMMoreViewController.h"

#import "MZMPicScrollView.h"
#import "MZMMoreViewController.h"


#define MZMAdCount 2
@interface MZMHomeViewController ()<MZMDropdownMenuDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

{
    NSMutableArray * _dataSource;
}

@property (nonatomic, strong) UIView * headerView;
@property (nonatomic, strong) MZMPicScrollView * adScrollView;
@property (nonatomic, strong) UIButton * menuBtn;

@property (nonatomic, strong) NSMutableArray *arrM;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation MZMHomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = MZMBackColor;
    
    page = 0;
    [self prepareNav];
    [self prepareHeader];
    [self prepareDataSource];
    
//    //下拉刷新
//    [self.tableView addLegendHeaderWithRefreshingBlock:^{
//        page = 0;
//        [self loadData];
//    }];
//    
//    //上拉加载
//    [self.tableView addLegendFooterWithRefreshingBlock:^{
//        page = page +10;
//        [self loadData];
//    }];
//    
//    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    
//    [self.tableView.header beginRefreshing];

}

#pragma mark - 导航栏
- (void)prepareNav
{
    //创建搜索框按钮
    UIButton * searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(0, 0, 150, 30);
    
    [searchBtn setImage:[UIImage imageNamed:@"HomePageSH_searchBack_bg"] forState:UIControlStateNormal];
    [searchBtn setImage:[UIImage imageNamed:@"HomePageSH_searchBack_bg"] forState:UIControlStateHighlighted];
    
    
    //搜索框按钮显示文字
    UILabel * searchLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 90, 30)];
    searchLabel.text = @"搜点感兴趣的...";
    searchLabel.textColor = [UIColor lightGrayColor];
    searchLabel.font = [UIFont systemFontOfSize:12];
    searchLabel.textAlignment = NSTextAlignmentCenter;
    [searchBtn addSubview:searchLabel];
    
    
    [searchBtn addTarget:self action:@selector(searchPage) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = searchBtn;
    
    //左按钮
    MZMMenuButton * areaBtn = [[MZMMenuButton alloc] init];
    [areaBtn setTitle:@"蜀山区" forState:UIControlStateNormal];
    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithCustomView:areaBtn];
    [areaBtn addTarget:self action:@selector(areaBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];

    //右按钮
    UIButton * msgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    msgBtn.frame = CGRectMake(0, 0, 30, 60);
    [msgBtn setImage:[UIImage imageNamed:@"icon_message_home"] forState:UIControlStateNormal];
    msgBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
    UIBarButtonItem * rigthItem = [[UIBarButtonItem alloc] initWithCustomView:msgBtn];
    [msgBtn addTarget:self action:@selector(messageBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:rigthItem];
    
//    //设置导航栏
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];

}

#pragma mark - 头视图
- (void)prepareHeader
{
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT * 0.55)];
    self.tableView.tableHeaderView = _headerView;
    [self createAdScroll];
    [self createButtonView];
}

/**
 *  创建动态滚动广告
 */
- (void)createAdScroll
{
    NSMutableArray * adArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < MZMAdCount; i++) {
        [adArr addObject:[NSString stringWithFormat:@"ad_Banner%d.png",i]];
    }
    _adScrollView = [[MZMPicScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, _headerView.height * 0.55) withImageNames:adArr];
    _adScrollView.backgroundColor = [UIColor clearColor];
    _adScrollView.style = PageControlAtCenter;
    [_adScrollView setImageViewDidTapAtIndex:^(NSInteger index) {
        printf("你点到我了😳index:%zd\n",index);
    }];
    _adScrollView.AutoScrollDelay = 5.0f;
    [_headerView addSubview:_adScrollView];
    
}

/**
 *  创建分类按钮栏
 */
- (void)createButtonView
{
    UIImageView * menuBackView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_adScrollView.frame), WIDTH, _headerView.height* 0.45)];
    menuBackView.image = [UIImage imageNamed:@"menupage_picture_background"];
    menuBackView.userInteractionEnabled = YES;
    [_headerView addSubview:menuBackView];
    
    //按钮名称
    NSArray * menuBtnArr = @[@"menupage_food_normal",@"menupage_shopping_normal",@"menupage_restaurant_normal",@"menupage_movie_normal",
                             @"menupage_life_normal",@"menupage_amusement_normal",@"menupage_travel_normal",@"menupage_more_normal"];
    //循环放置按钮
    for (int i = 0; i < menuBtnArr.count; i++) {
        
        NSString * menuBtnName = [menuBtnArr objectAtIndex:i];
        _menuBtn = [MZMControl createButtonWithFrame:CGRectMake((i % 4)* WIDTH / 4, (i /4) * menuBackView.height / 2, WIDTH / 4, menuBackView.height * 0.5) text:nil font:12 imageName:menuBtnName bgImageName:nil target:self sel:@selector(menuBtnClick:)];
        _menuBtn.tag = 201+ i;
        _menuBtn.userInteractionEnabled = YES;
        [menuBackView addSubview:_menuBtn];
        
    }
}

- (void)menuBtnClick:(UIButton *)menuBtn
{
    MZMLog(@"%ld",(long)menuBtn.tag);
    if(menuBtn.tag == 208){
        
        MZMMoreViewController * moreVc = [[MZMMoreViewController alloc] init];
        [self.navigationController pushViewController:moreVc animated:YES];
        
    }
}

#pragma mark - DataSource
- (void)prepareDataSource
{
    _dataSource = [[NSMutableArray alloc] init];
    for (int i = 0; i < 11; i ++) {
        MZMHomeBusinessModel * model = [[MZMHomeBusinessModel alloc] init];
        model.shopPicUrl = @"defalutbg_floor_item";
        model.shopName = @"北京烤猪蹄";
        model.shopType = @"200米   |    美食";
        model.shopIntroduce = @"我请您吃蒸羊羔,蒸熊掌,蒸鹿尾儿,烧花鸭,烧雏鸡儿,烧子鹅,卤煮咸鸭,酱鸡,腊肉,松花,小肚儿,晾肉,香肠,什锦苏盘,熏鸡,白肚儿,清蒸八宝猪,江米酿鸭子";
        model.shoplevel = @"icon_star_group";
        model.shopDiscount = @"9.2";
        
        [_dataSource addObject:model];
    }
    
}

//#pragma 载入数据
//- (void)loadData
//{
//    MZMHttpDownload * request = [[MZMHttpDownload alloc] initWithURLString:[NSString stringWithFormat:self.strUrl,page] block:^(BOOL isSucceed, MZMHttpDownload * http) {
//        if (isSucceed) {
//            
//        }
//        //刷新tableView
//        [self.tableView reloadData];
//        
//
//    }];
//}

#pragma mark - 搜索按钮点击
- (void)searchPage
{
    MZMSearchPageViewController * searchPage = [[MZMSearchPageViewController alloc] init];
    
    [self.navigationController pushViewController:searchPage animated:YES];
}

#pragma mark - 地区按钮点击方法
- (void)areaBtnClick:(UIButton *)whichBtn
{
//    //1、创建下拉菜单
//    MZMDropdownMenu * menu = [MZMDropdownMenu menu];
//    menu.delegate = self;
//    //2、创建菜单内容
//    UIImageView * menuView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 300)];
//    menuView.image = [UIImage imageNamed:@"bg_deal_mergeFooter"];
//    menuView.userInteractionEnabled = YES;
//    //3、显示
//    menu.content = menuView;
//    [menu showFrom:whichBtn];

    MZMMoreViewController * VC = [[MZMMoreViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)areaChangeBtn
{
    MZMTest1ViewController * test1 = [[MZMTest1ViewController alloc] init];
    test1.title = @"地区选择";
    [self.navigationController pushViewController:test1 animated:YES];
}

#pragma mark - 消息按钮点击
- (void)messageBtn
{
    MZMMessageViewController * message = [[MZMMessageViewController alloc] init];
    message.title = @"消息中心";
    [self.navigationController pushViewController:message animated:YES];

}

#pragma mark - 分类按钮点击方法



#pragma mark - DropdownMenuDelegate
/*
    下拉菜单被销毁
 */
- (void)dropdownMenuDidDismiss:(MZMDropdownMenu *)menu
{
    UIButton * leftBtn = (UIButton *)self.navigationItem.leftBarButtonItem;
    leftBtn.selected = NO;
}

/*
 下拉菜单被创建
 */

- (void)dropdownMenuDidShow:(MZMDropdownMenu *)menu
{
    UIButton * leftBtn = (UIButton *)self.navigationItem.leftBarButtonItem;
    leftBtn.selected = YES;
}




#pragma mark - TableView data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section == 0) {
//        return 25;
//    }else
        return 110;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 25;
    }else
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        MZMCellTitleView * view = [[MZMCellTitleView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 25)];
        view.backgroundColor = [UIColor whiteColor];
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(view.frame), WIDTH, 1)];
        imageView.backgroundColor = MZMBackColor;
        [view addSubview:imageView];
        return view;
    }else
        return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * ID = @"cell";
    MZMHomeBusinessCell * cellNomal = [tableView dequeueReusableCellWithIdentifier:ID];
        
    if (!cellNomal) {
        cellNomal = [[MZMHomeBusinessCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    //取出数据
    MZMHomeBusinessModel * model = [_dataSource objectAtIndex:indexPath.row];
    [cellNomal configModel:model];
    
    return cellNomal;

    
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


@end
