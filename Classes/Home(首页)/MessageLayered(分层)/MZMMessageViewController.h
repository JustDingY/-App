//
//  MZMMessageViewController.h
//  民之梦App
//
//  Created by 韩少龙 on 15/12/22.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKSTableView.h"

@interface MZMMessageViewController : UIViewController<SKSTableViewDelegate,UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) SKSTableView * tableView;

@end
