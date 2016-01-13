//
//  MZMPasswordForgottenController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/15.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMPasswordForgottenController.h"

@interface MZMPasswordForgottenController()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField * userTelField;
@property (nonatomic, strong) UITextField * pwdField;
@property (nonatomic, strong) UITextField * confirmPwdField;
@property (nonatomic, strong) UITextField * messageField;
@property (nonatomic, strong) UIButton * messageBtn;

@end

@implementation MZMPasswordForgottenController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel * titleLabel = [MZMControl createLabelWithFrame:CGRectMake(0, 0, 60, 30) text:@"修改密码" font:20];
    titleLabel.textColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = titleLabel;
    
    UIButton * submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame = CGRectMake(0, 0, 30, 20);
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:submitBtn];
    
    [self.navigationItem setRightBarButtonItem:rightItem];
}

- (void)submitBtnClick
{
    MZMLog(@"提交修改密码");
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (UITextField *)userTelField
{
    if (!_userTelField) {
        _userTelField = [[UITextField alloc] initWithFrame:CGRectMake(20, 0, WIDTH - 40, 44)];
        _userTelField.placeholder = @"手机号";
        
        _userTelField.borderStyle = UITextBorderStyleNone;
        _userTelField.keyboardType = UIKeyboardTypeNumberPad;
        _userTelField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _userTelField;
}

- (UITextField *)pwdField
{
    if (!_pwdField) {
        _pwdField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(_userTelField.frame), 0, _userTelField.width, _userTelField.height)];
        
        _pwdField.placeholder = @"新密码";
        _pwdField.borderStyle = UITextBorderStyleNone;
        _pwdField.keyboardType = UIKeyboardTypeDefault;
        [_pwdField setSecureTextEntry:YES];
        _pwdField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _pwdField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    }
    return _pwdField;
}

- (UITextField *)confirmPwdField
{
    if (!_confirmPwdField) {
        _confirmPwdField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(_userTelField.frame), 0, _userTelField.width, _userTelField.height)];
        _confirmPwdField.placeholder = @"确认新密码";
        _confirmPwdField.borderStyle = UITextBorderStyleNone;
        _confirmPwdField.keyboardType = UIKeyboardTypeDefault;
        [_confirmPwdField setSecureTextEntry:YES];
        _confirmPwdField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _pwdField.autocapitalizationType = UITextAutocapitalizationTypeNone;

    }
    return _confirmPwdField;
}

- (UITextField *)messageField
{
    if (!_messageField) {
        _messageField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(_userTelField.frame), 0, WIDTH*0.55, 44)];
        _messageField.placeholder = @"验证码";
        _messageField.font = [UIFont systemFontOfSize:20];
        _messageField.textAlignment = NSTextAlignmentLeft;
    }
    return _messageField;
}

- (UIButton *)messageBtn
{
    if (!_messageBtn) {
        _messageBtn = [MZMControl createButtonWithFrame:CGRectMake(CGRectGetMaxX(_messageField.frame), 0, WIDTH * 0.4, 44) text:@"获取短信验证码" font:15 imageName:@"" bgImageName:@"" target:self sel:@selector(messageClick)];
//        [_messageBtn setTintColor:MZMCOLOR(198, 198, 198, 1)];
        [_messageBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_messageBtn setBackgroundColor:MZMColor];
    }
    return _messageBtn;
}



#pragma mark - textField的方法
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString * content = [_userTelField text];
    if (content.length == 0) {
        [_messageBtn setUserInteractionEnabled:NO];
        [_messageBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }else{
        [_messageBtn setUserInteractionEnabled:YES];
        [_messageBtn setTitleColor:MZMColor forState:UIControlStateNormal];
    }
}

- (void)messageClick
{
    MZMLog(@"获取短信验证码");
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@""];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        [cell.contentView addSubview:self.userTelField];
    }else if (indexPath.row ==1){
        [cell.contentView addSubview:self.pwdField];
    }else if (indexPath.row == 2){
        [cell.contentView addSubview:self.confirmPwdField];
//        [cell.contentView addSubview:self.messageBtn];
    }else if (indexPath.row == 3){
        [cell.contentView addSubview:self.messageField];
        [cell.contentView addSubview:self.messageBtn];
    }
    return cell;
}


@end
