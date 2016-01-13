//
//  MZMControl.h
//  民之梦App
//
//  Created by 韩少龙 on 15/11/24.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MZMControl : NSObject

// 创建View
+ (UIView *)createViewWithFrame:(CGRect)frame;

//创建imageView
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName;

//创建Button
+ (UIButton *)createButtonWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font imageName:(NSString *)imageName bgImageName:(NSString *)imageName target:(id)target sel:(SEL)method;

//创建Label
+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font;


@end
