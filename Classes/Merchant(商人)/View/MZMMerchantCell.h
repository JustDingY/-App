//
//  MZMMerchantCell.h
//  民之梦App
//
//  Created by 韩少龙 on 16/1/7.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZMMerchantModel.h"

@interface MZMMerchantCell : UITableViewCell

@property (nonatomic, strong) UIImageView * businessImage;
@property (nonatomic, strong) UIImageView * starGroupImage;
@property (nonatomic, strong) UIImageView * starImage;
@property (nonatomic, strong) UIImageView * supportImage;
@property (nonatomic, strong) UILabel * typeLabel;
@property (nonatomic, strong) UILabel * distanceLabel;
@property (nonatomic, strong) UILabel * supportLabel;
@property (nonatomic, strong) UILabel * businessDetailLabel;
@property (nonatomic, strong) UILabel * discountLabel;
@property (nonatomic, strong) UILabel * scriptLabel;
@property (nonatomic, strong) UILabel * businessLabel;

- (void)configModel:(MZMMerchantModel *)model;

@end
