//
//  MZMProfileCell.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/30.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMProfileCell.h"

@implementation MZMProfileCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //cell图片
        _cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 25, 25)];
        
        [self.contentView addSubview:_cellImg];
        
        //cell标题
        _cellName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_cellImg.frame)+15, 7, 100, 30)];
        _cellName.textAlignment = NSTextAlignmentLeft;
        _cellName.textColor = [UIColor blackColor];
        _cellName.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_cellName];
        
        //cell明细
        _cellDetail = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 165, 7, 135, 30)];
        _cellDetail.textAlignment = NSTextAlignmentLeft;
        _cellDetail.textColor = [UIColor grayColor];
        _cellDetail.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_cellDetail];
    }
    
    self.textLabel.font = [UIFont systemFontOfSize:16];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.detailTextLabel.font = [UIFont systemFontOfSize:15];
    
    return self;
}

- (void)configModel:(MZMProfileModel *)model
{
    _cellImg.image = [UIImage imageNamed:model.cellImg];
    _cellName.text = model.cellName;
    _cellDetail.text = model.cellDetail;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
