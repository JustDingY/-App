//
//  MZMAddPaymentViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/5.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMAddPaymentViewController.h"

@interface MZMAddPaymentViewController ()

@end

@implementation MZMAddPaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = MZMBackColor;
    
    [self prepareNav];
    [self prepareUI];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)prepareNav
{
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    titleLabel.text = @"支付账号设置";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    
    self.navigationItem.titleView = titleLabel;

    UIButton * submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame = CGRectMake(0, 0, 40, 20);
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];

    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:submitBtn];
    [self.navigationItem setRightBarButtonItem:rightItem];
    
}

- (void)prepareUI
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 20, WIDTH, 44)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UILabel * namelabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 6, 40, 30)];
    namelabel.text = @"账号:";
    namelabel.textColor = [UIColor blackColor];
    [view addSubview:namelabel];
    
    UITextField * contentField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(namelabel.frame)+10, 8, WIDTH - 120, 30)];
    contentField.placeholder = @"填写您的支付宝账号";
    contentField.textColor = [UIColor grayColor];
    contentField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [view addSubview:contentField];
    
}

- (void)submitBtnClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
