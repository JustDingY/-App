//
//  MZMBusinessAppraise.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/5.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMBusinessAppraiseCell.h"

@interface MZMBusinessAppraiseCell ()

@property (nonatomic, strong) UIImageView *userheaderView;
@property (nonatomic, strong) UILabel *userNicknameLabel;
@property (nonatomic, strong) UIImageView *appraiseLevelView;
@property (nonatomic, strong) UILabel *appraiseDateLabel;
@property (nonatomic, strong) UITextField *appraiseContentField;
@property (nonatomic, strong) UIImageView * appraiseView;

@end

@implementation MZMBusinessAppraiseCell

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
    //头像
    _userheaderView = [MZMControl createImageViewWithFrame:CGRectMake(10, 10, 30, 30) imageName:@"007"];
    
    //昵称
    _userNicknameLabel = [MZMControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(_userNicknameLabel.frame)+10, CGRectGetMinY(_userNicknameLabel.frame), 30, 10) text:@"背景三" font:12];
    
    //评价等级
    for (int i = 0; i < 5; i++) {
        _appraiseLevelView = [[UIImageView alloc] init];
        _appraiseLevelView.frame = CGRectMake(CGRectGetMaxX(_userheaderView.frame)+10+i*10, CGRectGetMaxY(_userNicknameLabel.frame)+20, 10, 10);
    }
    
    //评价时间
    _appraiseDateLabel = [MZMControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(_appraiseLevelView.frame)+5, CGRectGetMinY(_appraiseLevelView.frame), 50, 10) text:@"2015-10-10" font:12];
    
    //评价内容
    
    //评价图片
    
    _rowHeight = CGRectGetMaxY(_appraiseView.frame);
}

@end
