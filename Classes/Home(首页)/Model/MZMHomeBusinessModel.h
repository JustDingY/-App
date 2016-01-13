//
//  MZMHomeBusinessModel.h
//  民之梦App
//
//  Created by 韩少龙 on 15/12/4.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MZMHomeBusinessModel : NSObject

@property (nonatomic, copy) NSString * shopId; //商铺ID
@property (nonatomic ,copy) NSString * shopName; //商铺名称
@property (nonatomic, copy) NSString * shopType;//商铺所属分类
@property (nonatomic, copy) NSString * imgsrc; //商铺图片
@property (nonatomic, copy) NSString * shopdetailaddress; //商铺地址
@property (nonatomic, copy) NSString * shoplevel; //商铺等级
@property (nonatomic, copy) NSString * shopIntroduce; //商铺介绍
@property (nonatomic, assign) double * shopLan; //经度
@property (nonatomic, assign) double * shopLon; //维度
@property (nonatomic, copy) NSString * shopDiscount; //商铺折扣
@property (nonatomic, assign) NSInteger * shopLikeNumber; //喜欢人数
@property (nonatomic, strong) NSString * shopPicUrl; //展示图片


@end
