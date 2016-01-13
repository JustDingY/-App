//
//  MZMNavigationController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/16.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMNavigationController.h"
#import "MZMMessageViewController.h"
@interface MZMNavigationController ()

@end

@implementation MZMNavigationController

+ (void)initialize
{

    //设置整个项目所有的item样式
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    
    //设置普通样式
    NSMutableDictionary * textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //设置不可用状态
    NSMutableDictionary * disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count >0) {
        
        //非根页面
        viewController.hidesBottomBarWhenPushed = YES;
        
        //设置子控制器标题颜色
        UILabel * titleLabel = [[UILabel alloc] init];
        titleLabel.text = viewController.title;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.frame = CGRectMake(0, 0, 100, 30);
        titleLabel.font = [UIFont systemFontOfSize:20];
        titleLabel.textColor = [UIColor whiteColor];
        
        viewController.navigationItem.titleView = titleLabel;
        
    
        /*设置导航栏上面的按钮*/
        //左边  返回按钮
//        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"icon_back" highImage:@"icon_back"];
        
        //自定义返回按钮
        UIImage *backButtonImage = [[UIImage imageNamed:@"icon_back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        //将返回按钮的文字position设置不在屏幕上显示
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
        

    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 开启
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)back
{

    [self popViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
