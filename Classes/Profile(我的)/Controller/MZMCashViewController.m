//
//  MZMCashViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/5.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMCashViewController.h"
#import "MZMAddPaymentViewController.h"

@interface MZMCashViewController ()

@property (nonatomic, strong) UILabel * paymentIDLabel;

@end

@implementation MZMCashViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = MZMCOLOR(248, 248, 248, 1);
    
    [self prepareNav];
    [self prepareUI];
}

- (void)prepareNav
{
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    titleLabel.text = @"收款账号";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    
    self.navigationItem.titleView = titleLabel;
}

- (void)prepareUI
{
//    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 20, WIDTH, 44)];
//    view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view];
    
    UIButton * view = [MZMControl createButtonWithFrame:CGRectMake(0, 20, WIDTH, 44) text:@"" font:10 imageName:@"" bgImageName:@"" target:self sel:@selector(viewClick)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 6, 80, 30)];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.text = @"支付宝账号:";
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:15];
    [view addSubview:nameLabel];
    
    UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame)+5, 6, WIDTH - 180, 30)];
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.text = @"gdpandgjq@foxmail.com";
    contentLabel.textColor = MZMCOLOR(79, 79, 79, 1);
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.backgroundColor = [UIColor yellowColor];
    [view addSubview:contentLabel];
    
    UILabel * modifyLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 80, 6, 60, 30)];
    modifyLabel.text = @"修改";
    modifyLabel.textAlignment = NSTextAlignmentCenter;
    modifyLabel.textColor = [UIColor grayColor];
    modifyLabel.font = [UIFont systemFontOfSize:15];
    modifyLabel.backgroundColor = [UIColor redColor];
    [view addSubview:modifyLabel];
    
}

- (void)viewClick
{
    MZMAddPaymentViewController * addPaymentVc = [[MZMAddPaymentViewController alloc] init];
    [self.navigationController pushViewController:addPaymentVc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}















@end
