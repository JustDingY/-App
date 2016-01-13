//
//  MZMMZMBusinessInfoViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/3.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMBusinessInfoView.h"

@interface MZMBusinessInfoView()<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView * scrollView;
@property (nonatomic, weak) UIPageControl * pageControl;

@end

@implementation MZMBusinessInfoView


- (id)initWithFrame:(CGRect)frame
{
   self = [super initWithFrame:frame];
    if (self) {
        [self createScrollView];
    }
    return self;
}

- (void)createScrollView
{
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT * 0.35)];
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    
    for (int i = 0; i < 6; i++) {
        UIImageView * imageViwe = [[UIImageView alloc] initWithFrame:CGRectMake(scrollView.width * i, 0, WIDTH, scrollView.height)];
        
        NSString * name = [NSString stringWithFormat:@"00%d",i+1];
        imageViwe.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageViwe];
    }
    
    scrollView.contentSize = CGSizeMake(WIDTH * 6, 0);
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    
    //透明栏
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, scrollView.height - 30, WIDTH, 30)];
    backView.backgroundColor = MZMCOLOR(0, 0, 0, 0.2);
    [self addSubview:backView];

    
    //分页控制
    UIPageControl * pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(WIDTH - 60, 5, 20, 0)];
    pageControl.numberOfPages = 6;
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = MZMColor;
    pageControl.backgroundColor = [UIColor clearColor];
    
    pageControl.centerY = backView.height * 0.5;
    pageControl.currentPage = 0;
    [backView addSubview:pageControl];
    self.pageControl = pageControl;
    
    
    //店铺名称
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, WIDTH - 100, 10)];
    nameLabel.centerY = backView.height * 0.5;
    nameLabel.text = @"热干面管";
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:nameLabel];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / scrollView.width;
    self.pageControl.currentPage = (int)(page + 0.5);
}


- (void) setCurrentPage:(NSInteger)page {
    [self.pageControl setCurrentPage:page];
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++)
    {
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        CGSize size;
        size.height = 1;
        size.width = 1;
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
                                     size.width,size.height)];
        if (subviewIndex == page)
        {
            [subview setBackgroundColor:self.pageControl.currentPageIndicatorTintColor];
        }
        else
            [subview setBackgroundColor:self.pageControl.pageIndicatorTintColor];
    }
}

- (void)prepareUI
{
    
}

@end

























