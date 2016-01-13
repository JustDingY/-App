//
//  MZMAppraiseHeaderView.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/28.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMAppraiseHeaderView.h"

@implementation MZMAppraiseHeaderView

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
    
    self.frame = CGRectMake(0, 1, WIDTH, 50);
    self.backgroundColor = [UIColor blackColor];
        
    NSArray * buttonArr = @[@"全部",@"好评",@"中评",@"差评"];
    
    for (int i = 0; i < buttonArr.count; i++) {

        UIButton * typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        typeBtn.frame = CGRectMake(15 + i * ((WIDTH - 60)/4 + 10), (self.height - 35)/2, (WIDTH - 60)/4, 35);
        
        typeBtn.layer.masksToBounds = YES;
        typeBtn.layer.cornerRadius = 0.4;
        
        //正常状态
        [typeBtn setTitle:buttonArr[i] forState:UIControlStateNormal];
        [typeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [typeBtn setBackgroundImage:[UIImage imageNamed:@"appraise_type_normal"] forState:UIControlStateNormal];
        
        //选中状态
        [typeBtn setBackgroundImage:[UIImage imageNamed:@"appraise_type_selected"] forState:UIControlStateSelected];
        
        [typeBtn addTarget:self action:@selector(appraiseBtnTypeClick:) forControlEvents:UIControlEventTouchUpInside];
        
        typeBtn.tag = 100 + i;
        if (typeBtn.tag == 100) {
            typeBtn.selected = YES;
        }
        
        [self addSubview:typeBtn];
    }

}

- (void)appraiseBtnTypeClick:(UIButton *)button
{
    for (UIView * view in self.subviews) {
        ((UIButton *)view).selected = NO;
    }

    button.selected = YES;
    MZMLog(@"执行button%ld筛选方法",button.tag);
    
}

@end
