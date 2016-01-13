//
//  MZMTest1ViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/18.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMTest1ViewController.h"
#import "MZMSeachBar.h"
@interface MZMTest1ViewController ()

@end

@implementation MZMTest1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    MZMSeachBar * searchBar = [MZMSeachBar searchBar];

    searchBar.width = self.view.width;
    searchBar.height = 30;
    [self.view addSubview:searchBar];
//    
//    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button2 setTitle:@"测试按钮" forState:UIControlStateNormal];
//    [button2 setImage:[UIImage imageNamed:@"icon_member_arrow_down"] forState:UIControlStateNormal];
//    button2.frame = CGRectMake(100, 100, 100, 100);
//    button2.imageView.backgroundColor = [UIColor blackColor];
//    [button2 addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:button2];
//    
}

- (void)click
{
    NSLog(@"点击测试按钮");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
