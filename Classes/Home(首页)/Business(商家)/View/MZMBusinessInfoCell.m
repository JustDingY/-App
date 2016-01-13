//
//  MZMBusinessInfoCell.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/29.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMBusinessInfoCell.h"

@implementation MZMBusinessInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //展示图片
        _displayImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT / 4)];
        [self.contentView addSubview:_displayImage];
    
        //喜欢人数
        _supportBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH - 40, 15, 25, 25)];
        [_supportBtn setImage:[UIImage imageNamed:@"icon_support_white"] forState:UIControlStateNormal];
        [_supportBtn setImage:[UIImage imageNamed:@"icon_support_orange"] forState:UIControlStateSelected];
        [_supportBtn addTarget:self action:@selector(supportBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_supportBtn];
        
        //折扣
        _discountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 60, 30)];
        _discountLabel.text = @"9.2";
        _discountLabel.textColor = MZMCOLOR(195, 39, 43, 1);
        _discountLabel.font = [UIFont systemFontOfSize:25];
        _discountLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_discountLabel];
        
        //“折”
        _scriptLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_discountLabel.frame), CGRectGetMaxY(_discountLabel.frame)-22, 30, 20)];
        _scriptLabel.text = @"折";
        _scriptLabel.textColor = MZMCOLOR(195, 39, 43, 1);
        _scriptLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_scriptLabel];
        
        //"孝心卡专享"
        _cardLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_scriptLabel.frame), CGRectGetMinY(_scriptLabel.frame), 80, 20)];
        _cardLabel.text = @"孝心卡专享";
        
        _cardLabel.font = [UIFont systemFontOfSize:15];
        _cardLabel.textColor = MZMCOLOR(179, 179, 179, 1);
        [self.contentView addSubview:_cardLabel];
        
        //地址
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, 180, 20)];
        _addressLabel.text = @"合肥市经开区明珠广场南200米再往北走300米然后做199路公交车呵呵哒";
        _addressLabel.font = [UIFont systemFontOfSize:12];
        _addressLabel.textColor = MZMCOLOR(128, 128, 128, 1);
        [self.contentView addSubview:_addressLabel];
        
        //竖线
        _verticalImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_forwardBtn.frame)-10, 10, 1, 30)];
        _verticalImage.image = [UIImage imageNamed:@"icon_line_vertical"];
        [self.contentView addSubview:_verticalImage];
        
        //电话按钮
        _telLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_telBtn.frame), 0, 30, 20)];
        _telLabel.centerY = _telBtn.centerY;
        _telLabel.text = @"电话";
        _telLabel.textColor = MZMCOLOR(128, 128, 128, 1);
        _telLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_telLabel];
        
        //工作日
        _weekdayLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 80, 20)];
        _weekdayLabel.text = @"周一至周五";
        _weekdayLabel.adjustsFontSizeToFitWidth = YES;
        _weekdayLabel.textColor = MZMCOLOR(195, 39, 43, 1);
        _weekdayLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_weekdayLabel];
        
        //工作日时间
        _weekdayTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_weekdayLabel.frame), 10, 90, 20)];
        _weekdayTimeLabel.textColor = MZMCOLOR(77, 77, 77, 1);
        _weekdayTimeLabel.font = [UIFont systemFontOfSize:12];
        _weekdayTimeLabel.text = @"08:00~22:00";
        [self.contentView addSubview:_weekdayTimeLabel];
        
        //周末
        _weekendLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_weekdayTimeLabel.frame), 10, 40, 20)];
        _weekendLabel.textColor = MZMCOLOR(195, 39, 43, 1);
        _weekendLabel.text = @"周末";
        _weekendLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_weekendLabel];
        
        //周末时间
        _weekendTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_weekendLabel.frame), 10, 90, 20)];
        _weekendTimeLabel.text = @"08:00~22:00";
        _weekendTimeLabel.textColor = MZMCOLOR(77, 77, 77, 1);
        _weekendTimeLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_weekendTimeLabel];
    }
    return self;
}

#pragma mark - 按钮响应方法

- (void)forwardBtnClick
{
    double latitude =45.748737;
    double longitude =126.699791;
    
    //UIAlertActionStyleDefault
    UIAlertController * mapSelectorSheet = [UIAlertController alertControllerWithTitle:@"选择地图" message:@"请根据需求选择导航方式" preferredStyle:UIAlertControllerStyleActionSheet];
    //系统地图
    UIAlertAction * systemMap = [UIAlertAction actionWithTitle:@"系统自带的地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *string = @"http://maps.apple.com/maps?saddr=39.98,116.31&daddr=41.59,117.40";
        [[UIApplication sharedApplication]  openURL:[NSURL URLWithString:string]];
    }];
    [mapSelectorSheet addAction:systemMap];
    
    //百度地图
    UIAlertAction * baiduMap = [UIAlertAction actionWithTitle:@"百度地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *stringURL = [NSString stringWithFormat:@"baidumap://map/geocoder?location=%f,%f&coord_type=gcj02&src=" ,latitude,longitude];
        NSURL *mapUrl = [NSURL URLWithString:[stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        if ([[UIApplication sharedApplication] canOpenURL:mapUrl])
        {
            
            [[UIApplication sharedApplication] openURL:mapUrl];
        }
        else
        {
            NSLog(@"没安装百度地图");
        }
    }];
    [mapSelectorSheet addAction:baiduMap];
    
    //腾讯地图
    UIAlertAction * tecentMap = [UIAlertAction actionWithTitle:@"腾讯地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *stringURL = [NSString stringWithFormat:@"qqmap://map/routeplan?type=drive&&fromcoord=36.547901,104.258354&tocoord=%f,%f&policy=1" ,latitude,longitude];
        NSURL *mapUrl = [NSURL URLWithString:[stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        if ([[UIApplication sharedApplication] canOpenURL:mapUrl])
        {
            
            [[UIApplication sharedApplication] openURL:mapUrl];
        }
        else
        {
            NSLog(@"没安装腾讯地图");
        }
    }];
    [mapSelectorSheet addAction:tecentMap];
    //    [mapSelectorSheet ];
    
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


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
