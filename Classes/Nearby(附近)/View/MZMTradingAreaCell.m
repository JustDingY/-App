//
//  MZMTradingAreaCell.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/8.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMTradingAreaCell.h"

@implementation MZMTradingAreaCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        [self prepareUI];
    
    }
    
    return self;
}

- (void)prepareUI
{
    //商圈图片
    _areaView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 40)];
    [self.contentView addSubview:self.areaView];

    //商圈名
    _areaNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_areaView.frame) + 10, _areaView.y, 60, 15)];
    _areaNameLabel.font = [UIFont systemFontOfSize:15];
    _areaNameLabel.textColor = [UIColor blackColor];
    _areaNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.areaNameLabel];
    
    //"距离"
    UILabel * disLabel = [MZMControl createLabelWithFrame:CGRectMake(WIDTH - 100, _areaNameLabel.y, 40, 20) text:@"距离" font:15];
    disLabel.textAlignment = NSTextAlignmentLeft;
    disLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:disLabel];
    
    //距离
    _areaDistanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(disLabel.frame) + 20, _areaView.y, 50, 15)];
    _areaDistanceLabel.font = [UIFont systemFontOfSize:15];
    _areaDistanceLabel.textColor = [UIColor grayColor];
    _areaDistanceLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.areaDistanceLabel];
    
    //标识图片
    UIImageView  * img = [[UIImageView alloc] initWithFrame:CGRectMake(_areaNameLabel.x, CGRectGetMaxY(_areaNameLabel.frame) + 10, 15, 15)];
    img.image = [UIImage imageNamed:@"location_icon_colorful"];
    [self.contentView addSubview:img];
    
    //商家数
    _shopCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(img.frame) + 5, img.y, 80, 15)];
    _shopCountLabel.font = [UIFont systemFontOfSize:15];
    _shopCountLabel.textColor = [UIColor orangeColor];
    _shopCountLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.shopCountLabel];
    
    //店铺名
    _shopNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_areaNameLabel.x, CGRectGetMaxY(_shopCountLabel.frame) + 10, WIDTH - 100, 15)];
    _shopNameLabel.textColor = [UIColor grayColor];
    _shopNameLabel.font = [UIFont systemFontOfSize:15];
    _shopNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.shopNameLabel];
}

- (void)configModel:(MZMTradingAreaModel *)model
{
    _areaView.image = [UIImage imageNamed:model.areaImg];
    _areaNameLabel.text = model.areaName;
    _areaDistanceLabel.text = model.distance;
    _shopCountLabel.text = model.shopCount;
    _shopNameLabel.text = model.shopNames;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
