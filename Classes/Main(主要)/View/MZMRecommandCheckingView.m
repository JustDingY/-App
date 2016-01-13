//
//  MZMRecommandCheckingView.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/15.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMRecommandCheckingView.h"

@interface MZMRecommandCheckingView()

@property (nonatomic, strong) UITextField * businessTelField;
@property (nonatomic, strong) UIButton *scanningBtn;

@end

@implementation MZMRecommandCheckingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI
{
    //背景图片
    UIImageView * backImage = [MZMControl createImageViewWithFrame:CGRectMake(0, 20, WIDTH, 57) imageName:@"login_squareness_pic"];
    [self addSubview:backImage];
    
    UIImageView * userImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//    [userImg setImage:[UIImage imageNamed:@"icon_userName"]];
    userImg.image = [UIImage imageNamed:@"icon_userName"];
    
    //输入框
    _businessTelField.frame = CGRectMake(20, 0, 200, 57);
    _businessTelField.placeholder = @"推荐者手机号";
    _businessTelField.borderStyle = UITextBorderStyleNone;
    _businessTelField.keyboardType = UIKeyboardTypeNumberPad;
    
    _businessTelField.leftView = userImg;
    _businessTelField.leftViewMode = UITextFieldViewModeAlways;
    
    _businessTelField.clearButtonMode = UITextFieldViewModeAlways;
    [backImage addSubview:self.businessTelField];
    
    //扫描按钮
    UIButton * scanBtn = [MZMControl createButtonWithFrame:CGRectMake(WIDTH - 75, 0, 57, 57) text:@"" font:10 imageName:@"" bgImageName:@"login_scanning_pic" target:self sel:@selector(scanBtnClick)];
    [backImage addSubview:scanBtn];
    
}

- (void)scanBtnClick
{
    
}













@end
