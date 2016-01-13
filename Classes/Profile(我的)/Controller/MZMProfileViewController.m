//
//  MZMProfileViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/16.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMProfileViewController.h"

#import "MZMPersonalViewController.h"
#import "MZMLoginViewController.h"

//section 0
#import "MZMWalletViewController.h"
#import "MZMCashViewController.h"
//section 1
#import "MZMCollectionViewController.h"
#import "MZMEvaluateViewController.h"
//section 2
#import "MZMIndentityViewController.h"
#import "MZMSettingViewContrller.h"
//section 3
#import "MZMContactViewController.h"

#import "MZMProfileHeadView.h"

//#import <ImageIO/ImageIO.h>
//#import "UIScrollView+Associated.h"

#import "MZMProfileModel.h"
#import "MZMProfileCell.h"

@interface MZMProfileViewController ()<UIScrollViewDelegate>
{
    double oldY;
}

@property (nonatomic, strong) MZMProfileHeadView * headerView;
@property (nonatomic, strong) NSMutableArray *arrM;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, strong) NSArray * data;

@end

@implementation MZMProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MZMCOLOR(248, 248, 248, 1);
    
    self.tableView.showsHorizontalScrollIndicator = NO;
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
//    self.tableView.bounces = NO;
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self prepareDataSource];
    [self prepareNav];
    [self prepareHeaderView];

}

#pragma mark - 准备导航栏

- (void)prepareNav
{
    UIButton * leftButton = [MZMControl createButtonWithFrame:CGRectMake(0, 0, 40, 20) text:@"登陆" font:14 imageName:@"" bgImageName:@"" target:self sel:@selector(loginClick)];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.scrollView.delegate = self;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
//    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)prepareHeaderView
{
    //创建头视图
    _headerView = [[MZMProfileHeadView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT * 0.2)];
    self.tableView.tableHeaderView = _headerView;
    
    //添加点击手势
    UITapGestureRecognizer * tapClick = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [_headerView addGestureRecognizer:tapClick];
}

#pragma mark - 准备数据源
- (void)prepareDataSource
{
    _dataSource = [[NSMutableArray alloc] init];
    _data = @[@[@[@"icon_card",@"孝心卡",@"NO.2338918914801"],
                @[@"icon_wallet",@"我的钱包",@""],
                @[@"profile_cash_icon",@"我的收款账号",@""]
                ],
              @[@[@"profile_collection_icon",@"我的收藏",@""],
                @[@"profile_evaluate_icon",@"我的评价",@""]
                ],
              @[@[@"profile_ identity_icon",@"身份验证",@""],
                @[@"icon_setting",@"设置",@""]
                ],
              @[@[@"icon_feedBack",@"意见反馈",@""]
                ]
            ];
    for (int i = 0; i < _data.count; i++) {
        NSArray * arrSection = _data[i];
        for (int j = 0; j < arrSection.count; j++) {
            NSArray * arrRow = arrSection[j];
            //创建模型
            MZMProfileModel * model = [[MZMProfileModel alloc] init];
            model.cellImg = arrRow[0];
            model.cellName = arrRow[1];
            model.cellDetail = arrRow[2];
            
            [_dataSource addObject:model];
        }
    }

}

//登陆按钮点击方法
- (void)loginClick
{
    MZMLoginViewController * loginVc = [[MZMLoginViewController alloc] init];
    [self.navigationController pushViewController:loginVc animated:YES];
//    [self.navigationController presentViewController:loginVc animated:YES completion:nil];
}

//设置按钮点击方法
- (void)settingClick
{
    MZMSettingViewContrller * settingPage = [[MZMSettingViewContrller alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:settingPage animated:YES];
}

#pragma mark - 点击手势响应
- (void)tapClick
{
    MZMPersonalViewController * personalPage = [[MZMPersonalViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:personalPage animated:YES];
}



#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self.data objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    MZMProfileCell * cell = [tableView dequeueReusableCellWithIdentifier:@""];
    if(!cell)
    {
        cell = [[MZMProfileCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@""];
    }
    
    //取出数据
    if (indexPath.section == 0) {
        MZMProfileModel * model = self.dataSource[indexPath.row];
        [cell configModel:model];
    }else if (indexPath.section == 1){
        MZMProfileModel * model = self.dataSource[indexPath.section + indexPath.row + 2];
        [cell configModel:model];
    }else if (indexPath.section == 2){
        MZMProfileModel * model = self.dataSource[indexPath.section + indexPath.row + 3];
        [cell configModel:model];
    }else {
        MZMProfileModel * model = self.dataSource[indexPath.section + indexPath.row + 4];
        [cell configModel:model];
    }
    

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController * nextVc = nil;

    switch (indexPath.section) {
            
        case 0:
            if (indexPath.row == 1){
                //钱包
                nextVc = [[MZMWalletViewController alloc] init];
            }else if (indexPath.row == 2){
                //收款账号
                nextVc = [[MZMCashViewController alloc] init];
            }
            break;
            
        case 1:
            if (indexPath.row == 0){
                //收藏
                nextVc = [[MZMCollectionViewController alloc] init];
            }else if (indexPath.row ==1){
                //评价
                nextVc = [[MZMEvaluateViewController alloc] initWithStyle:UITableViewStyleGrouped];
            }
            break;
            
        case 2:
            if (indexPath.row == 0) {
                //身份验证
                nextVc = [[MZMIndentityViewController alloc] init];
            }else if (indexPath.row == 1){
                //设置
                nextVc = [[MZMSettingViewContrller alloc] initWithStyle:UITableViewStyleGrouped];
            }
            break;
        case 3:
            //意见反馈
            nextVc = [[MZMContactViewController alloc] init];
            break;
            
        default:
            break;
            
    }
    [self.navigationController pushViewController:nextVc animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
