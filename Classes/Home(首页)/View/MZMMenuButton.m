//
//  MZMMenuButton.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/8.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMMenuButton.h"

@implementation MZMMenuButton

- (id)initWithFrame:(CGRect)frame
{
   self = [super initWithFrame:frame];
    if (self) {
        
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setImage:[UIImage imageNamed:@"icon_indicator_down"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"icon_indicator_up"] forState:UIControlStateSelected];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    double maxX = CGRectGetMaxX(self.titleLabel.frame);
    //文字靠左
    self.titleLabel.x = 0;
//    double maxX = CGRectGetMaxX(self.titleLabel.frame);
    //图片靠右
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    self.imageView.centerY = self.titleLabel.centerY;
    
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    
    [self sizeToFit];
}



@end
