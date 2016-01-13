//
//  MZMAccountSettingView.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/14.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMAccountSettingView.h"

@interface MZMAccountSettingView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITextField * userNameField;
@property (nonatomic, strong) UITextField * passwordField;
@property (nonatomic, strong) UITextField * messageField;
@property (nonatomic, strong) UIButton * messageBtn;

@end

@implementation MZMAccountSettingView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (UITextField *)userNameField
{
    if (!_userNameField) {
        _userNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 5, 150, 30)];
        _userNameField.placeholder = @"请输入手机号";
        _userNameField.keyboardType = UIKeyboardTypeNumberPad;
        _userNameField.borderStyle = UITextBorderStyleNone;
    }
    return _userNameField;
}

- (UITextField *)passwordField
{
    if (!_passwordField) {
        _passwordField = [[UITextField alloc] initWithFrame:CGRectMake(20, 5, 150, 30)];
        _passwordField.placeholder = @"请输入密码";
        _passwordField.keyboardType = UIKeyboardTypeDefault;
        _passwordField.borderStyle = UITextBorderStyleNone;
    }
    return _passwordField;
}

- (UITextField *)messageField
{
    if (!_messageField) {
        _messageField = [[UITextField alloc] initWithFrame:CGRectMake(0, 5, 30, 30)];
        _messageField.placeholder = @"短信验证码";
        _messageField.keyboardType = UIKeyboardTypeNumberPad;
        _messageField.borderStyle = UITextBorderStyleNone;
    }
    return _messageField;
}

- (UIButton *)messageBtn
{
    if (!_messageBtn) {
        _messageBtn = [MZMControl createButtonWithFrame:CGRectMake(WIDTH - 150, 0, 150, 44) text:@"获取短信验证码" font:18 imageName:@"" bgImageName:@"" target:self sel:@selector(messageBtnClick)];
        [_messageBtn setBackgroundColor:MZMColor];
    }
    return _messageBtn;
}

- (void)messageBtnClick
{
    
}


- (NSInteger)numberOfSections
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@""];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
        
    }
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"icon_userName"];
        [cell.contentView addSubview:self.userNameField];
    }else if (indexPath.row == 1){
        cell.imageView.image = [UIImage imageNamed:@"icon_password"];
        [cell.contentView addSubview:self.passwordField];
    }else if (indexPath.row == 2){
        [cell.contentView addSubview:self.messageBtn];
    }
    
    return cell;
}
@end
