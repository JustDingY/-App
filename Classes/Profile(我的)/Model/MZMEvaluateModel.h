//
//  MZMEvaluateModel.h
//  民之梦App
//
//  Created by 韩少龙 on 16/1/5.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MZMEvaluateModel : NSObject

@property (nonatomic, copy) NSString * shopImg;
@property (nonatomic, copy) NSString * shopName;
@property (nonatomic, copy) NSString * evaluteDate;
@property (nonatomic, copy) NSString * evaluteLevel;
@property (nonatomic, copy) NSString * evaluteContent;
@property (nonatomic, retain) NSArray * imageNames;

@end
