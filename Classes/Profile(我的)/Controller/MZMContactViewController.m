//
//  MZMContactViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 15/11/25.
//  Copyright © 2015年 韩少龙. All rights reserved.
//

#import "MZMContactViewController.h"
#import "MZMLimitText.h"

#define textViewLength 200

@interface MZMContactViewController ()<MZMLimitTextDelegate>

@property (nonatomic, strong) UILabel * labTextViewCount; ///<textView
@property (nonatomic, weak) MZMLimitText * textView;

@end

@implementation MZMContactViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareNav];
    [self prepareUI];
    
}

- (void)prepareNav
{
    UILabel * titleLabel = [MZMControl createLabelWithFrame:CGRectMake(0, 0, 40, 20) text:@"意见反馈" font:18];
    titleLabel.textColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = titleLabel;
}

- (void)prepareUI
{
    self.view.backgroundColor = MZMBackColor;
    
    // 创建一个文本输入视图
    
    MZMLimitText *textView = [[MZMLimitText alloc] initWithFrame:CGRectMake(20, 20, WIDTH - 40, 240) type:TextInputTypeTextView];
    textView.placeholder = @"请将您的意见告知我们，这样才能给您最好的体验";
    textView.labPlaceHolder.textColor = [UIColor grayColor];
    textView.delegate = self;
    textView.maxLength = textViewLength;
    [self.view addSubview:textView];
    self.textView = textView;
    
    UILabel * labCount = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(textView.frame) - 100, CGRectGetMaxY(textView.frame) + 10, 100, 15)];
    labCount.text = @"0/200字";
    labCount.textColor = [UIColor grayColor];
    labCount.font = [UIFont systemFontOfSize:12];
    labCount.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:labCount];
    self.labTextViewCount = labCount;
    
}

//字数超出限制
- (void)limitTextLimitInputOverStop:(MZMLimitText *)textLimitInput
{

    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:@"超出字数限制了哦" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * concertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:concertAction];
    [self presentViewController:alert animated:YES completion:nil];
}

//
- (void)limitTextlimitInput:(MZMLimitText *)textLimitInput text:(NSString *)text
{
    if ([textLimitInput isEqual:self.textView]) {
        self.labTextViewCount.text = [NSString stringWithFormat:@"%d/%d字",(int)text.length,textViewLength];
    }
}

- (void)submitBtnClick
{
    MZMLog(@"提交");
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
