//
//  MZMBusinessAppraise.h
//  民之梦App
//
//  Created by 韩少龙 on 15/12/5.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZMBusinessAppraiseCell : UITableViewCell

@property (nonatomic, copy) NSString * userHeaderImg;
@property (nonatomic, copy) NSString * userNickname;
@property (nonatomic, copy) NSString * appraiseLevel;
@property (nonatomic, copy) NSString * appraiseDate;
@property (nonatomic, copy) NSString * appraiseContent;
@property (nonatomic, copy) NSString * appraiseImg;

@property (nonatomic, assign, readonly) CGFloat rowHeight;//只读属性  用来获取单元格的高


@end
