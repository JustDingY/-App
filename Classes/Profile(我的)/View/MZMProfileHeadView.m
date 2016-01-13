//
//  MZMProfileHeadView.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/30.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMProfileHeadView.h"

@interface MZMProfileHeadView ()

@property (nonatomic, strong) UIView * headerView;
@property (nonatomic, strong) UIImageView * profileBackImageView;
@property (nonatomic, strong) UIImageView * headBackImageView;
@property (nonatomic, strong) UIImageView * headImageView;
@property (nonatomic, strong) UIButton * firstBtn;
@property (nonatomic, strong) UIButton * secondBtn;
@property (nonatomic, strong) UIButton * thirdBtn;
@property (nonatomic, strong) UILabel * nickNameLabel;
@property (nonatomic, strong) UILabel * telLabel;
@property (nonatomic, strong) UIImageView * twoDView;
@property (nonatomic, strong) UIButton * twoDBtn;
@property (nonatomic, strong) UIImageView * rightView;

@end

@implementation MZMProfileHeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 64, WIDTH, HEIGHT * 0.22);
        [self prepareUI];
    }
    
    return self;
}

- (void)prepareUI
{
    //头部背景
    _profileBackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, self.height)];
    _profileBackImageView.image = [UIImage imageNamed:@"profile_header_bg"];
    [self addSubview:self.profileBackImageView];
    
    //头像背景图
    _headBackImageView = [MZMControl createImageViewWithFrame:CGRectMake(WIDTH * 0.054, WIDTH * 0.054, HEIGHT * 0.112, HEIGHT * 0.112) imageName:@""];
    _headBackImageView.backgroundColor = MZMCOLOR(255, 255, 255, 0.2);
    _headBackImageView.layer.masksToBounds = YES;
    _headBackImageView.contentMode = UIViewContentModeScaleToFill;
    _headBackImageView.layer.cornerRadius = _headBackImageView.width * 0.5;
    _headBackImageView.centerY = (self.height - WIDTH * 0.108)*0.5;
    [self addSubview:self.headBackImageView];

    
    //头像
    _headImageView = [MZMControl createImageViewWithFrame:CGRectMake(0, 0, _headBackImageView.width - 7.5, _headBackImageView.height - 7.5) imageName:@"007"];
    _headImageView.center = _headBackImageView.center;
    _headImageView.layer.masksToBounds = YES;
    _headImageView.contentMode = UIViewContentModeScaleToFill;
    _headImageView.layer.cornerRadius = _headImageView.width * 0.5;
    [self addSubview:self.headImageView];
    
    //昵称
    _nickNameLabel = [MZMControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(_headBackImageView.frame) + WIDTH * 0.034, _headBackImageView.y, WIDTH * 0.2, HEIGHT * 0.052) text:@"葛俊强" font:16];
    _nickNameLabel.textColor = [UIColor whiteColor];
    _nickNameLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.nickNameLabel];
    
    //手机号
    _telLabel = [MZMControl createLabelWithFrame:CGRectMake(_nickNameLabel.x, CGRectGetMaxY(_nickNameLabel.frame), WIDTH * 0.4, _nickNameLabel.height) text:@"手机号:18255118802" font:15];
    _telLabel.textColor = [UIColor whiteColor];
    _telLabel.adjustsFontSizeToFitWidth = YES;
    _telLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.telLabel];
    
    //二维码
    _twoDBtn = [MZMControl createButtonWithFrame:CGRectMake(WIDTH - WIDTH * 0.093 - 30, 0, WIDTH * 0.07, WIDTH * 0.07) text:@"" font:44 imageName:@"header_img_barcode" bgImageName:@"" target:self sel:@selector(twoDBtnClick)];
    _twoDBtn.centerY = _headImageView.centerY;
    [self addSubview:self.twoDBtn];
    
    
    //前进箭头
    _rightView = [MZMControl createImageViewWithFrame:CGRectMake(WIDTH - 30, 0, 30, 30) imageName:@"icon_right_white"];
    _rightView.centerY = _headImageView.centerY;
    [self addSubview:self.rightView];
    
    //孝心卡按钮
    _firstBtn = [MZMControl createButtonWithFrame:CGRectMake(0, self.height - WIDTH* 0.108, WIDTH / 3 - 1, WIDTH* 0.108) text:@"总分红 2000" font:12 imageName:@"profile_wallet_icon" bgImageName:@"" target:self sel:@selector(firstBtnClick)];
    _firstBtn.backgroundColor = MZMCOLOR(255, 255, 255, 0.2);
    _firstBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    [self addSubview:self.firstBtn];

    
    //积分按钮
    _secondBtn = [MZMControl createButtonWithFrame:CGRectMake(WIDTH / 3 + 1, _firstBtn.y, WIDTH / 3-1, _firstBtn.height) text:@"积分 540000" font:12 imageName:@"icon_ integration" bgImageName:@"" target:self sel:@selector(secondBtnClick)];
    _secondBtn.backgroundColor = MZMCOLOR(255, 255, 255, 0.2);
    _secondBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [self addSubview:self.secondBtn];
    
    //收藏
    _thirdBtn = [MZMControl createButtonWithFrame:CGRectMake(WIDTH / 3*2 + 2, _firstBtn.y, WIDTH/3 - 2, _firstBtn.height) text:@"收藏 200家" font:12 imageName:@"icon_star" bgImageName:@"" target:self sel:@selector(thirdBtnClick)];
    _thirdBtn.backgroundColor = MZMCOLOR(255, 255, 255, 0.2);
    [self addSubview:self.thirdBtn];

}



#pragma mark - 各按钮响应方法
- (void)twoDBtnClick
{
    
}


- (void)firstBtnClick
{
    MZMLog(@"button1");
}

- (void)secondBtnClick
{
    MZMLog(@"button2");
}

- (void)thirdBtnClick
{
    MZMLog(@"button3");
}

#pragma mark - 前进label
- (UIImageView *)rightView
{
    if (!_rightView) {
    }
    return _rightView;
}




@end
