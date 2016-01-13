//
//  MZMControl.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/24.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMControl.h"

@implementation MZMControl


// 创建View
+ (UIView *)createViewWithFrame:(CGRect)frame
{
    UIView * view = [[UIView alloc] initWithFrame:frame];
    return view;
}

//创建imageView
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
}

//创建Button
+ (UIButton *)createButtonWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font imageName:(NSString *)imageName bgImageName:(NSString *)bgImageName target:(id)target sel:(SEL)method
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:text forState:UIControlStateNormal];
    if (imageName) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    if (bgImageName) {
        [button setBackgroundImage:[UIImage imageNamed:bgImageName]  forState:UIControlStateNormal];
    }
    if (text) {
        [button setTitle:text forState:UIControlStateNormal];
    }
    return button;
}

//创建Label
+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font
{
    UILabel * label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = [UIFont systemFontOfSize:font];
    return label;
}


@end
