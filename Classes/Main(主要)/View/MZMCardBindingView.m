//
//  MZMCardBindingView.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/15.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMCardBindingView.h"

@interface MZMCardBindingView()

@property (nonatomic, strong) UITextField * cardField;

@end

@implementation MZMCardBindingView

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
    UIImageView * backImage = [MZMControl createImageViewWithFrame:CGRectMake(0, 20, WIDTH, 57) imageName:@"login_squareness_pic"];
    [self addSubview:backImage];
    
    UIImageView * cardImg = [MZMControl createImageViewWithFrame:CGRectMake(20, 10, 30, 15) imageName:@"login_card_pic"];
    
    _cardField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, backImage.width - 20, backImage.height)];
    _cardField.placeholder = @"请输入孝心卡卡号";
    _cardField.borderStyle = UITextBorderStyleNone;
    _cardField.keyboardType = UIKeyboardTypeNumberPad;

    _cardField.leftView = cardImg;
    _cardField.leftViewMode = UITextFieldViewModeAlways;
    
    _cardField.clearButtonMode = UITextFieldViewModeAlways;
    
    [backImage addSubview:_cardField];

}


@end
