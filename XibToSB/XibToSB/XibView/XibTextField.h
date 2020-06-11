//
//  XibTextField.h
//  Parents
//
//  Created by luofeng on 2020/5/8.
//  Copyright © 2020 9130. All rights reserved.
//


/* UITextField 的坑：输入文字(UIFont)和占位文字(UIFont)的坑，坑的原因是系统没开放 placeholderLabel 的属性
 
 坑：
 问题：设值完占位样式（self.attributedPlaceholder），再设值输入文字样式（self.font），发现运行结果：占位样式的UIFont和输入文字的UIFont是一样的。
 原因：占位样式的Font被输入文字Font给覆盖掉了。attributedPlaceholder是富文本，当次赋值有效；而 self.font 一直保存在 UITextField 。
 解决办法：
 方案1：调整设值顺序，先设值 self.font，再设值 self.attributedPlaceholder，这样就不会覆盖了。缺点在于要更换 placeholder 时，样式又变为 self.font 的了。
 方案2：【更有效】占位样式和输入样式都用富文本，这样跟顺序就没关了，也不会产生样式覆盖。只是每次占位文字和输入文字有变动的时候，要重新生成下富文本。
 
 
 self.font
 self.text
 self.attributedText
 
 self.placeholder
 self.attributedPlaceholder
 
 */


/* 平方字体取值：
PingFangSC-Medium，
PingFangSC-Semibold，
PingFangSC-Light，
PingFangSC-Ultralight，
PingFangSC-Regular，
PingFangSC-Thin
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE

@interface XibTextField : UITextField

// ph : placeholder 占位字符样式
@property (nonatomic, strong) IBInspectable NSString *phFontName;
@property (nonatomic, assign) IBInspectable NSInteger phFontSize;
@property (nonatomic, strong) IBInspectable NSString *phFontColor;


@property (nonatomic, strong) IBInspectable NSString *fontName;
@property (nonatomic, assign) IBInspectable NSInteger fontSize;
@property (nonatomic, strong) IBInspectable NSString *fontColor;

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable NSString *borderColor;
@property (nonatomic, strong) IBInspectable NSString *backColor;// 背景颜色

/// 光标颜色
@property (nonatomic, strong) IBInspectable NSString *cursorColor;


@property (nonatomic, strong) IBInspectable NSString *unifySet;/// 统一设置（在子类使用，在子类中实现setter，给上面的 IBInspectable 属性赋值）

@end

NS_ASSUME_NONNULL_END
