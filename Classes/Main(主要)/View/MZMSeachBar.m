//
//  MZMSeachBar.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/18.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMSeachBar.h"

@implementation MZMSeachBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"搜点感兴趣的";
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
    
        UIImageView * searchIcon = [[UIImageView alloc] init];
        searchIcon.image = [UIImage imageNamed:@"icon_search_glass"];
//        searchIcon.width = 30;
//        searchIcon.height = 30;
        searchIcon.frame = CGRectMake(0, 0, 30, 30);
        searchIcon.contentMode = UIViewContentModeCenter;
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

+ (instancetype)searchBar
{
    return [[self alloc] init];
}

@end
