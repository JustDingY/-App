//
//  MZMGoodsCategoryViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/4.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMGoodsCategoryView.h"

@implementation MZMGoodsCategoryView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareBtn];
    }
    return self;
}

- (void)prepareBtn
{
    UIButton * btn = [MZMControl createButtonWithFrame:CGRectMake(100, 100, 100, 100) text:@"这是一个tabLeView" font:18 imageName:@"" bgImageName:@"" target:self sel:@selector(btnClick)];
    btn.backgroundColor = [UIColor yellowColor];
    [self addSubview:btn];
}

- (void)btnClick
{
    MZMLog(@"tableView");
}
@end
