//
//  MZMHomeBusinessCell.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/4.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMHomeBusinessCell.h"

@interface MZMHomeBusinessCell ()

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

@end

@implementation MZMHomeBusinessCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //图片
        _businessImage = [MZMControl createImageViewWithFrame:CGRectMake(10, 10, 80, 50) imageName:@"defalutbg_floor_item"];
        
        //店铺名
        _businessLabel = [MZMControl createLabelWithFrame:CGRectMake(133, 15, 100, 20) text:@"北京烤猪蹄" font:16];
        _businessLabel.font = [UIFont boldSystemFontOfSize:16];
        _businessLabel.adjustsFontSizeToFitWidth = YES;
       
        
        //评级
         _starGroupImage = [MZMControl createImageViewWithFrame:CGRectMake(133, CGRectGetMaxY(_businessLabel.frame)+5, 87, 13.5) imageName:@"icon_grayStar_group"];
        _starImage = [MZMControl createImageViewWithFrame:CGRectMake(133, CGRectGetMaxY(_businessLabel.frame)+5, 87, 13.5) imageName:@"icon_star_group"];
        
        //类型和距离
        _typeLabel = [MZMControl createLabelWithFrame:CGRectMake(133, CGRectGetMaxY(_starGroupImage.frame)+12, 100, 10) text:@"美食  |  200米" font:12];
        
        //喜欢图标
        _supportImage = [MZMControl createImageViewWithFrame:CGRectMake(WIDTH - 90, 15, 15, 15) imageName:@"icon_order_support"];

        //喜欢人数
        _supportLabel = [MZMControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(_supportImage.frame)+5, 18, 55, 12) text:@"60人喜欢" font:12];
        _supportLabel.textColor = [UIColor orangeColor];
        
        //详情
        _businessDetailLabel = [MZMControl createLabelWithFrame:CGRectMake(133, CGRectGetMaxY(_typeLabel.frame)+12, 120, 10) text:@"北京烤猪蹄巴拉巴拉巴拉" font:12];
        
        //折扣
        _discountLabel = [MZMControl createLabelWithFrame:CGRectMake(CGRectGetMinX(_supportImage.frame), CGRectGetMaxY(_businessDetailLabel.frame) - 50, 70, 80) text:@"9.2" font:30];
        _discountLabel.adjustsFontSizeToFitWidth = YES;
        _discountLabel.textColor = MZMCOLOR(182, 17, 28, 1);
        _discountLabel.font = [UIFont boldSystemFontOfSize:30];
        
        //"折"
        _scriptLabel = [MZMControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(_discountLabel.frame) - 20, CGRectGetMaxY(_discountLabel.frame) - 65, 40, 50) text:@"折" font:10];
        _scriptLabel.adjustsFontSizeToFitWidth = YES;
        _scriptLabel.textAlignment = NSTextAlignmentLeft;
        _scriptLabel.textColor = MZMCOLOR(195, 39, 43, 1);
        _scriptLabel.font = [UIFont boldSystemFontOfSize:15];

    }
    return self;
}

- (void)configModel:(MZMHomeBusinessModel *)model
{

//    [_businessImage sd_setImageWithURL:[NSURL URLWithString:[NSURL URLWithString:model.imgsrc]] placeholderImage:[UIImage imageNamed:@"picture_placeholder"]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
