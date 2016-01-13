//
//  MZMTabBarController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/16.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMTabBarController.h"
#import "MZMHomeViewController.h"
#import "MZMNearbyViewController.h"
#import "MZMMerchantViewController.h"
#import "MZMProfileViewController.h"
#import "MZMNavigationController.h"

@interface MZMTabBarController ()

@end

@implementation MZMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //初始化子控制器
    MZMHomeViewController * homeVc = [[MZMHomeViewController alloc] init];
    [self addChildVc:homeVc title:@"首页" image:@"tabBar_home" selectedImage:@"tabBar_home"];
    
    MZMNearbyViewController * selectionVc = [[MZMNearbyViewController alloc] init];
    [self addChildVc:selectionVc title:@"附近" image:@"tabBar_nearby" selectedImage:@"tabBar_nearby"];
    
    MZMMerchantViewController * merchantVc = [[MZMMerchantViewController alloc] init];
    [self addChildVc:merchantVc title:@"商家" image:@"tabBar_store" selectedImage:@"tabBar_store"];
    
    MZMProfileViewController * profileVc = [[MZMProfileViewController alloc] init];
    [self addChildVc:profileVc title:@"我的" image:@"tabBar_profile" selectedImage:@"tabBar_profile"];
    
}



- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    
    self.tabBar.itemWidth = WIDTH / 4;
    //tabBar按钮选中颜色
    self.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"tabBar_selected"];
    
    //tabBar背景颜色
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBar_background"]];
    
    //设置自控制器的文字
    childVc.title = title;
    
    //设置子控制器标题颜色
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.frame = CGRectMake(0, 0, 100, 30);
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = [UIColor whiteColor];
    
    childVc.navigationItem.titleView = titleLabel;
    
    
    //设置自控制器的图片
    //添加渲染
    
    //普通样式
    UIImage * normal = [UIImage imageNamed:image];
    normal = [normal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.image = normal;
    
    //选中样式
    UIImage * selected = [UIImage imageNamed:selectedImage];
    selected = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selected;
    
    //设置文字样式
    NSMutableDictionary * textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    
    NSMutableDictionary * selectedTextAttributes = [NSMutableDictionary dictionary];
    selectedTextAttributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
    
    MZMNavigationController * nav = [[MZMNavigationController alloc] initWithRootViewController:childVc];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"tabBar_background"] forBarMetrics:UIBarMetricsDefault];
    [self addChildViewController:nav];
    
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
    
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
}

//- (void)setSelectedIndex:(NSUInteger)selectedIndex
//{
//    
//}
//
//- (void)setNoHighlistTabBar:(UITabBarController *)
//{

//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
