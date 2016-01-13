//
//  MZMBusinessInfoCell.h
//  民之梦App
//
//  Created by 韩少龙 on 15/12/29.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZMBusinessInfoModel.h"

@interface MZMBusinessInfoCell : UITableViewCell

@property (nonatomic, strong) UIImageView * displayImage;
@property (nonatomic, strong) UIButton * supportBtn;
@property (nonatomic, strong) UILabel * discountLabel;
@property (nonatomic, strong) UILabel * scriptLabel;
@property (nonatomic, strong) UIButton * forwardBtn;
@property (nonatomic, strong) UIButton * telBtn;
@property (nonatomic, strong) UILabel * telLabel;
@property (nonatomic, strong) UILabel * addressLabel;
@property (nonatomic, strong) UIImageView * verticalImage;
@property (nonatomic, strong) UILabel * cardLabel;

@property (nonatomic, strong) UILabel * weekdayLabel;
@property (nonatomic, strong) UILabel * weekendLabel;
@property (nonatomic, strong) UILabel * weekdayTimeLabel;
@property (nonatomic, strong) UILabel * weekendTimeLabel;

- (void)configModel:(MZMBusinessInfoModel *)model;

@end
