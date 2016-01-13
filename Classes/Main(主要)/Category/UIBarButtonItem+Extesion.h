//
//  UIBarButtonItem+Extesion.h
//  民之梦App
//
//  Created by 韩少龙 on 15/11/17.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extesion)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

@end
