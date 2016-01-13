//
//  MZMTradingAreaCell.h
//  民之梦App
//
//  Created by 韩少龙 on 16/1/8.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZMTradingAreaModel.h"
@interface MZMTradingAreaCell : UITableViewCell

@property (nonatomic, strong) UIImageView * areaView;
@property (nonatomic, strong) UILabel * areaNameLabel;
@property (nonatomic, strong) UILabel * areaDistanceLabel;
@property (nonatomic, strong) UILabel * shopCountLabel;
@property (nonatomic, strong) UILabel * shopNameLabel;

- (void)configModel:(MZMTradingAreaModel *)model;

@end
