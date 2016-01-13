//
//  MZMMessageViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/12/22.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMMessageViewController.h"
#import "SKSTableViewCell.h"
#import "SKSTableView.h"

@interface MZMMessageViewController ()

@property (nonatomic, strong) NSArray * contents;
@property (nonatomic, strong) NSArray * imageContents;

@end

@implementation MZMMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];

//    _tableView = [[SKSTableView alloc] init];
    _tableView = [[SKSTableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    self.tableView.SKSTableViewDelegate = self;
    [self.view addSubview:self.tableView];
}

- (NSArray *)contents
{
    if (!_contents) {
        _contents = @[@[@[@"系统消息",@"常见问题查看",@"APP周五更新提醒",@"对于什么事情，目前已经解决"]],
                      @[@[@"商家推荐",@"这个商家很懒，什么都没留下",@"你说商家推荐里面会有啥",@"最后一个我该怎么扯"]],
                      @[@[@"活动推荐",@"发起一个活动",@"什么样的活动大家比较感兴趣咧",@"话说APP每周五更新什么鬼"]]];
    }
    
    return _contents;
}


#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(SKSTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(SKSTableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(SKSTableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.contents count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contents[section] count];
}

- (NSInteger)tableView:(SKSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.contents[indexPath.section][indexPath.row] count] - 1;
}

#pragma mark - UITableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"SKSTableViewCell";
    
    SKSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[SKSTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.textLabel.text = self.contents[indexPath.section][indexPath.row][0];
//    cell.textLabel.font = [UIFont systemFontOfSize:20];
//    cell.imageView.image = self.imageContents[indexPath.section][indexPath.row][0];
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"message_SystemMessage_icon"];
    }else if (indexPath.section == 1){
        cell.imageView.image = [UIImage imageNamed:@"message_member_icon"];
    }else if (indexPath.section == 2){
        cell.imageView.image = [UIImage imageNamed:@"message_activities_icon"];
    }
    
    if ((indexPath.section == 0 && (indexPath.row == 0)) || (indexPath.section == 1 && (indexPath.row == 0)) || (indexPath.section == 2&&(indexPath.row == 0)))
        cell.isExpandable = YES;
    else
        cell.isExpandable = NO;
    
    return cell;
}

#pragma mark - UITableViewSubRowCell
- (UITableViewCell *)tableView:(SKSTableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifer = @"UITableViewCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.contents[indexPath.section][indexPath.row][indexPath.subRow]];
    cell.textLabel.textColor = [UIColor grayColor];
    cell.backgroundColor = MZMCOLOR(153, 153, 153, 1);
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
