//
//  MZMRegisterCompleteView.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/16.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMRegisterCompleteView.h"

@implementation MZMRegisterCompleteView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = MZMCOLOR(128, 128, 128, 1);
    }
    return self;
}

- (void)prepareUI
{
    UIImageView * backImg = [MZMControl createImageViewWithFrame:CGRectMake(0, 0, WIDTH - 40 , HEIGHT * 0.6) imageName:@"login_completeback_pic"];
    backImg.centerX = WIDTH * 0.5;
    backImg.centerY = HEIGHT * 0.5;
    [self addSubview:backImg];
    
    UIImageView * checkImg = [MZMControl createImageViewWithFrame:CGRectMake(0, 30, 50 , 50) imageName:@"login_checkmark_pic"];
    checkImg.centerX = backImg.centerX;
    [backImg addSubview:checkImg];
    
    UILabel * checkLabel = [MZMControl createLabelWithFrame:CGRectMake(0, CGRectGetMaxY(checkImg.frame)+20, checkImg.width, 25) text:@"完成注册" font:18];
    checkLabel.centerX = checkImg.centerX;
    checkLabel.textColor = MZMColor;
    [backImg addSubview:checkLabel];
    
    UILabel * userIdLabel = [MZMControl createLabelWithFrame:CGRectMake(0, CGRectGetMaxY(checkLabel.frame)+30, backImg.width * 0.5, 30) text:@"账号:18888888888" font:20];
    userIdLabel.centerX = checkLabel.centerX;
    userIdLabel.textColor = MZMCOLOR(198, 198, 198, 1);
    [backImg addSubview:userIdLabel];
    
    UILabel * cardIdLabel = [MZMControl createLabelWithFrame:CGRectMake(0, CGRectGetMaxY(userIdLabel.frame)+10, userIdLabel.width, userIdLabel.height) text:@"卡号:200000000000" font:20];
    cardIdLabel.centerX = userIdLabel.centerX;
    cardIdLabel.textColor = MZMCOLOR(198, 198, 198, 1);
    [backImg addSubview:cardIdLabel];
    
    UIButton * startBtn = [MZMControl createButtonWithFrame:CGRectMake(0, 0, backImg.width / 3, 50) text:@"立即体验" font:20 imageName:@"" bgImageName:@"" target:self sel:@selector(startBtnClick)];
    [startBtn setBackgroundColor:MZMColor];
    [startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backImg addSubview:startBtn];
}

- (void)startBtnClick
{
    MZMLog(@"开始体验");
}

@end
