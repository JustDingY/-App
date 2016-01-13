//
//  MZMLogin&RegisterViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/14.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMRecommandRegisterViewController.h"
#import "MZMCardBindingView.h"
#import "MZMRecommandCheckingView.h"
#import "MZMAccountSettingView.h"
#import "MZMRegisterCompleteView.h"

@interface MZMRecommandRegisterViewController ()

@property (nonatomic, strong) UIView * topView;

@end

@implementation MZMRecommandRegisterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareTopUI];
    [self setUpNav];
    self.view.backgroundColor = MZMCOLOR(235, 235, 235, 1);
}

- (void)prepareTopUI
{
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
    _topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_topView];

    NSArray * labelArr = @[@"推荐验证 >",@"设置账号 >",@"绑定孝心卡 >",@"完成"];
    for (int i = 0; i < labelArr.count; i++) {
        UILabel * stepLabel = [MZMControl createLabelWithFrame:CGRectMake((WIDTH / 4) * i, 0, 60, 30) text:labelArr[i] font:15];
        stepLabel.tag = 100 + i;
        stepLabel.textAlignment = NSTextAlignmentLeft;
        stepLabel.textColor = [UIColor grayColor];
        if (stepLabel.tag == 100) {
            stepLabel.textColor = MZMColor;
        }
        [_topView addSubview:stepLabel];
    }
}

- (void)setUpNav
{
    UIButton * nextStepBtn = [MZMControl createButtonWithFrame:CGRectMake(0, 0, 60, 30) text:@"下一步" font:15 imageName:nil bgImageName:nil target:self sel:@selector(nextStepClick)];
    UIBarButtonItem * rigthItem = [[UIBarButtonItem alloc] initWithCustomView:nextStepBtn];
    [self.navigationItem setRightBarButtonItem:rigthItem];
}

- (void)nextStepClick
{
    
}

- (void)recommandationViewShow
{
    MZMRecommandCheckingView * checkingView = [[MZMRecommandCheckingView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_topView.frame)+20, WIDTH - 40, HEIGHT - 100)];
    [self.view addSubview:checkingView];
}

- (void)MZMAccountSettingViewShow
{
    MZMAccountSettingView * accountSettingView = [[MZMAccountSettingView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_topView.frame)+20, WIDTH - 40, HEIGHT -100)];
    [self.view addSubview:accountSettingView];
}

- (void)cardBindingViewShow
{
    MZMCardBindingView * bindingView = [[MZMCardBindingView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_topView.frame)+20, WIDTH - 40, HEIGHT -100)];
    [self.view addSubview:bindingView];
}

- (void)registerCompleteViewShow
{
    MZMRegisterCompleteView * completeView = [[MZMRegisterCompleteView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_topView.frame)+20, WIDTH - 40, HEIGHT -100)];
    [self.view addSubview:completeView];
}

@end
