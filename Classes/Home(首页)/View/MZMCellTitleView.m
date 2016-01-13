//
//  MZMCellTitleView.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/29.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMCellTitleView.h"

@implementation MZMCellTitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, WIDTH, 25);
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI
{
    UILabel * label = [MZMControl createLabelWithFrame:CGRectMake(10, 5, 80, 15) text:@"热门推荐  /" font:15];
    label.textColor = [UIColor blackColor];
    [self addSubview:label];

    UIImageView * hotImage = [MZMControl createImageViewWithFrame:CGRectMake(CGRectGetMaxX(label.frame), 5, 60, 20) imageName:@"img_icon_hot"];
    hotImage.centerY = label.centerY;
    
    [self addSubview:hotImage];
    
    UIButton * moreBtn = [MZMControl createButtonWithFrame:CGRectMake(WIDTH - 50, 5, 40, 15) text:@"更多" font:15 imageName:@"" bgImageName:@"" target:self sel:@selector(moreBtnClick)];
    moreBtn.centerY = label.centerY;
    [moreBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self addSubview:moreBtn];
    
}

- (void)moreBtnClick
{
    MZMLog(@"更多");
}

@end
