//
//  MZMPicScrollView.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/19.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#define pageSize 16
#define myWidth self.frame.size.width
#define myHeight self.frame.size.height
#import "MZMPicScrollView.h"

@interface MZMPicScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *webImageCache;

@property (nonatomic, strong) NSArray *imageData;

@property (nonatomic, copy) NSString *cachePath;

@end


@implementation MZMPicScrollView{

    __weak   UIImageView *_leftImageView,*_centerImageView,*_rightImageView;;
    
    __weak   UILabel *_leftLabel,*_centerLabel,*_rightLabel;
    
    __weak   UIScrollView *_scrollView;
    
    __weak   UIPageControl *_pageControl;
    
    NSTimer *_timer;
   
    NSInteger _currentIndex;
    
    NSInteger _maxImageCount;
    
    BOOL _isNetWork;

    BOOL _hasTitle;
    
}

- (void)setMaxImageCount:(NSInteger)maxImageCount
{
    _maxImageCount = maxImageCount;
    
    [self prepareImageView];
    [self preparePageControl];
    [self setUpTimer];
    [self changeImageLeft:_maxImageCount - 1 center:0 right:1];
    

}

- (void)imageViewDidTap
{
    if (self.imageViewDidTapAtIndex != nil) {
        self.imageViewDidTapAtIndex(_currentIndex);
    }
}

- (instancetype)initWithFrame:(CGRect)frame withImageNames:(NSArray<NSString *> *)imageName
{
    if (imageName.count < 2) {
        return nil;
    }
    self = [super initWithFrame:frame];
    
    [self prepareScrollView];
    [self setImageData:imageName];
    [self setMaxImageCount:_imageData.count];
    
    return self;
}

- (void)prepareScrollView
{
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:scrollView];
    
    _scrollView = scrollView;
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    
    _scrollView.contentSize = CGSizeMake(WIDTH * 3, 0);
    
    _AutoScrollDelay = 3.0f;
    _currentIndex = 0;

}

- (void)prepareImageView
{
    UIImageView * leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
    UIImageView * centerView =[[UIImageView alloc] initWithFrame:CGRectMake(myWidth, 0, myWidth, myHeight)];
    UIImageView * rightView = [[UIImageView alloc] initWithFrame:CGRectMake(myWidth * 2, 0, myWidth, myHeight)];
    
    centerView.userInteractionEnabled = YES;
    [centerView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewDidTap)]];
    
    [_scrollView addSubview:leftView];
    [_scrollView addSubview:centerView];
    [_scrollView addSubview:rightView];
    
    _leftImageView = leftView;
    _centerImageView = centerView;
    _rightImageView = rightView;
    
}

- (void)preparePageControl
{
    UIPageControl * pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(myWidth * 0.5, myHeight - _maxImageCount * 15, myWidth, 7)];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = MZMColor;
    pageControl.numberOfPages = _maxImageCount;
    pageControl.currentPage = 0;
    [self addSubview:pageControl];
    _pageControl = pageControl;
}

- (void)setTitleData:(NSArray<NSString *> *)titleData
{
    if (titleData.count < 2) return;
    
    if (titleData.count < _imageData.count) {
        NSMutableArray * temp = [NSMutableArray arrayWithArray:titleData];
        for (int i = 0; i < _imageData.count - titleData.count; i++) {
            [temp addObject:@""];
        }
        _titleData = [temp copy];
    }else{
        _titleData = [titleData copy];
    }
    [self prepareTitleLabel];

    _hasTitle = YES;

    [self changeImageLeft:_maxImageCount - 1 center:0 right:1];
}

- (void)prepareTitleLabel
{
    [self setStyle:PageControlAtRight];
    
    UIView * left = [self createLabelBgView];
    UIView * center = [self createLabelBgView];
    UIView * right = [self createLabelBgView];
    
    _leftLabel  = (UILabel *)left.subviews.firstObject;
    _centerLabel = (UILabel *)center.subviews.firstObject;
    _rightLabel = (UILabel *)right.subviews.firstObject;
    
    [_leftImageView addSubview:left];
    [_leftImageView addSubview:center];
    [_leftImageView addSubview:right];
    
}

- (UIView *)createLabelBgView
{
    CGFloat h = 25;
    if (myHeight * 0.1 > 25) {
        h = myHeight * 0.1;
    }
    
    UIView * v = [[UIView alloc] initWithFrame:CGRectMake(0, myHeight - h, myWidth, h)];
    v.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, myWidth - _pageControl.frame.size.width, h)];
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor =[UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:h*0.5];
    
    [v addSubview:label];
    
    return v;
}

- (void)setStyle:(PageControlStyle)style
{
    if (style == PageControlAtRight) {
        CGFloat w = _maxImageCount * pageSize;
        _pageControl.frame = CGRectMake(myWidth - w, myHeight - _maxImageCount * 15, w, 7);
       
    }else if (style == PageControlAtCenter){
        _pageControl.centerX = myWidth * 0.5;
        _pageControl.centerY = myHeight - pageSize;
    }
}


#pragma maek - ScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self setUpTimer];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self chageImageWithOffset:scrollView.contentOffset.x];
}

- (void)chageImageWithOffset:(CGFloat)offsetX
{
    if (offsetX >= myWidth * 2) {
        _currentIndex++;
        if (_currentIndex == _maxImageCount - 1) {
            [self changeImageLeft:_currentIndex - 1 center:_currentIndex right:0];
        }else if (_currentIndex == _maxImageCount){
            _currentIndex = 0;
            [self changeImageLeft:_maxImageCount - 1 center:0 right:1];
        }else{
            [self changeImageLeft:_currentIndex - 1 center:_currentIndex right:0];
        }
        _pageControl.currentPage = _currentIndex;
    }
    
    if (offsetX <= 0) {
        _currentIndex--;
        if (_currentIndex == 0) {
            [self changeImageLeft:_maxImageCount - 1 center:0 right:1];
        }else if (_currentIndex == -1){
            _currentIndex = _maxImageCount - 1;
            [self changeImageLeft:_currentIndex - 1 center:_currentIndex right:0];
        }else{
            [self changeImageLeft:_currentIndex - 1 center:_currentIndex right:_currentIndex+1];
        }
        _pageControl.currentPage = _currentIndex;
    }
}

- (void)dealloc
{
    [self removeTimer];
}

- (void)scroll
{
    [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x + myWidth, 0) animated:YES];
}

- (void)setAutoScrollDelay:(NSTimeInterval)AutoScrollDelay
{
    _AutoScrollDelay = AutoScrollDelay;
    [self removeTimer];
    [self setUpTimer];
}

- (void)setUpTimer
{
    if (_AutoScrollDelay < 0.5) return;
    
    _timer = [NSTimer timerWithTimeInterval:_AutoScrollDelay target:self selector:@selector(scroll) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer
{
    if (_timer == nil) return;
    [_timer invalidate];
    _timer = nil;
}

- (void)setImageData:(NSArray *)imageNames
{
    _isNetWork = [imageNames.firstObject hasPrefix:@"http://"];
    
    if (_isNetWork) {
        _imageData = [imageNames copy];
        [self getImage];
    }else{
        NSMutableArray * temp = [NSMutableArray arrayWithCapacity:imageNames.count];
        for (NSString * name in imageNames) {
            [temp addObject:[UIImage imageNamed:name]];
        }
        _imageData = [temp copy];
    }
}

- (void)changeImageLeft:(NSInteger)leftIndex center:(NSInteger)centerIndex right:(NSInteger)rightIndex
{
    if (_isNetWork) {

        _leftImageView.image = [self setimageWithIndex:leftIndex];
        _centerImageView.image = [self setimageWithIndex:centerIndex];
        _rightImageView.image = [self setimageWithIndex:rightIndex];

    }else  {
        
        _leftImageView.image = _imageData[leftIndex];
        _centerImageView.image = _imageData[centerIndex];
        _rightImageView.image = _imageData[rightIndex];

    }
    if (_hasTitle) {

        _leftLabel.text = _titleData[leftIndex];
        _centerLabel.text = _titleData[centerIndex];
        _rightLabel.text = _titleData[rightIndex];
        
    }
    
    [_scrollView setContentOffset:CGPointMake(myWidth, 0)];
}

- (BOOL)loadDiskCacheWithUrlString:(NSString *)urlString
{
    //取沙盒缓存
    NSData * data = [NSData dataWithContentsOfFile:[self.cachePath stringByAppendingPathComponent:urlString.lastPathComponent]];
    
    if (data.length > 0) {
        UIImage * image = [UIImage imageWithData:data];
        
        if (image) {
            [self.webImageCache setObject:image forKey:urlString];
            return YES;
        }else{
            [[NSFileManager defaultManager] removeItemAtPath:[self.cachePath stringByAppendingPathComponent:urlString.lastPathComponent] error:NULL];
        }
    }
    return NO;
}

- (void)getImage
{
    for (NSString * urlString in _imageData) {
        if ([self loadDiskCacheWithUrlString:urlString]) {
            continue;
        }
        if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
            [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlString]
                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                [self downLoadImagefinish:data
                                      url:urlString
                                 savePath:[self.cachePath stringByAppendingPathComponent:urlString.lastPathComponent]
                                    error:error];
            }] resume];
        }else{
            [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
                
                [self downLoadImagefinish:data
                                      url:urlString
                                 savePath:[self.cachePath stringByAppendingPathComponent:urlString.lastPathComponent]
                                    error:connectionError];
            }];
        }
    }
}

- (void)downLoadImagefinish:(NSData *)data url:(NSString *)urlString savePath:(NSString *)path error:(NSError*)error
{
    UIImage * image = [UIImage imageWithData:data];
    if (error) {
        if (self.downLoadImageError) {
            self.downLoadImageError(error,urlString);
        }
        return;
    }
    if (!image) {
        NSString * errorData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSError *error = [NSError errorWithDomain:errorData code:381 userInfo:nil];
        if (self.downLoadImageError) {
            self.downLoadImageError(error,urlString);
        }
        return;
    }
    //沙盒缓存
    [data writeToFile:[path stringByAppendingPathComponent:urlString] atomically:YES];
    
    //内存缓存
    [self.webImageData setObject:image forKey:urlString];
}

- (UIImage *)setimageWithIndex:(NSInteger)index
{
    //从内存缓存中取，如果没有使用占位图片
    UIImage *image = [self.webImageCache valueForKey:_imageData[index]];
    if (image) {
        return image;
    }else{
        return _placeImage;
    }
}

- (NSMutableDictionary *)webImageData
{
    if (!_webImageCache) {
        _webImageCache = [[NSMutableDictionary alloc] init];
    }
    return _webImageCache;
}

- (NSString *)cachePath
{
    if (!_cachePath) {
        _cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    }
    return _cachePath;
}




@end
