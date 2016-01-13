//
//  MZMMZMBusinessInfoViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/3.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMBusinessInfoView.h"

@interface MZMBusinessInfoView()

@property (nonatomic, strong) UIImageView * displayImage;
@property (nonatomic, strong) UIButton * supportBtn;
@property (nonatomic, strong) UILabel * discountLabel;
@property (nonatomic, strong) UILabel * scriptLabel;
@property (nonatomic, strong) UIButton * forwardBtn;
//@property (nonatomic, strong) UILabel * addressLabel;
@property (nonatomic, strong) UIButton * telBtn;
@property (nonatomic, strong) UILabel * telLabel;

@property (nonatomic, strong) UILabel * addressLabel;
@property (nonatomic, strong) UIImageView * verticalImage;
@property (nonatomic, strong) UILabel * cardLabel;

//营业时间
@property (nonatomic, strong) UILabel * weekdayLabel;
@property (nonatomic, strong) UILabel * weekendLabel;
@property (nonatomic, strong) UILabel * weekdayTimeLabel;
@property (nonatomic, strong) UILabel * weekendTimeLabel;

@end

@implementation MZMBusinessInfoView


- (id)initWithFrame:(CGRect)frame
{
   self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = MZMCOLOR(235, 235, 235, 1);
    }
    return self;
}

#pragma mark - 需要摆放的元素
- (UIImageView *)displayImage
{
    if (!_displayImage) {
        _displayImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT /4)];
        _displayImage.image = [UIImage imageNamed:@"picture_top_image"];
    }
    return _displayImage;
}
- (UIButton *)supportBtn
{
    if (!_supportBtn) {
        _supportBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH - 40, 20, 25, 25)];
        [_supportBtn setImage:[UIImage imageNamed:@"icon_support_white"] forState:UIControlStateNormal];
        [_supportBtn setImage:[UIImage imageNamed:@"icon_support_orange"] forState:UIControlStateSelected];
        [_supportBtn addTarget:self action:@selector(supportBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _supportBtn;
}

- (UILabel *)discountLabel
{
    if (!_discountLabel) {
        _discountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 60, 30)];
        _discountLabel.text = @"9.2";
        _discountLabel.textColor = MZMCOLOR(195, 39, 43, 1);
        _discountLabel.font = [UIFont systemFontOfSize:25];
        _discountLabel.textAlignment = NSTextAlignmentRight;
    }
    return _discountLabel;
}



- (UILabel *)scriptLabel
{
    if (!_scriptLabel) {
        _scriptLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_discountLabel.frame), CGRectGetMaxY(_discountLabel.frame)-22, 30, 20)];
        _scriptLabel.text = @"折";
        _scriptLabel.textColor = MZMCOLOR(195, 39, 43, 1);
        _scriptLabel.font = [UIFont systemFontOfSize:15];
    }
    return _scriptLabel;
}

- (UILabel *)cardLabel
{
    if (!_cardLabel) {
        _cardLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_scriptLabel.frame), CGRectGetMinY(_scriptLabel.frame), 80, 20)];
        _cardLabel.text = @"孝心卡专享";
        
        _cardLabel.font = [UIFont systemFontOfSize:15];
        _cardLabel.textColor = MZMCOLOR(179, 179, 179, 1);
    }
    return _cardLabel;
}



- (UILabel *)addressLabel
{
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 12, 220, 20)];
        _addressLabel.text = @"合肥市经开区明珠广场南200米再往北走300米然后做199路公交车呵呵哒";
        _addressLabel.font = [UIFont systemFontOfSize:12];
        _addressLabel.textColor = MZMCOLOR(128, 128, 128, 1);
    }
    return _addressLabel;
}

- (UIImageView *)verticalImage
{
    
    _verticalImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_cardLabel.frame)+110, 10, 1, 30)];
    _verticalImage.image = [UIImage imageNamed:@"icon_line_vertical"];

    return _verticalImage;
    
}

- (UIButton *)forwardBtn
{
    if (!_forwardBtn) {
        _forwardBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_verticalImage.frame)+10, 5, 80, 35)];
        [_forwardBtn setImage:[UIImage imageNamed:@"icon_forward"] forState:UIControlStateNormal];
        [_forwardBtn addTarget:self action:@selector(forwardBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forwardBtn;
}

- (UIButton *)telBtn
{
    if (!_telBtn) {
        _telBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMinX(_forwardBtn.frame)+5, 5, 35, 35)];
//        _telBtn.image = [UIImage imageNamed:@"icon_tel"];
        [_telBtn setImage:[UIImage imageNamed:@"icon_tel"] forState:UIControlStateNormal];
        [_telBtn addTarget:self action:@selector(telBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _telBtn;
}

- (UILabel *)telLabel
{
    if (!_telLabel) {
        _telLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_telBtn.frame), 0, 30, 20)];
        _telLabel.centerY = _telBtn.centerY;
        _telLabel.text = @"电话";
        _telLabel.textColor = MZMCOLOR(128, 128, 128, 1);
        _telLabel.font = [UIFont systemFontOfSize:15];
    }
    return _telLabel;
}

//UILabel * weekdayLabel;
//UILabel * weekendLabel;
//UILabel * weekdayTimeLabel;
//UILabel * weekendTimeLabel;

- (UILabel *)weekdayLabel
{
    if (!_weekdayLabel) {
        _weekdayLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 80, 20)];
        _weekdayLabel.text = @"周一至周五";
        _weekdayLabel.adjustsFontSizeToFitWidth = YES;
        _weekdayLabel.textColor = MZMCOLOR(195, 39, 43, 1);
        _weekdayLabel.font = [UIFont systemFontOfSize:12];
    }
    return _weekdayLabel;
}

- (UILabel *)weekdayTimeLabel
{
    if (!_weekdayTimeLabel) {
        _weekdayTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_weekdayLabel.frame), 10, 90, 20)];
//        _weekdayTimeLabel.adjustsFontSizeToFitWidth = YES;
        _weekdayTimeLabel.textColor = MZMCOLOR(77, 77, 77, 1);
        _weekdayTimeLabel.font = [UIFont systemFontOfSize:12];
        _weekdayTimeLabel.text = @"08:00~22:00";
    }
    return _weekdayTimeLabel;
}

- (UILabel *)weekendLabel
{
    if (!_weekendLabel) {
        _weekendLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_weekdayTimeLabel.frame), 10, 40, 20)];
        _weekendLabel.textColor = MZMCOLOR(195, 39, 43, 1);
//        _weekendLabel.adjustsFontSizeToFitWidth = YES;
        _weekendLabel.text = @"周末";
        _weekendLabel.font = [UIFont systemFontOfSize:12];
    }
    return _weekendLabel;
}

- (UILabel *)weekendTimeLabel
{
    if (!_weekendTimeLabel) {
        _weekendTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_weekendLabel.frame), 10, 90, 20)];
//        _weekendTimeLabel.adjustsFontSizeToFitWidth = YES;
        _weekendTimeLabel.text = @"08:00~22:00";
        _weekendTimeLabel.textColor = MZMCOLOR(77, 77, 77, 1);
        _weekendTimeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _weekendTimeLabel;
}


#pragma mark - 按钮响应方法
//前往按钮
- (void)forwardBtnClick
{
    MZMLog(@"我是前往按钮");
}

//电话按钮
- (void)telBtnClick
{
    MZMLog(@"电话按钮");
}

#pragma mark - 喜欢按钮点击方法
- (void)supportBtnClick
{
    _supportBtn.selected = !_supportBtn.selected;
}

#pragma mark - tableView的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else{
        return 10;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 2;
        case 2:
            return 3;
        case 3:
            return 2;
        case 4:
            return 2;
        default:
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                return HEIGHT / 4;
            }else if (indexPath.row == 1){
                return 44;
            }else if (indexPath.row == 2){
                return 44;
            }
            break;
        case 1:
            if (indexPath.row == 0) {
                return 30;
            }else if (indexPath.row == 1){
                return 60;
            }
            break;
        case 2:
            if (indexPath.row == 0) {
                return 30;
            }else if (indexPath.row == 1){
                return 35;
            }else if (indexPath.row == 2){
                return 35;
            }
            break;
        case 3:
            if (indexPath.row == 0) {
                return 30;
            }else if (indexPath.row == 1){
                return 35;
            }
            break;
        case 4:
            if (indexPath.row == 0) {
                return 30;
            }else if (indexPath.row == 1){
                return 35;
            }
            break;
            
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@""];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@""];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.textColor = MZMCOLOR(128, 128, 128, 1);
    
    UIView * selectedView = [[UIView alloc] initWithFrame:cell.frame];
    selectedView.backgroundColor = [UIColor whiteColor];
    cell.selectedBackgroundView = selectedView;
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                [cell.contentView addSubview:self.displayImage];
                [cell.contentView addSubview:self.supportBtn];
            }else if (indexPath.row == 1){
                [cell.contentView addSubview:self.discountLabel];
                [cell.contentView addSubview:self.scriptLabel];
                [cell.contentView addSubview:self.cardLabel];
                [cell.contentView addSubview:self.verticalImage];
                [cell.contentView addSubview:self.forwardBtn];
                
            }else if (indexPath.row == 2){
                cell.imageView.image = [UIImage imageNamed:@"icon_localtion"];
                [cell.contentView addSubview:self.addressLabel];
                [cell.contentView addSubview:self.verticalImage];
                [cell.contentView addSubview:self.telBtn];
                [cell.contentView addSubview:self.telLabel];
            }
            break;
        case 1:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"店铺信息";
            }else if (indexPath.row == 1){
                cell.textLabel.text = @"热干面馆";
                cell.textLabel.textColor = MZMCOLOR(77, 77, 77, 1);
                cell.detailTextLabel.text = @"本店主营热干面，土豆粉，麻辣烫，重庆鸡公煲，兰州拉面，沙县小吃";
                cell.detailTextLabel.textColor = MZMCOLOR(128, 128, 128, 1);
            }
            break;
        case 2:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"商品详情";
            }else if (indexPath.row == 1){
                cell.textLabel.text = @"热干面5折，12月12号来店吃饭外送一瓶果粒奶优哦亲呵呵哒。";
                cell.textLabel.textColor = MZMCOLOR(77, 77, 77, 1);
    
            }else if (indexPath.row == 2){
                cell.textLabel.text = @"查看图文详情";
                cell.textLabel.textColor = MZMCOLOR(195, 39, 43, 1);
                cell.textLabel.font = [UIFont systemFontOfSize:14];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            break;
        case 3:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"营业时间";
            }else if (indexPath.row == 1){
                [cell.contentView addSubview:self.weekdayLabel];
                [cell.contentView addSubview:self.weekdayTimeLabel];
                [cell.contentView addSubview:self.weekendLabel];
                [cell.contentView addSubview:self.weekendTimeLabel];
            }
            break;
        case 4:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"温馨提示";
            }else if (indexPath.row == 1){
                cell.textLabel.text = @"*孝心卡专享，持卡用户到店即可享受优惠";
            }
            break;
            
        default:
            break;
    }

    return cell;
}

@end

























