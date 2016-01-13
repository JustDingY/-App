//
//  MZMHomeBusinessCell.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/4.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMHomeBusinessCell.h"

@implementation MZMHomeBusinessCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //图片
        _businessImage = [MZMControl createImageViewWithFrame:CGRectMake(10, 10, 90, 80) imageName:@"defalutbg_floor_item"];
        [self.contentView addSubview:self.businessImage];
        
        //店铺名
        _businessLabel = [MZMControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(_businessImage.frame)+15, 10, 100, 20) text:@"北京烤猪蹄" font:16];
        _businessLabel.font = [UIFont boldSystemFontOfSize:16];
        _businessLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.businessLabel];
       
        //类型和距离
        _typeLabel = [MZMControl createLabelWithFrame:CGRectMake(WIDTH - 100, 10, 90, 12) text:@"200米 | 美食" font:12];
        _typeLabel.textColor = [UIColor orangeColor];
        _typeLabel.centerY = _businessLabel.centerY - 1;
        [self.contentView addSubview:_typeLabel];
        
        //详情
        _businessDetailLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_businessLabel.frame), CGRectGetMaxY(_businessLabel.frame)+2, WIDTH - 120, 40)];
        _businessDetailLabel.numberOfLines = 0;
        _businessDetailLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _businessDetailLabel.textColor = [UIColor grayColor];
        _businessDetailLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.businessDetailLabel];
        
        //评级
        _starGroupImage = [MZMControl createImageViewWithFrame:CGRectMake(CGRectGetMinX(_businessLabel.frame), CGRectGetMaxY(_businessDetailLabel.frame)+10, 87, 13.5) imageName:@"icon_grayStar_group"];
        _starImage = [MZMControl createImageViewWithFrame:CGRectMake(CGRectGetMinX(_starGroupImage.frame), CGRectGetMinY(_starGroupImage.frame), _starGroupImage.width, _starGroupImage.height) imageName:@"icon_star_group"];
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
    return self;
}

- (void)configModel:(MZMHomeBusinessModel *)model
{

//    [_businessImage sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:[UIImage imageNamed:@"picture_placeholder"]];
    _businessImage.image = [UIImage imageNamed:model.shopPicUrl];
    _businessLabel.text = model.shopName;
    _typeLabel.text = model.shopType;
    _businessDetailLabel.text = model.shopIntroduce;
    _starImage.image = [UIImage imageNamed:model.shoplevel];
    _discountLabel.text = model.shopDiscount;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
