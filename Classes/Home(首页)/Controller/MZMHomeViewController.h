//
//  MZMHomeViewController.h
//  民之梦App
//
//  Created by 韩少龙 on 15/11/16.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZMHomeViewController : UITableViewController
{
    NSInteger * page;
}

@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, copy) NSString * strUrl;
@property (nonatomic, copy) NSString * navTitle;
@end
