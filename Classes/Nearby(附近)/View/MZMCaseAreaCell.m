//
//  MZMCaeAreaCell.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/11.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMCaseAreaCell.h"

@implementation MZMCaseAreaCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self prepareView];
    }
    return self;
}


- (void)prepareView
{
    //店名
    _shopNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, WIDTH - 100, 18)];
    _shopNameLabel.textColor = [UIColor blackColor];
    _shopNameLabel.font = [UIFont systemFontOfSize:15];
    _shopNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.shopNameLabel];
    
    //大学城名
    _areaNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_shopNameLabel.x, CGRectGetMaxY(_shopNameLabel.frame), 80, 15)];
    _areaNameLabel.textColor = [UIColor grayColor];
    _areaNameLabel.font = [UIFont systemFontOfSize:12];
    _areaNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.areaNameLabel];
    
    //门店类型
    _shopTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 110, 10, 40, 15)];
    _shopTypeLabel.textColor = [UIColor orangeColor];
    _shopTypeLabel.font = [UIFont systemFontOfSize:13];
    _shopTypeLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.shopTypeLabel];
    
    //分隔竖线
    UIView * vertical = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_shopTypeLabel.frame)+10, 0, 0.5, 12)];
    vertical.backgroundColor = MZMCOLOR(215, 215, 215, 1);
    vertical.centerY = _shopTypeLabel.centerY;
    [self.contentView addSubview:vertical];
    
    //门店距离
    _shopDistanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(vertical.frame)+ 10, 0, _shopTypeLabel.width+10, _shopTypeLabel.height)];
    _shopDistanceLabel.centerY = _shopTypeLabel.centerY;
    _shopDistanceLabel.textColor = [UIColor orangeColor];
    _shopDistanceLabel.font = [UIFont systemFontOfSize:13];
    _shopDistanceLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.shopDistanceLabel];
    
    //分隔横线
    UIView * line = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_areaNameLabel.frame)+5, WIDTH, 1)];
    line.backgroundColor = MZMCOLOR(215, 215, 215, 1);
    [self.contentView addSubview:line];
    
    //店铺图片
    _shopView = [[UIImageView alloc] initWithFrame:CGRectMake(_shopNameLabel.x, CGRectGetMaxY(line.frame)+5, 90, 80)];
    [self.contentView addSubview:self.shopView];
    
    //店铺详情
    _shopDetailLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_shopView.frame)+10, _shopView.y, WIDTH - 120, 40)];
    _shopDetailLabel.numberOfLines = 0;
    _shopDetailLabel.lineBreakMode = NSLineBreakByCharWrapping;
    _shopDetailLabel.font = [UIFont systemFontOfSize:14];
    _shopDetailLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.shopDetailLabel];
    
    //店铺评级
    UIImageView * grayStar = [[UIImageView alloc] initWithFrame:CGRectMake(_shopDetailLabel.x, CGRectGetMaxY(_shopView.frame) - 15, 87, 13.5)];
    grayStar.image = [UIImage imageNamed:@"icon_grayStar_group"];
    [self.contentView addSubview:grayStar];
    
    _shopLevelView = [[UIImageView alloc] initWithFrame:CGRectMake(_shopDetailLabel.x, CGRectGetMaxY(_shopView.frame) - 15, 87, 13.5)];
    [self.contentView addSubview:self.shopLevelView];
    
    //店铺折扣
    _shopDiscount = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 100, CGRectGetMaxY(_shopLevelView.frame)-30, 60, 30)];
    _shopDiscount.font = [UIFont boldSystemFontOfSize:30];
    _shopDiscount.textColor = MZMColor;
    _shopDiscount.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.shopDiscount];
    
    //“折”
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_shopDiscount.frame), CGRectGetMaxY(_shopDiscount.frame) - 20, 20, 15)];
    label.text = @"折";
    label.textColor = MZMColor;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont boldSystemFontOfSize:15];
    [self.contentView addSubview:label];
}

- (void)configModel:(MZMCaseAreaModel *)model
{
    _shopNameLabel.text = model.shopName;
    _areaNameLabel.text = model.areaName;
    _shopTypeLabel.text = model.shopType;
    _shopDistanceLabel.text = model.shopDistance;
    _shopView.image = [UIImage imageNamed:model.shopImg];
    _shopDetailLabel.text = model.shopDetail;
    _shopLevelView.image = [UIImage imageNamed:model.shopLevel];
    _shopDiscount.text = model.shopDiscount;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
