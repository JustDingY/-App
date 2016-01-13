//
//  MZMCaeAreaCell.h
//  民之梦App
//
//  Created by 韩少龙 on 16/1/11.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZMCaseAreaModel.h"

@interface MZMCaseAreaCell : UITableViewCell

@property (nonatomic, strong) UILabel * shopNameLabel;
@property (nonatomic, strong) UILabel * areaNameLabel;
@property (nonatomic, strong) UILabel * shopTypeLabel;
@property (nonatomic, strong) UILabel * shopDistanceLabel;
@property (nonatomic, strong) UIImageView * shopView;
@property (nonatomic, strong) UILabel * shopDetailLabel;
@property (nonatomic, strong) UIImageView * shopLevelView;
@property (nonatomic, strong) UILabel * shopDiscount;

- (void)configModel:(MZMCaseAreaModel *)model;

@end
