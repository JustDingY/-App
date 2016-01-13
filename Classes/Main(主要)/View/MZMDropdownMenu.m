//
//  MZMDropdownMenu.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/18.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMDropdownMenu.h"


@interface MZMDropdownMenu()

//将来显示具体内容的容器
@property(nonatomic,weak) UIImageView * containerView;

@end

@implementation MZMDropdownMenu

- (UIImageView *)containerView
{
    if (!_containerView) {
        
        //添加一个图片控件
        UIImageView * containerView = [[UIImageView alloc] init];
        containerView.image = [UIImage imageNamed:@"bg_deal_mergeFooter"];
        containerView.frame = CGRectMake(0, 64, WIDTH, 400);

        containerView.userInteractionEnabled = YES;//交互
        [self addSubview:containerView];
        self.containerView = containerView;
    }
    
    return _containerView;

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置半透明背景
        self.backgroundColor = [UIColor colorWithRed:93/255.0 green:93/255.0 blue:93/255.0 alpha:0.35];
        
    }
    
    return self;
}

+ (instancetype)menu
{
    return [[self alloc] init];
}


//内容的set
- (void)setContent:(UIView *)content
{
    _content = content;
    
    //设置内容的位置
    content.x = 20;
    content.y = 30;
    
    //设置内容的宽度
    //    content.width = self.containerView.width - 2 * content.x;
    
    //设置外围图片的尺寸
    self.containerView.height = CGRectGetMaxY(content.frame) + 10;
    self.containerView.width = CGRectGetMaxX(content.frame) + 10;
    
    //添加内容到图片中去
    [self.containerView addSubview:content];
    
}

//内容控制器的set
- (void)setContentCtroller:(UIViewController *)contentCtroller
{
    _contentCtroller = contentCtroller;
    self.content = contentCtroller.view;
}




//显示
- (void)showFrom:(UIView *)from
{
    //获取最上层窗口
    UIWindow * window = [[UIApplication sharedApplication].windows lastObject];
//    window.backgroundColor = [UIColor colorWithRed:93/255.0 green:93/255.0 blue:93/255.0 alpha:0.35];
    
    
    //将自身添加到窗口
    [window addSubview:self];
    
    //设置尺寸
    self.frame = window.bounds;
//    self.frame = CGRectMake(0, 0, self.window.width, self.window.height);
    
    //调整下拉菜单的位置（弹出view的位置）
//    self.containerView.y = 70;
    
    //转换坐标系原点
    CGRect newFrame = [from convertRect:from.bounds fromView:window];
    self.containerView.y = CGRectGetMaxY(newFrame);
    self.containerView.x = CGRectGetMinX(newFrame);
    
    
    //通知外界  自己被显示了
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidShow:)]) {
        [self.delegate dropdownMenuDidShow:self];
    }

    
}

//销毁
- (void)dismiss
{
    [self removeFromSuperview];
    
    //通知外界  自己被销毁了
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidDismiss:)]) {
        [self.delegate dropdownMenuDidDismiss:self];
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
    
}




@end
