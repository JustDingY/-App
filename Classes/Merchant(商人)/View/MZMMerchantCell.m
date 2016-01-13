//
//  MZMMerchantCell.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/7.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMMerchantCell.h"

@implementation MZMMerchantCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self prepareView];
    }
    return self;
}

- (void)prepareView
{
    //图片
    _businessImage = [MZMControl createImageViewWithFrame:CGRectMake(10, 10, 90, 80) imageName:@"defalutbg_floor_item"];
    [self.contentView addSubview:self.businessImage];
    
    //店铺名
    _businessLabel = [MZMControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(_businessImage.frame)+15, 10, 100, 20) text:@"北京烤猪蹄" font:16];
    _businessLabel.font = [UIFont boldSystemFontOfSize:16];
    _businessLabel.adjustsFontSizeToFitWidth = YES;
    [self.contentView addSubview:self.businessLabel];
    
    //距离
    _distanceLabel = [MZMControl createLabelWithFrame:CGRectMake(WIDTH - 110, 10, 40, 13) text:@"" font:13];
    _distanceLabel.textColor = [UIColor orangeColor];
    _distanceLabel.centerY = _businessLabel.centerY - 1;
    _distanceLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.distanceLabel];
    
    //竖线
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_distanceLabel.frame) + 10, 0, 1, _distanceLabel.height)];
    view.backgroundColor = [UIColor orangeColor];
    view.centerY = _distanceLabel.centerY;
    [self.contentView addSubview:view];
    
    //类型
    _typeLabel = [MZMControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(_distanceLabel.frame) + 20, 10, _distanceLabel.width, _distanceLabel.height) text:@"" font:13];
    _typeLabel.textColor = [UIColor orangeColor];
    _typeLabel.centerY = _distanceLabel.centerY;
    _typeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_typeLabel];
    
    //详情
    _businessDetailLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_businessLabel.frame), CGRectGetMaxY(_businessLabel.frame)+2, WIDTH - 130, 40)];
    _businessDetailLabel.numberOfLines = 0;
    _businessDetailLabel.lineBreakMode = NSLineBreakByCharWrapping;
    _businessDetailLabel.textColor = [UIColor grayColor];
    _businessDetailLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.businessDetailLabel];
    
    //评级
    _starGroupImage = [MZMControl createImageViewWithFrame:CGRectMake(CGRectGetMinX(_businessLabel.frame), CGRectGetMaxY(_businessDetailLabel.frame)+10, 87, 13.5) imageName:@"icon_grayStar_group"];
    _starImage = [MZMControl createImageViewWithFrame:CGRectMake(CGRectGetMinX(_starGroupImage.frame), CGRectGetMinY(_starGroupImage.frame), _starGroupImage.width, _starGroupImage.height) imageName:@""];
    [self.contentView addSubview:self.starGroupImage];
    [self.contentView addSubview:self.starImage];
    
    //折扣
    _discountLabel = [MZMControl createLabelWithFrame:CGRectMake(WIDTH - 100, CGRectGetMaxY(_businessDetailLabel.frame), 60, 30) text:@"9.2" font:30];
    _discountLabel.adjustsFontSizeToFitWidth = YES;
    _discountLabel.textAlignment = NSTextAlignmentRight;
    _discountLabel.textColor = MZMCOLOR(182, 17, 28, 1);
    _discountLabel.font = [UIFont boldSystemFontOfSize:30];
    [self.contentView addSubview:self.discountLabel];
    
    //"折"
    _scriptLabel = [MZMControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(_discountLabel.frame), CGRectGetMaxY(_discountLabel.frame) - 20, 20, 15) text:@"折" font:10];
    _scriptLabel.adjustsFontSizeToFitWidth = YES;
    _scriptLabel.textAlignment = NSTextAlignmentLeft;
    _scriptLabel.textColor = MZMCOLOR(195, 39, 43, 1);
    _scriptLabel.font = [UIFont boldSystemFontOfSize:15];
    [self.contentView addSubview:self.scriptLabel];
}

- (void)configModel:(MZMMerchantModel *)model
{
    
//    [_businessImage sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:[UIImage imageNamed:@"picture_placeholder"]];
    _businessImage.image = [UIImage imageNamed:model.shopPicUrl];
    _businessLabel.text = model.shopName;
    _typeLabel.text = model.shopType;
    _businessDetailLabel.text = model.shopIntroduce;
    _starImage.image = [UIImage imageNamed:model.shoplevel];
    _discountLabel.text = model.shopDiscount;
    _distanceLabel.text = model.shopDistance;
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
