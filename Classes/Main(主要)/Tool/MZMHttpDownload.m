//
//  MZMHttpDownload.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/18.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMHttpDownload.h"
#import "NSFileManager+MZMExteion.h"
#import "MZMMD5.h"


@implementation MZMHttpDownload

- (instancetype)initWithURLString:(NSString *)UrlString block:(void (^)(BOOL, MZMHttpDownload *))a
{
    if (self = [super init]) {
        //获取window
        AppDelegate * app = [UIApplication sharedApplication].delegate;
        self.window = app.window;
        
        //转换为UTF-8格式字符串
        NSString * UtfStr = [UrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        self.MyBlock = a;
        
        
        //设置一个路径
        self.path = [NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),[MZMMD5 md5:UrlString]];
        //判断文件是否超时
        NSFileManager * manager = [NSFileManager defaultManager];
        if ([manager fileExistsAtPath:self.path] && [manager timeOutFileName:[MZMMD5 md5:UrlString] time:60*60]) {
            //使用缓存
            self.data = [NSMutableData dataWithContentsOfFile:self.path];
            [self jsonValue];
        }
        else{
            //开始网络请求展示HUD
            [MBProgressHUD showHUDAddedTo:self.window animated:YES];
            
            //开始网络请求
            [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:UtfStr]] delegate:self];
        }
    }
    return nil;
}

//开始请求
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response
{
    self.data = [NSMutableData dataWithCapacity:10];
}

//接收数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data
{
    [self.data appendData:data];
}

//请求完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //当请求成功的时候，把请求数据保存在我们的沙盒目录下
    [self.data writeToFile:self.path atomically:YES];
    
    //解析
    [self jsonValue];
    [MBProgressHUD hideAllHUDsForView:self.window animated:YES];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(nonnull NSError *)error
{
    if (self.MyBlock) {
        self.MyBlock(NO,self);
    }
    [MBProgressHUD hideHUDForView:self.window animated:YES];
}

- (void)jsonValue
{
    id json = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:nil];
    
    if ([json isKindOfClass:[NSArray class]]) {
        self.dataArray = [NSArray arrayWithArray:json];
    }else{
        if ([json isKindOfClass:[NSDictionary class]]) {
            self.dataDict = [NSDictionary dictionaryWithDictionary:json];
        }else{
            if (self.data.length > 0) {
                self.dataImage = [UIImage imageWithData:self.data];
            }
        }
    }
    //调用block进行回调
    if (self.MyBlock) {
        self.MyBlock(YES,self);
    }
}

@end
