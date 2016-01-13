//
//  MZMDetailCollectionViewCell.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/12.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMDetailCollectionViewCell.h"

@implementation MZMDetailCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        self.backgroundColor = [UIColor colorWithRed:0.774 green:0.768 blue:0.931 alpha:1.000];
    }
    return self;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

@end
