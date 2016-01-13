//
//  NSFileManager+MZMExteion.h
//  民之梦App
//
//  Created by 韩少龙 on 15/12/18.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"


@interface NSFileManager (MZMExteion)

//用于判断文件是否超时
- (BOOL)timeOutFileName:(NSString *)name time:(NSTimeInterval)time;

@end
