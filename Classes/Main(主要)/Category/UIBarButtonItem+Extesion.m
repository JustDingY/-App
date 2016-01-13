//
//  UIBarButtonItem+Extesion.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/17.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "UIBarButtonItem+Extesion.h"

@implementation UIBarButtonItem (Extesion)

/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的item
 */

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 20, 20);

    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置图片
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
//    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    //设置尺寸
    btn.size = btn.currentBackgroundImage.size;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
