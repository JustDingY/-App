//
//  MZMIndentityViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/5.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMIndentityViewController.h"

@interface MZMIndentityViewController ()

@end

@implementation MZMIndentityViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    self.view.backgroundColor = MZMBackColor;
    [self prepareUI];
}

- (void)prepareUI
{
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, WIDTH, 132)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    
    UITextField * nameField = [[UITextField alloc] initWithFrame:CGRectMake(15, 2, WIDTH - 30, 40)];
    nameField.placeholder = @"真实姓名";
    nameField.borderStyle = UITextBorderStyleNone;
    nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    nameField.backgroundColor = [UIColor whiteColor];
    [backView addSubview:nameField];
    
    UITextField * IDField = [[UITextField alloc] initWithFrame:CGRectMake(15, 46, WIDTH - 30, 40)];
    IDField.placeholder = @"身份证号";
    IDField.borderStyle = UITextBorderStyleNone;
    IDField.clearButtonMode = UITextFieldViewModeWhileEditing;
    IDField.backgroundColor = [UIColor whiteColor];
    [backView addSubview:IDField];
    
    UITextField * emailField = [[UITextField alloc] initWithFrame:CGRectMake(15, 90, WIDTH - 30, 40)];
    emailField.placeholder = @"邮箱账号";
    emailField.keyboardType = UIKeyboardTypeEmailAddress;
    emailField.borderStyle = UITextBorderStyleNone;
    emailField.clearButtonMode = UITextFieldViewModeWhileEditing;
    emailField.backgroundColor = [UIColor whiteColor];
    [backView addSubview:emailField];
    
    
    UIButton * submitBtn = [MZMControl createButtonWithFrame:CGRectMake(15, CGRectGetMaxY(backView.frame)+ 40, WIDTH - 30, 44) text:@"提交" font:18 imageName:@"" bgImageName:@"" target:self sel:@selector(submitBtnClick)];
    [submitBtn setBackgroundColor:MZMColor];
    submitBtn.layer.masksToBounds = YES;
    submitBtn.layer.cornerRadius = submitBtn.height * 0.1;
    [self.view addSubview:submitBtn];
    
    for (int i = 0 ; i < 2; i++) {
        UIImageView * view1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, i * backView.height, WIDTH, 1)];
        view1.backgroundColor = MZMCOLOR(215, 215, 215, 1);
        [backView addSubview:view1];
    }
    
    for (int j = 0; j < 2; j++) {
        UIImageView * view2 = [[UIImageView alloc] initWithFrame:CGRectMake(nameField.x, 44 + j* 44, WIDTH - nameField.x, 1)];
        view2.backgroundColor = MZMCOLOR(215, 215, 215, 1);
        [backView addSubview:view2];
    }
}

- (void)submitBtnClick
{
    MZMLog(@"提交");
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
