//
//  MZMAppraiseCell.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/28.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMAppraiseCell.h"

@implementation MZMAppraiseCell
{
    //创建用来显示内容的控件
    UIImageView * headImageView;
    UILabel * userNameLabel;
    UILabel * appraiseDateLabel;
    UIImageView * appraiseLevelView;
    UILabel * messageLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self prepareView];
    }
    
    return self;
}

- (void)prepareView
{
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    //头像
    headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 60, 60)];
    [self.contentView addSubview:headImageView];
    
    //用户名
    userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headImageView.frame)+5, CGRectGetMinY(headImageView.frame)+10, 80, 20)];
    userNameLabel.font = [UIFont systemFontOfSize:15];
    userNameLabel.textColor = [UIColor blackColor];
    userNameLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:userNameLabel];
    
    //评价时间
    appraiseDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headImageView.frame)+5, CGRectGetMaxY(userNameLabel.frame)+10, 90, 20)];
    appraiseDateLabel.font = [UIFont systemFontOfSize:15];
    appraiseDateLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:appraiseDateLabel];
    
    //评价等级
    appraiseLevelView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(appraiseDateLabel.frame)+5, CGRectGetMinY(appraiseDateLabel.frame), 87, 13.5)];
    appraiseLevelView.centerY = appraiseDateLabel.centerY;
    [self.contentView addSubview:appraiseLevelView];
    
    //评价内容
    messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(headImageView.frame)+10, WIDTH - 40, 0)];
    messageLabel.numberOfLines = 0;
    messageLabel.lineBreakMode = NSLineBreakByCharWrapping;
    messageLabel.font = [UIFont systemFontOfSize:15];
    messageLabel.hidden = YES;
    [self.contentView addSubview:messageLabel];
    
    _rowHeight = 60.0f;
}

//给头像赋值
- (void)setHeadImageName:(NSString *)headImageName
{
    _headImageName = headImageName;
    headImageView.image = [UIImage imageNamed:headImageName];
}

//评价时间
- (void)setAppraiseDate:(NSString *)appraiseDate
{
    _appraiseDate = appraiseDate;
    appraiseDateLabel.text = appraiseDate;
}

//评价等级
- (void)setAppraiseLevel:(NSString *)appraiseLevel
{
    _appraiseLevel = appraiseLevel;
    appraiseLevelView.image = [UIImage imageNamed:appraiseLevel];
}

//重写用户名
- (void)setUserName:(NSString *)userName
{
    _userName = userName;
    userNameLabel.text = userName;
}

//重写消息方法
- (void)setMessage:(NSString *)message
{
    if (message.length == 0) {
        messageLabel.hidden = YES;
        _rowHeight = 60.0f;
    }
    _message = message;
    messageLabel.hidden = NO;
    CGSize size = [message boundingRectWithSize:CGSizeMake(WIDTH - 40, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    messageLabel.frame = CGRectMake(20, CGRectGetMaxY(headImageView.frame)+10, WIDTH - 40, size.height);
    
    messageLabel.text = message;
    
    _rowHeight = CGRectGetMaxY(messageLabel.frame)+5;
}

- (void)setImageNames:(NSArray *)imageNames
{
    for (int i = 0; i < _imageNames.count; i++) {
        UIView * view = [self.contentView viewWithTag:800+i];
        
        [view removeFromSuperview];
    }
    
    _imageNames = imageNames;
    
    CGFloat picW = (WIDTH - 80)/5 + 10;
    if (_imageNames.count > 0) {
        //创建图片对象
        for (int j = 0; j < self.imageNames.count; j++) {
            NSString * imageName = [self.imageNames objectAtIndex:j];
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20 + picW * j, CGRectGetMaxY(messageLabel.frame)+20, picW - 10, picW - 20)];
            imageView.image = [UIImage imageNamed:imageName];
            imageView.backgroundColor = [UIColor blackColor];
            imageView.tag = 800 + j;
            [self.contentView addSubview:imageView];
        }

    }
    if (_imageNames.count > 0) {
        UIView * view = [self.contentView viewWithTag:800 + _imageNames.count - 1];
        _rowHeight = CGRectGetMaxY(view.frame) + 10;
    }
    else{
        if (_rowHeight < 60) {
            _rowHeight = 60.0f;
        }
    }
  
   
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
