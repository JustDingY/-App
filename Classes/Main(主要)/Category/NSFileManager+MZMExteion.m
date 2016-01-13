//
//  NSFileManager+MZMExteion.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/18.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "NSFileManager+MZMExteion.h"

@implementation NSFileManager (MZMExteion)

//判断文件是否超时
- (BOOL)timeOutFileName:(NSString *)name time:(NSTimeInterval)time
{
    //Documents模拟器对大小不敏感，但是真机区分大小写
    NSString * path = [NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),name];
    //读取文件信息
    NSDictionary * info = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
    //读取文件创建时间
    NSDate * createDate = [info objectForKey:NSFileCreationDate];
    //获取现在时间
    NSDate * date = [NSDate date];
    //二个时间算差值
    NSTimeInterval timeDifferences = [date timeIntervalSinceDate:createDate];
    if (time > timeDifferences) {

        return YES;

    }else{
    
        return NO;
    }
}

@end
