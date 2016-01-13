//
//  MZMPersonalHeaderView.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/4.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMPersonalHeaderView.h"

@implementation MZMPersonalHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, WIDTH, HEIGHT * 0.2);
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI
{
    //背景图片
    UIImageView * backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, self.height)];
    backView.image = [UIImage imageNamed:@"profile_header_bg"];
    [self addSubview:backView];
    
    //头像背景
    UIImageView * headerBackView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.height * 0.65, self.height * 0.65)];
    headerBackView.backgroundColor = MZMCOLOR(255, 255, 255, 0.2);
    headerBackView.layer.masksToBounds = YES;
    headerBackView.layer.cornerRadius = headerBackView.width * 0.5;

    [self addSubview:headerBackView];
    
    //头像
    UIButton * headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headerBtn.frame = CGRectMake(0, 0, headerBackView.width * 0.9, headerBackView.height * 0.9);
    [headerBtn setImage:[UIImage imageNamed:@"007"] forState:UIControlStateNormal];
    [headerBtn addTarget:self action:@selector(headerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    headerBtn.centerX = headerBackView.centerX;
    headerBtn.centerY = headerBackView.centerY;
    
    headerBtn.layer.masksToBounds = YES;
    headerBtn.layer.cornerRadius = headerBtn.width * 0.5;
    
    [self addSubview:headerBtn];
}

- (void)headerBtnClick
{
    MZMLog(@"更换头像");
}

@end
