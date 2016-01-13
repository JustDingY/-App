//
//  MZMEvaluateViewCell.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/5.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMEvaluateViewCell.h"

@implementation MZMEvaluateViewCell
{
    UIImageView * shopView;
    UILabel * shopNameLabel;
    UILabel * dateLabel;
    UIImageView * levelView;
    UILabel * contentLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self prepareView];
        
        self.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    return self;
}

- (void)prepareView

{
    //商铺分类
    shopView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 13, 15, 14)];
    [self.contentView addSubview:shopView];
    
    //店名
    shopNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(shopView.frame) + 10, 5, WIDTH - 100, 30)];
    shopNameLabel.textColor = [UIColor grayColor];
    shopNameLabel.textAlignment = NSTextAlignmentLeft;
    shopNameLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:shopNameLabel];
    
    //分割线
    UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(shopNameLabel.frame)  +5, WIDTH - 15, 1)];
    view.backgroundColor = MZMCOLOR(245, 245, 245, 1);
    [self.contentView addSubview:view];
    
    //时间
    dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(shopView.x, CGRectGetMaxY(shopNameLabel.frame) + 10, 80, 15)];
    dateLabel.textColor = [UIColor grayColor];
    dateLabel.textAlignment = NSTextAlignmentLeft;
    dateLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:dateLabel];
    
    //评级
    levelView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(dateLabel.frame) + 10, 0, 87, 13.5)];
    levelView.centerY = dateLabel.centerY;
    [self.contentView addSubview:levelView];
    
    //评价内容
    contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(shopView.x, CGRectGetMaxY(dateLabel.frame), WIDTH - 30, 50)];
    contentLabel.numberOfLines = 0;
    contentLabel.textColor = [UIColor grayColor];
    contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.hidden = YES;
    [self.contentView addSubview:contentLabel];
    
    _rowHeight = 60.0f;
}

//给商铺分类赋值
- (void)setShopViewName:(NSString *)shopViewName
{
    _shopViewName = shopViewName;
    shopView.image = [UIImage imageNamed:shopViewName];
}

//店名
- (void)setShopName:(NSString *)shopName
{
    _shopName = shopName;
    shopNameLabel.text = shopName;
}

//时间
- (void)setDate:(NSString *)date
{
    _date = date;
    dateLabel.text = date;
}

//评级
- (void)setLevelViewName:(NSString *)levelViewName
{
    _levelViewName = levelViewName;
    levelView.image = [UIImage imageNamed:levelViewName];
}

//评价内容
- (void)setContent:(NSString *)content
{
    if (content.length == 0) {
        contentLabel.hidden = YES;
        _rowHeight = 60.0f;
    }
    _content = content;
    contentLabel.hidden = NO;
    CGSize size = [content boundingRectWithSize:CGSizeMake(WIDTH - 30, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    contentLabel.frame = CGRectMake(shopView.x, CGRectGetMaxY(dateLabel.frame)+10, WIDTH - 30, size.height);
    contentLabel.text = content;
    _rowHeight = CGRectGetMaxY(contentLabel.frame);
}

//评价图片
- (void)setImageNames:(NSArray *)imageNames
{
    for (int i = 0; i < _imageNames.count; i++) {
        UIView * view = [self.contentView viewWithTag:800 + i];
        [view removeFromSuperview];
    }
    _imageNames = imageNames;
    
    CGFloat picW = (WIDTH - 80) / 5 + 10;
    if (_imageNames) {
        for (int j = 0; j < self.imageNames.count; j++) {
            NSString * imageName = [self.imageNames objectAtIndex:j];
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15 + picW * j, CGRectGetMaxY(contentLabel.frame) + 10, picW - 10, picW - 20)];
            imageView.image = [UIImage imageNamed:imageName];
            imageView.tag = 800 + j;
            [self.contentView addSubview:imageView];
        }
    }
    if (_imageNames.count > 0) {
        UIView * view = [self.contentView viewWithTag:800 + _imageNames.count - 1];
        _rowHeight = CGRectGetMaxY(view.frame) + 10;
    }else {
        if (_rowHeight < 60) {
            _rowHeight = 60.0f;
        }
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
