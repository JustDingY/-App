//
//  MZMHeaderView.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/20.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMHeaderView.h"
#define MZMAdCount 3

@interface MZMHeaderView() <UIScrollViewDelegate>

@property(nonatomic, strong) UIPageControl * pageControl;
@property(nonatomic, strong) UIScrollView * adScrollView;
@end

@implementation MZMHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createAdScroll];
        [self createButtonView];
        [self preparePageControl];
    }
    return self;
}

//+ (instancetype)view
//{
//    return [[self alloc] init];
//}

/**
 *  创建动态滚动广告
 */
- (void)createAdScroll
{
    CGFloat scrollW = self.width;
    CGFloat scrollH = self.height;
    _adScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, scrollW, scrollH * 0.55)];

    _adScrollView.contentSize = CGSizeMake(MZMAdCount * scrollW, scrollH * 0.55);
    _adScrollView.backgroundColor = [UIColor grayColor];
    
    _adScrollView.delegate = self;
    _adScrollView.bounces = NO;
    _adScrollView.showsHorizontalScrollIndicator = NO;
    _adScrollView.pagingEnabled = YES;
    _adScrollView.scrollEnabled = YES;
    _adScrollView.showsHorizontalScrollIndicator = NO;
    
    for (int i = 0 ; i < MZMAdCount; i++) {
        UIImageView * adImageView =[[UIImageView alloc] initWithFrame:CGRectMake(WIDTH * i, 0, _adScrollView.width, _adScrollView.height)];
        adImageView.image = [UIImage imageNamed:@"ad_Banner"];
        [_adScrollView addSubview:adImageView];
    }
    
    //添加时间指示器
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollScrollView:) userInfo:nil repeats:YES];
    
    [self addSubview:_adScrollView];
    
}

- (void)preparePageControl
{
    //添加分页指示器
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    _pageControl.numberOfPages = MZMAdCount;
    
    _pageControl.frame = CGRectMake(0, 0, 60, 30);
    _pageControl.backgroundColor = [UIColor yellowColor];
    _pageControl.centerX = self.width * 0.5;
    _pageControl.centerY = self.height * 0.55 - 20;
    
    
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    
    [self addSubview:_pageControl];

}

#pragma mark - 时间控制器
- (void)scrollScrollView:(UIPageControl *)pctl
{
   
}

/**
 *  创建分类按钮栏
 */
- (void)createButtonView
{
    UIImageView * menuBackView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.height * 0.55, WIDTH, self.height * 0.45)];
    menuBackView.image = [UIImage imageNamed:@"menupage_picture_background"];
    menuBackView.userInteractionEnabled = YES;
    [self addSubview:menuBackView];
    
    //按钮名称
    NSArray * menuBtnArr = @[@"menupage_icon_food",@"menupage_icon_shopping",@"menupage_icon_restaurant",@"menupage_icon_movie",@"menupage_icon_beauty",@"menupage_icon_life",@"menupage_icon_amusement",@"menupage_icon_travel",@"menupage_icon_nearby",@"menupage_icon_more"];
    //选中按钮名称
    NSArray * menuBtnSelectedArr = @[@"menupage_icon_food_highlighted",@"menupage_icon_shopping_highlighted",@"menupage_icon_restaurant_highlighted",@"menupage_icon_movie_highlighted",@"menupage_icon_beauty_highlighted",@"menupage_icon_life_highlighted",@"menupage_icon_amusement_highlighted",@"menupage_icon_travel_highlighted",@"menupage_icon_nearby_highlighted",@"menupage_icon_more_highlighted"];

    //循环放置按钮
    for (int i = 0; i < menuBtnArr.count; i++) {
        
        NSString * menuBtnName = [menuBtnArr objectAtIndex:i];
        NSString * menuBtnSelectedName = [menuBtnSelectedArr objectAtIndex:i];
        UIButton * menuBtn = [MZMControl createButtonWithFrame:CGRectMake((i%5)* WIDTH / 5, (i /5)*WIDTH / 5, WIDTH / 5, menuBackView.height * 0.5) text:@"" font:12 imageName:menuBtnName bgImageName:@"" target:self sel:@selector(menuBtnClick:)];
        menuBtn.tag = 1000+ i;
        menuBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, -20, 0);
        [menuBtn setImage:[UIImage imageNamed:menuBtnSelectedName] forState:UIControlStateHighlighted];
        [menuBackView addSubview:menuBtn];
        
    }
}


- (void)menuBtnClick:(UIButton *)menuBtn
{
    
    MZMLog(@"%ld",(long)menuBtn.tag);
}


#pragma mark - adScrollView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / scrollView.width;
    _pageControl.currentPage = (int)(page + 0.5);
}

@end
