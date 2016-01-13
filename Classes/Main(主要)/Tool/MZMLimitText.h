//
//  MZMLimitText.h
//  民之梦App
//
//  Created by 韩少龙 on 16/1/7.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 * 对字数有限制的通用输入框，代理方法返回当前输入框信息
 */

@class MZMLimitText;

typedef NS_ENUM(char, TextInputType){
    TextInputTypeTextfield = 0,
    TextInputTypeTextView,
};
@protocol MZMLimitTextDelegate <NSObject>
@optional

//超出字数限制代理方法（弹出框提示等等）
- (void)limitTextLimitInputOverStop:(MZMLimitText *)textLimitInput;

//返回输入框中的信息
- (void)limitTextlimitInput:(MZMLimitText *)textLimitInput text:(NSString *)text;
//监听键盘是否弹出，并且返回键盘的信息（一般监听键盘，判断是否向上移动需要）
- (void)limitTextLimitInput:(MZMLimitText *)textLimitInput keyBordShow:(BOOL)show userInfo:(NSDictionary* )userInfo;

//输入的时候代理方法（text和textView需要的基本代理方法 其它暂时不考虑）
- (BOOL)limitTextShouldBeginEditing:(MZMLimitText *)textLimitInput;
- (void)limitTextDidBeginEditing:(MZMLimitText *)textLimitInput;

@end
@interface MZMLimitText : UIView

- (instancetype)initWithFrame:(CGRect)frame type:(TextInputType)type;
@property (nonatomic, assign) TextInputType type;   ///<输入类型
@property (nonatomic, assign) UIKeyboardType keyType;   ///<键盘类型
@property (nonatomic, assign) NSInteger maxLength;  ///<允许最大的输入个数，默认是一个很大的数
@property (nonatomic, strong) NSString * placeholder;   ///<初始输入内容，不可编辑
@property (nonatomic, strong) NSString * text;  ///<初始化内容可编辑
@property (nonatomic, assign) id<MZMLimitTextDelegate>delegate; ///<
@property (nonatomic, assign) BOOL isBecomFirstResponder;   ///<是否第一响应，默认为YES

//以下属性便于外部设置字体以及是否是第一响应者，但是不可设置外部代理。否则内部代理失效
@property (nonatomic, strong) UITextField *textField;   ///<输入框
@property (nonatomic, strong) UITextView *textView;     ///<输入框
//此属性是战士textView的placeholder 标签外部可设置相关属性，必须保证标签存在
@property (nonatomic, strong) UILabel * labPlaceHolder; ///<

@end
