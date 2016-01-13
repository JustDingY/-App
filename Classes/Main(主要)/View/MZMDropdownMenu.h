//
//  MZMDropdownMenu.h
//  民之梦App
//
//  Created by 韩少龙 on 15/11/18.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MZMDropdownMenu;

@protocol MZMDropdownMenuDelegate <NSObject>
@optional
- (void)dropdownMenuDidDismiss:(MZMDropdownMenu *)menu;
- (void)dropdownMenuDidShow:(MZMDropdownMenu *)menu;
@end

@interface MZMDropdownMenu : UIView
@property(nonatomic,weak)id<MZMDropdownMenuDelegate> delegate;

+ (instancetype)menu;

//显示
- (void)showFrom:(UIView *)from;

//销毁
- (void)dismiss;


//内容
@property(nonatomic,strong) UIView * content;


//内容控制器
@property(nonatomic,strong) UIViewController * contentCtroller;

@end
