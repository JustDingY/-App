//
//  MZMLoginView.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/10.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMLoginViewController.h"
#import "MZMTabBarController.h"
#import "MZMPasswordForgottenController.h"
#import "MZMRecommandRegisterViewController.h"
#import "MZMFreedomRegisterViewController.h"
@implementation MZMLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel * titleLabel = [MZMControl createLabelWithFrame:CGRectMake(0, 0, 60, 30) text:@" 登 陆" font:20];
    titleLabel.textColor = [UIColor whiteColor];
    
    //取消底部黑线
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.navigationController.navigationBar.translucent = NO;
    
    
    self.navigationItem.titleView = titleLabel;
    
    [self prepareUI];
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
//}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"tabBar_background"] forBarMetrics:UIBarMetricsDefault];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)prepareUI
{
    //底纹
    UIImageView * backView = [MZMControl createImageViewWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) imageName:@"login_background_pic"];
    [self.view addSubview:backView];
    
    //顶部图片
    UIImageView * topView = [MZMControl createImageViewWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT*0.3) imageName:@"login_headback_pic"];
    [self.view addSubview:topView];
    
    //用户图标
    UIImageView * userImg = [MZMControl createImageViewWithFrame:CGRectMake(0, 0, 50, 44) imageName:@"login_user_icon"];
    
    //用户名栏
    UITextField * userNameField = [[UITextField alloc] initWithFrame:CGRectMake(WIDTH * 0.06,CGRectGetMaxY(topView.frame)+30, WIDTH*0.86, 44)];
    userNameField.borderStyle = UITextBorderStyleRoundedRect;
    userNameField.placeholder = @"请输入用户名";
    userNameField.keyboardType = UIKeyboardTypeNumberPad;
    userNameField.leftView = userImg;
    userNameField.leftViewMode = UITextFieldViewModeAlways;
    userNameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:userNameField];
    
    //密码图标
    UIImageView * pwdImg = [MZMControl createImageViewWithFrame:CGRectMake(0, 0, 50, 44) imageName:@"login_password_icon"];
    [self.view addSubview:pwdImg];
    
    //密码栏
    UITextField * pwdField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(userNameField.frame), CGRectGetMaxY(userNameField.frame)+30, userNameField.width, 44)];
    pwdField.borderStyle = UITextBorderStyleRoundedRect;
    pwdField.placeholder = @"请输入登录密码";
    pwdField.leftView = pwdImg;
    pwdField.leftViewMode = UITextFieldViewModeAlways;
    pwdField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [pwdField setSecureTextEntry:YES];
    [self.view addSubview:pwdField];
    
    //登陆
    UIButton * loginBtn = [MZMControl createButtonWithFrame:CGRectMake(0, 0, WIDTH - 200, 50) text:@"登陆" font:20 imageName:@"" bgImageName:@"" target:self sel:@selector(loginClick)];
    [loginBtn setBackgroundColor:MZMColor];
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.cornerRadius = loginBtn.height * 0.1;
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.centerX = WIDTH * 0.5;
    loginBtn.y = CGRectGetMaxY(pwdField.frame)+25;
    [self.view addSubview:loginBtn];
    
    //立即注册
    UIButton * registerBtn = [MZMControl createButtonWithFrame:CGRectMake(WIDTH * 0.5 - 95, CGRectGetMaxY(loginBtn.frame)+52.5, 80, 44) text:@"立即注册" font:18 imageName:@"" bgImageName:@"" target:self sel:@selector(registerClick)];
    [registerBtn setTitleColor:MZMCOLOR(102, 102, 102, 1) forState:UIControlStateNormal];
    [self.view addSubview:registerBtn];
    
    //忘记密码
    UIButton * forgetBtn = [MZMControl createButtonWithFrame:CGRectMake(CGRectGetMaxX(registerBtn.frame)+30, registerBtn.y, registerBtn.width, registerBtn.height) text:@"忘记密码" font:18 imageName:@"" bgImageName:@"" target:self sel:@selector(forgetClick)];
    [forgetBtn setTitleColor:MZMCOLOR(102, 102, 102, 1) forState:UIControlStateNormal];
    [self.view addSubview:forgetBtn];
    
    //竖线
    UIImageView * vertical = [MZMControl createImageViewWithFrame:CGRectMake(0, CGRectGetMinY(registerBtn.frame), 2, 18) imageName:@"login_vertical_icon"];
    vertical.centerX = WIDTH * 0.5;
    vertical.centerY = registerBtn.centerY;
    [self.view addSubview:vertical];
    
}

- (void)loginClick
{

}

- (void)registerClick
{
    UIAlertController * registerType = [UIAlertController alertControllerWithTitle:@"选择您的账号种类" message:@"如非推荐用户，请选择自有用户注册，如有问题请联系民之梦客服400-9669-161" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction * recommendationAction = [UIAlertAction actionWithTitle:@"商家推荐注册" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        MZMRecommandRegisterViewController * recRegisterVc = [[MZMRecommandRegisterViewController alloc] init];
        [self.navigationController pushViewController:recRegisterVc animated:YES];
//        [self.navigationController presentViewController:recRegisterVc animated:YES completion:nil];
    }];
    UIAlertAction * freedomAction = [UIAlertAction actionWithTitle:@"自由用户注册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        MZMFreedomRegisterViewController * freeRegisterVc = [[MZMFreedomRegisterViewController alloc] init];
        [self.navigationController pushViewController:freeRegisterVc animated:YES];
    }];

    [registerType addAction:cancelAction];
    [registerType addAction:recommendationAction];
    [registerType addAction:freedomAction];
    
    [self presentViewController:registerType animated:YES completion:nil];
    
    
}

- (void)forgetClick
{
    MZMPasswordForgottenController * forggtonVc = [[MZMPasswordForgottenController alloc] init];
//    [self.navigationController pushViewController:forggtonVc animated:YES completion:nil];
    [self.navigationController pushViewController:forggtonVc animated:YES];
}

- (void)skipClick
{

}

@end
