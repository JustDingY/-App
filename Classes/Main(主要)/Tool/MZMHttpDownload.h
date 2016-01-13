//
//  MZMHttpDownload.h
//  民之梦App
//
//  Created by 韩少龙 on 15/12/18.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface MZMHttpDownload : NSObject

//block指针
@property (nonatomic, copy) void(^MyBlock)(BOOL, MZMHttpDownload *);

//设置路径
@property (nonatomic, copy) NSString * path;

//下载的数据源
@property (nonatomic, strong) NSMutableData * data;

//解析的结果
@property (nonatomic, strong) NSArray * dataArray;
@property (nonatomic, strong) NSDictionary * dataDict;
@property (nonatomic, strong) UIImage * dataImage;

@property (nonatomic, assign) UIWindow * window;

- (instancetype)initWithURLString:(NSString *)UrlString block:(void(^)(BOOL, MZMHttpDownload*))a;

@end
