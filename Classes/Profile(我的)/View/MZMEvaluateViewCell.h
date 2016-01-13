//
//  MZMEvaluateViewCell.h
//  民之梦App
//
//  Created by 韩少龙 on 16/1/5.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZMEvaluateModel.h"

@interface MZMEvaluateViewCell : UITableViewCell

//UIImageView * shopView;
//UILabel * shopName;
//UILabel * dateLabel;
//UIImageView * levelView;
//UILabel * contentLabel;

@property (nonatomic, copy) NSString * shopViewName;
@property (nonatomic, copy) NSString * shopName;
@property (nonatomic, copy) NSString * date;
@property (nonatomic, copy) NSString * levelViewName;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, retain) NSArray * imageNames;

@property (nonatomic, assign, readonly) CGFloat rowHeight;

//- (void)configModel:(MZMEvaluateModel *)model;

@end
