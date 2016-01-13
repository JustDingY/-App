//
//  MZMSettingViewContrller.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/25.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMSettingViewContrller.h"

@interface MZMSettingViewContrller ()<UIAlertViewDelegate>

@property (nonatomic, strong) UISwitch * sw;

@end

@implementation MZMSettingViewContrller

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel * titleLabel = [MZMControl createLabelWithFrame:CGRectMake(0, 0, 60, 30) text:@"设置" font:18];
    titleLabel.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLabel;
    

}

//创建一个UISwitch
- (UISwitch *)sw
{
    if (!_sw) {
        _sw = [[UISwitch alloc] init];
        _sw.center = CGPointMake(WIDTH - 80, 22);
        [_sw addTarget:self action:@selector(swChange) forControlEvents:UIControlEventValueChanged];
        _sw.onTintColor = MZMColor;

//        [_sw.layer setBorderWidth:0.2];
//        [_sw.layer setBorderColor:[MZMCOLOR(245, 245, 245, 1) CGColor]];
//        [_sw.layer setShadowColor:[[UIColor grayColor] CGColor]];
//        [_sw.layer setShadowOffset:CGSizeMake(0, 1)];
//        [_sw.layer setShadowOpacity:0.40f];
//        [_sw.layer setShadowRadius:0.5];
//        [_sw.layer setCornerRadius:_sw.frame.size.height /2];
//        _sw.tintColor = MZMCOLOR(179, 179, 170, 1);
        
    }

    return _sw;
}

#pragma mark - UISwitch方法
- (void)swChange
{
    if (_sw.isOn) {
        MZMLog(@"打开了");
    }else
        MZMLog(@"关闭了");
}

#pragma mark - tableView的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 1;
        case 3:
            return 1;
        default:
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@""];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"清除缓存";
            cell.imageView.image = [UIImage imageNamed:@"picture_cacheClear"];
            cell.accessoryType = UITableViewCellAccessoryNone;
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"推送设置";
            cell.imageView.image = [UIImage imageNamed:@"picture_push"];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.accessoryView = self.sw;
            
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"常见问题";
            cell.imageView.image = [UIImage imageNamed:@"picture_question"];
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"给个5星呗";
            cell.imageView.image = [UIImage imageNamed:@"picture_score"];
        }
    }else if (indexPath.section == 2){
        cell.textLabel.text = @"关于民治梦";
        cell.imageView.image = [UIImage imageNamed:@"picture_dream"];
    }else if (indexPath.section == 3){
        cell.textLabel.text = @"退出登录";
        cell.textLabel.textColor = MZMColor;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UIAlertController * clearAlert = [UIAlertController alertControllerWithTitle:nil message:@"是否清除缓存" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction * concertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self clearCache];
            }];
            [clearAlert addAction:cancelAction];
            [clearAlert addAction:concertAction];
            [self presentViewController:clearAlert animated:YES completion:nil];
        }
    }else if (indexPath.section == 3){
        UIAlertController * logoutAlert = [UIAlertController alertControllerWithTitle:nil message:@"退出不会删除您的个人信息,但将无法查看孝心卡明细" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction * logoutAction = [UIAlertAction actionWithTitle:@"确认退出" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [self logout];
        }];
        [logoutAlert addAction:cancel];
        [logoutAlert addAction:logoutAction];
        [self presentViewController:logoutAlert animated:YES completion:nil];

    }
}

- (void)logout
{
    MZMLog(@"用户退出");
}

- (void)clearCache
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString * cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSArray * files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
        for (NSString * p in files) {
            NSError *error;
            NSString * path = [cachePath stringByAppendingString:p];
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            }
        }
        [self performSelectorOnMainThread:@selector(clearCacheSuccess) withObject:nil waitUntilDone:YES];
    });
}

- (void)clearCacheSuccess
{

    UIAlertController * successAlert = [UIAlertController alertControllerWithTitle:nil message:@"缓存清理成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [successAlert addAction:sureAction];
    [self presentViewController:successAlert animated:YES completion:nil];
}



@end
