//
//  MZMBusinessViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/3.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMBusinessViewController.h"
#import "MZMBusinessInfoView.h"
#import "MZMGoodsCategoryView.h"
#import "MZMAppraiseView.h"
#define pageCount 3

@interface MZMBusinessViewController()<UIScrollViewDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) MZMBusinessInfoView * infoView;
@property (nonatomic, strong) MZMGoodsCategoryView * categoryView;
@property (nonatomic, strong) MZMAppraiseView * appraiseView;
@property (nonatomic, strong) UIImageView * topBack;
@property (nonatomic, strong) UIImageView * redLineView;
@property (nonatomic, strong) UIScrollView * scrollView;

@end

@implementation MZMBusinessViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, WIDTH * pageCount, HEIGHT);

    
    //店铺名称
    UILabel * titleLabel = [MZMControl createLabelWithFrame:CGRectMake(0, 0, 60, 30) text:@"门面详情" font:18];
    titleLabel.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLabel;
    
    //设置导航栏右边按钮
    UIButton * collectionBtn = [MZMControl createButtonWithFrame:CGRectMake(0, 0, 25, 25) text:@"" font:10 imageName:@"icon_collection" bgImageName:@"" target:self sel:@selector(collectionBtnClick:)];

    UIBarButtonItem * collectionItem = [[UIBarButtonItem alloc] initWithCustomView:collectionBtn];
    [self.navigationItem setRightBarButtonItem:collectionItem];
    
    [self prepareTopBackground];
    [self prepareBtns];
    [self prepareScrollView];
    [self prepareBusinessInfoView];
    [self prepareCategoryView];
    [self prepareAppraiseView];
    
}

#pragma mark - 导航栏按钮点击方法
- (void)collectionBtnClick:(UIButton *)btn
{
    MZMLog(@"收藏按钮");
}

- (void)shareBtnClick:(UIButton *)btn
{
    MZMLog(@"分享按钮");
}

#pragma mark - 顶部背景
- (void)prepareTopBackground
{
    _topBack = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 44)];
    _topBack.backgroundColor = MZMCOLOR(255, 255, 255, 1);
    _topBack.userInteractionEnabled = YES;
    [self.view addSubview:_topBack];
}

#pragma mark - 顶部按钮
- (void)prepareBtns
{
    NSArray * btnArr = @[@"商家",@"商品分类",@"评价"];
    for (int i = 0; i < btnArr.count; i++) {
        NSString *btnText = btnArr[i];
        UIButton *btn = [MZMControl createButtonWithFrame:CGRectMake(WIDTH / btnArr.count * i, 0, WIDTH / btnArr.count, 40) text:btnText font:18 imageName:@"" bgImageName:@"" target:self sel:@selector(btnClick:)];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:MZMCOLOR(195, 39, 43, 1)  forState:UIControlStateSelected];
        btn.tag = 2000+i;
        if (0 == i) {
            btn.selected = YES;
        }
        [self.topBack addSubview:btn];
    }
    _redLineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, WIDTH / btnArr.count, 4)];
    _redLineView.image = [UIImage imageNamed:@"icon_line_red"];
    _redLineView.tag = 1999;
    [self.topBack addSubview:_redLineView];
}

- (void)btnClick:(UIButton*)btn
{
    for (UIView * view in _topBack.subviews) {
        if (view.tag != 1999) {
            ((UIButton *)view).selected = NO;
        }
    }
    //当前偏移量
    NSInteger index = btn.tag - 2000;
    btn.selected = YES;
    [UIImageView animateWithDuration:0.3 animations:^{
        _redLineView.centerX = btn.centerX;
        _scrollView.contentOffset = CGPointMake(index*WIDTH, 0);
    }];
}

#pragma mark - 创建ScrollView
- (void)prepareScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, WIDTH, HEIGHT- 64-44)];
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(WIDTH * pageCount, HEIGHT-64-44);
    _scrollView.backgroundColor = MZMCOLOR(179, 179, 179, 1);
    self.scrollView = _scrollView;
    _scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
}

#pragma mark - 商家展示页面
- (void)prepareBusinessInfoView
{
    _infoView = [[MZMBusinessInfoView alloc] init];
    _infoView.frame = CGRectMake(0, 0, WIDTH, self.scrollView.height);
    [self.scrollView addSubview:self.infoView];
    self.infoView = _infoView;
}

#pragma mark - 商品分类页面
- (void)prepareCategoryView
{
    _categoryView = [[MZMGoodsCategoryView alloc] init];
    _categoryView.frame = CGRectMake(WIDTH, 0, WIDTH, self.scrollView.height);
    [self.scrollView addSubview:self.categoryView];
    self.categoryView = _categoryView;
}

#pragma mark - 评价页面
- (void)prepareAppraiseView
{
    _appraiseView = [[MZMAppraiseView alloc] init];
    _appraiseView.frame = CGRectMake(WIDTH * 2, 0, WIDTH, self.scrollView.height);
    [self.scrollView addSubview:_appraiseView];
    self.appraiseView = _appraiseView;
}

#pragma mark - scrollView的代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    for (UIView * view in _topBack.subviews) {
        if (view.tag != 1999) {
            ((UIButton *)view).selected = NO;
        }
    }
    //偏移量
    int page =  _scrollView.contentOffset.x/WIDTH;
    UIButton * currentBtn = (UIButton *)[_topBack viewWithTag:2000+page];
    
    UIImageView * sliderView = [_topBack viewWithTag:1999];
    CGPoint sldCenter = sliderView.center;
    
    sldCenter.x = currentBtn.center.x;
    
    [UIImageView animateWithDuration:0.3 animations:^{
        //        _redLineView.centerX = sliderView.centerX;
        sliderView.center = sldCenter;
        currentBtn.selected = YES;
        //        _scrollView.contentOffset = CGPointMake(WIDTH * page, 0);
    }];
}

@end
