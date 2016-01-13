//
//  MZMCollectionCell.h
//  民之梦App
//
//  Created by 韩少龙 on 16/1/5.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZMCollectionModel.h"

@interface MZMCollectionCell : UITableViewCell

@property (nonatomic, strong) UIImageView * shopView;
@property (nonatomic, strong) UILabel * shopNameLabel;
@property (nonatomic, strong) UIImageView * shopLevelView;
@property (nonatomic, strong) UILabel * evaluateNumLabel;
@property (nonatomic, strong) UILabel * shopTypeLabel;
@property (nonatomic, strong) UILabel * shopCountLabel;
@property (nonatomic, strong) UILabel * shopAreaLabel;

- (void)configModel:(MZMCollectionModel *)model;

@end
