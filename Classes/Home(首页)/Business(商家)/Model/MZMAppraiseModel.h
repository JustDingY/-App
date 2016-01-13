//
//  MZMAppraiseModel.h
//  民之梦App
//
//  Created by 韩少龙 on 15/12/28.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MZMAppraiseModel : NSObject

@property (nonatomic, copy) NSString * headImageName;       //头像文件名
@property (nonatomic, copy) NSString * userName;            //用户名
@property (nonatomic, copy) NSString * message;             //评论内容
@property (nonatomic, copy) NSString * appraiseDate;        //评论时间
@property (nonatomic, copy) NSString * appraiseLevel;       //评论等级
@property (nonatomic, retain) NSArray * imageNames;         //评论图片

@end
