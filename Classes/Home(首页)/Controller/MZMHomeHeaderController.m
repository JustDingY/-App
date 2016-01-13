//
//  MZMHomeHeaderController.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/13.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMHomeHeaderController.h"
#import "MZMPicScrollView.h"
#import "MZMMoreViewController.h"

#define MZMAdCount 2

@interface MZMHomeHeaderController ()

@property (nonatomic, weak) UIPageControl * pageControl;
@property (nonatomic, strong) MZMPicScrollView * adScrollView;
@property (nonatomic ,strong) UIButton * menuBtn;

@end

@implementation MZMHomeHeaderController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, WIDTH, HEIGHT * 0.55);
    [self createAdScroll];
    [self createButtonView];
}

/**
 *  创建动态滚动广告
 */
- (void)createAdScroll
{
    NSMutableArray * adArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < MZMAdCount; i++) {
        [adArr addObject:[NSString stringWithFormat:@"ad_Banner%d.png",i]];
    }
    _adScrollView = [[MZMPicScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, self.view.height * 0.55) withImageNames:adArr];
    _adScrollView.backgroundColor = [UIColor clearColor];
    _adScrollView.style = PageControlAtCenter;
    [_adScrollView setImageViewDidTapAtIndex:^(NSInteger index) {
        printf("你点到我了😳index:%zd\n",index);
    }];
    _adScrollView.AutoScrollDelay = 5.0f;
    [self.view addSubview:_adScrollView];
    
}

/**
 *  创建分类按钮栏
 */
- (void)createButtonView
{
    UIImageView * menuBackView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_adScrollView.frame), WIDTH, self.view.height * 0.45)];
    menuBackView.image = [UIImage imageNamed:@"menupage_picture_background"];
    menuBackView.userInteractionEnabled = YES;
    [self.view addSubview:menuBackView];
    
    //按钮名称
    NSArray * menuBtnArr = @[@"menupage_food_normal",@"menupage_shopping_normal",@"menupage_restaurant_normal",@"menupage_movie_normal",
                             @"menupage_life_normal",@"menupage_amusement_normal",@"menupage_travel_normal",@"menupage_more_normal"];
    //循环放置按钮
    for (int i = 0; i < menuBtnArr.count; i++) {
        
        NSString * menuBtnName = [menuBtnArr objectAtIndex:i];
        _menuBtn = [MZMControl createButtonWithFrame:CGRectMake((i % 4)* WIDTH / 4, (i /4) * menuBackView.height / 2, WIDTH / 4, menuBackView.height * 0.5) text:nil font:12 imageName:menuBtnName bgImageName:nil target:self sel:@selector(menuBtnClick:)];
        _menuBtn.tag = 201+ i;
        _menuBtn.userInteractionEnabled = YES;
        [menuBackView addSubview:_menuBtn];
        
    }
}

- (void)menuBtnClick:(UIButton *)menuBtn
{
    MZMLog(@"%ld",(long)menuBtn.tag);
    if(menuBtn.tag == 208){

        MZMMoreViewController * moreVc = [[MZMMoreViewController alloc] init];
        [self.navigationController pushViewController:moreVc animated:YES];

    }
}
@end
