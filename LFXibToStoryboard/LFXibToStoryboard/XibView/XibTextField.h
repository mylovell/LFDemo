//
//  XibTextField.h
//  Parents
//
//  Created by luofeng on 2020/5/8.
//  Copyright © 2020 9130. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE

@interface XibTextField : UITextField

/* 平方字体取值：
PingFangSC-Medium，
PingFangSC-Semibold，
PingFangSC-Light，
PingFangSC-Ultralight，
PingFangSC-Regular，
PingFangSC-Thin
*/

// ph : placeholder 占位字符样式
@property (nonatomic, assign) IBInspectable NSString *phFontName;
@property (nonatomic, assign) IBInspectable NSUInteger phFontSize;
@property (nonatomic, strong) IBInspectable NSString *phFontColor;


@property (nonatomic, assign) IBInspectable NSString *fontName;
@property (nonatomic, assign) IBInspectable NSUInteger fontSize;
@property (nonatomic, strong) IBInspectable NSString *fontColor;

/// 光标颜色
@property (nonatomic, strong) IBInspectable NSString *cursorColor;

@end

NS_ASSUME_NONNULL_END
