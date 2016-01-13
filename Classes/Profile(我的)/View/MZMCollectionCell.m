//
//  MZMCollectionCell.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/5.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMCollectionCell.h"

@implementation MZMCollectionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //店铺图片
        _shopView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 80, 80)];
        [self.contentView addSubview:self.shopView];
        
        //店铺名
        _shopNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_shopView.frame) + 10, _shopView.y, 200, 30)];
        _shopNameLabel.textColor = [UIColor blackColor];
        _shopNameLabel.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.shopNameLabel];
        
        //评级
        _shopLevelView = [[UIImageView alloc] initWithFrame:CGRectMake(_shopNameLabel.x, CGRectGetMaxY(_shopNameLabel.frame), 87, 13.5)];
        [self.contentView addSubview:self.shopLevelView];
        
        //评价人数
        _evaluateNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_shopLevelView.frame)+20, _shopLevelView.y, 90, _shopLevelView.height)];
        _evaluateNumLabel.textColor = [UIColor grayColor];
        _evaluateNumLabel.textAlignment = NSTextAlignmentLeft;
        _evaluateNumLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.evaluateNumLabel];
        
        //店铺类别
        _shopTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_shopNameLabel.x, CGRectGetMaxY(_shopView.frame) - 25, 60, 30)];
        _shopTypeLabel.textColor = [UIColor grayColor];
        _shopTypeLabel.font = [UIFont systemFontOfSize:13];
        _shopTypeLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.shopTypeLabel];
        
        //折扣
        _shopCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_shopTypeLabel.frame)+10, _shopTypeLabel.y, _shopTypeLabel.width, _shopTypeLabel.height)];
        _shopCountLabel.textColor = [UIColor grayColor];
        _shopCountLabel.font = [UIFont systemFontOfSize:13];
        _shopCountLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.shopCountLabel];
        
        //商圈
        _shopAreaLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_shopCountLabel.frame)+10, _shopTypeLabel.y, _shopTypeLabel.width, _shopTypeLabel.height)];
        _shopAreaLabel.textColor = [UIColor grayColor];
        _shopAreaLabel.font = [UIFont systemFontOfSize:13];
        _shopAreaLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.shopAreaLabel];
        
        //竖线
        UIImageView * vertical1 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_shopTypeLabel.frame) + 5, 0, 1, 12)];
        vertical1.backgroundColor = MZMCOLOR(78, 78, 78, 1);
        vertical1.centerY = _shopTypeLabel.centerY;
        [self.contentView addSubview:vertical1];
        
        UIImageView * vertical2 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_shopCountLabel.frame) + 5, 0, 1, 12)];
        vertical2.backgroundColor = MZMCOLOR(78, 78, 78, 1);
        vertical2.centerY = _shopTypeLabel.centerY;
        [self.contentView addSubview:vertical2];
        
        
    }
    
    self.textLabel.font = [UIFont systemFontOfSize:16];
    self.accessoryType = UITableViewCellAccessoryNone;
    
    return self;
}

- (void)configModel:(MZMCollectionModel *)model
{
    _shopView.image = [UIImage imageNamed:model.shopImg];
    _shopNameLabel.text = model.shopName;
    _shopLevelView.image = [UIImage imageNamed:model.shopLevel];
    _evaluateNumLabel.text = model.evaluateNum;
    _shopTypeLabel.text = model.shopType;
    _shopCountLabel.text = model.shopCount;
    _shopAreaLabel.text = model.shopArea;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
