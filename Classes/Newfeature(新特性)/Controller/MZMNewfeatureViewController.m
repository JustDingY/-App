//
//  MZMNewfeatureViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/17.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMNewfeatureViewController.h"
#import "MZMTabBarController.h"
#define MZMNewfeatureCount 3
@interface MZMNewfeatureViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl * pageControl;
@property (nonatomic, strong) UIScrollView * scrollView;

@end

@implementation MZMNewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //新建scrollView
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = self.view.bounds;

    
    CGFloat scrollW = _scrollView.width;
    CGFloat scrollH = _scrollView.height;
    
    //添加图片
    for (int i = 0; i < MZMNewfeatureCount; i++) {
        
        UIImageView * imageView = [[UIImageView alloc] init];        
        imageView.frame = CGRectMake(scrollW * i, 0, scrollW, scrollH);
        
        //显示图片
        NSString * name = [NSString stringWithFormat:@"new_feature_%d",i+1];
        imageView.image = [UIImage imageNamed:name];
        
        [_scrollView addSubview:imageView];
        
        
        if (i == MZMNewfeatureCount - 1) {
            [self setupLastImageView:imageView];
        }
    }
    
    //scrollView的其它属性
    //垂直方向不能滚动
    _scrollView.contentSize = CGSizeMake(MZMNewfeatureCount * _scrollView.width, 0);
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    
    //添加分页
    //展示目前页码
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    _pageControl.numberOfPages = MZMNewfeatureCount;
//    不设置pageControl的宽高即可关闭交互效果
//    _pageControl.width = 100;
//    _pageControl.height = 30;
    _pageControl.userInteractionEnabled = YES;
//
    _pageControl.centerX = scrollW * 0.5;
    _pageControl.centerY = scrollH - 50;
    _pageControl.enabled = YES;
    _pageControl.backgroundColor = [UIColor yellowColor];
    
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.pageIndicatorTintColor = [UIColor blackColor];

    [self scrollViewDidScroll:_scrollView];
    
    [self.view addSubview:_pageControl];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / scrollView.width;
    //计算当前页码
    _pageControl.currentPage = (int)(page + 0.5);
    
}

- (void)setupLastImageView:(UIImageView *)imageView
{
    imageView.userInteractionEnabled = YES;
    
    //开始体验
    UIButton * startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"start_Btn"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
//    startBtn.size = startBtn.currentBackgroundImage.size;
//    startBtn.centerX = WIDTH * 0.5;
//    startBtn.centerY = HEIGHT * 0.7;
    startBtn.frame = CGRectMake(WIDTH * 0.5 - 45, HEIGHT * 0.75, 90, 30);
    
    
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView addSubview:startBtn];
    
}

- (void)startClick
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[MZMTabBarController alloc] init];
    
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
