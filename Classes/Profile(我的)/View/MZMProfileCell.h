//
//  MZMProfileCell.h
//  民之梦App
//
//  Created by 韩少龙 on 15/12/30.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZMProfileModel.h"

@interface MZMProfileCell : UITableViewCell

@property (nonatomic, strong) UIImageView * cellImg;
@property (nonatomic, strong) UILabel * cellName;
@property (nonatomic, strong) UILabel * cellDetail;

- (void)configModel:(MZMProfileModel *)model;

@end
