//
//  MZMPersonalViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/24.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMPersonalViewController.h"
#import "MZMPersonalHeaderView.h"

@interface MZMPersonalViewController ()

@property (nonatomic, strong) UIImageView * headBackView;
@property (nonatomic, strong) UIImageView * headerView;
@property (nonatomic, strong) UIImageView * twoDImageView;

@end
@implementation MZMPersonalViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel * titleLabel = [MZMControl createLabelWithFrame:CGRectMake(0, 0, 60, 30) text:@"个人资料" font:20];
    titleLabel.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLabel;
    
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    
}

#pragma mark - 需要添加的元素

- (UIImageView *)headBackView
{
    if (!_headBackView) {
        _headBackView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 102.5, 8.5, 71, 71)];
        _headBackView.backgroundColor = MZMCOLOR(55, 55, 55, 0.3);
        _headBackView.layer.masksToBounds = YES;
        _headBackView.layer.cornerRadius = _headBackView.width * 0.5;
        
    }
    return _headBackView;
}

- (UIImageView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_headBackView.frame)+2.5, CGRectGetMinY(_headBackView.frame)+2.5, 66, 66)];
        _headerView.layer.masksToBounds = YES;
        _headerView.layer.cornerRadius = _headerView.width * 0.5;
        _headerView.image = [UIImage imageNamed:@"007"];
    }
    return _headerView;
}

- (UIImageView *)twoDImageView
{
    if (!_twoDImageView) {
        _twoDImageView = [MZMControl createImageViewWithFrame:CGRectMake(WIDTH - 60, 11, 22, 22) imageName:@"twoDCode_personal"];
        _twoDImageView.backgroundColor = [UIColor lightGrayColor];
    }
    return _twoDImageView;
}


#pragma mark - tableView代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 0?88:44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 2;
            break;
        case 3:
            return 2;
            break;
            
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * reuseIndentifer = @"reuseIndetifer";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIndentifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIndentifer];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        cell.textLabel.text = @"头像";
        [cell.contentView addSubview:self.headBackView];
        [cell.contentView addSubview:self.headerView];
        
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"用户名";
            cell.detailTextLabel.text = @"背景三";
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"手机号码";
            cell.detailTextLabel.text = @"182****8802";
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"二维码";
            [cell.contentView addSubview:self.twoDImageView];
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"生日";
            cell.detailTextLabel.text = @"1993-12-11";
        }

    }else if (indexPath.section == 3){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"修改密码";
            cell.detailTextLabel.text = @"修改";
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"我的地址";
            cell.detailTextLabel.text = @"添加/修改";
            
        }
    }
    return cell;
}

//选中的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController * nextVc = nil;
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                MZMLog(@"调用相册");
            }else if (indexPath.row == 1){
                
            }
            break;
        case 1:
            break;
            
        case 2:
            break;
        
        case 3:
            break;
            
        default:
            break;
    }
}

















@end
