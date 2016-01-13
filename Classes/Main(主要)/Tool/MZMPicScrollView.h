//
//  MZMPicScrollView.h
//  民之梦App
//
//  Created by 韩少龙 on 15/12/19.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PageControlStyle) {
    PageControlAtCenter,
    PageControlAtRight,
};

@interface MZMPicScrollView : UIView

//占位图片
@property (nonatomic, strong) UIImage *placeImage;

@property (nonatomic, assign) NSTimeInterval AutoScrollDelay;


//设置PageControl位置
@property (nonatomic, assign) PageControlStyle style;

@property (nonatomic, strong) NSArray<NSString *> *titleData;

//图片被点击会调用该block
@property (nonatomic, copy) void(^imageViewDidTapAtIndex)(NSInteger index);//index从0开始

@property (nonatomic, copy) void(^downLoadImageError)(NSError *error, NSString *imageUrl);

                                                           //imageUrlString或imageName
- (instancetype)initWithFrame:(CGRect)frame withImageNames:(NSArray<NSString *> *)imageName;

                                                        //网络加载urlsring必须为http:// 开头,
                                                        //如有特需修改284行代码
                                                        //本地加载只需图片名字数组
@end
