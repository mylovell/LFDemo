//
//  XibButton.h
//  Single
//
//  Created by Feng Luo on 2020/3/14.
//  Copyright © 2020 Feng Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

/* 平方字体取值：
PingFangSC-Medium，
PingFangSC-Semibold，
PingFangSC-Light，
PingFangSC-Ultralight，
PingFangSC-Regular，
PingFangSC-Thin
*/
NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE

@interface XibButton : UIButton

#pragma mark - button 属性
@property (nonatomic, assign) IBInspectable NSString *fontName;
@property (nonatomic, assign) IBInspectable NSUInteger fontSize;
@property (nonatomic, strong) IBInspectable NSString *fontColor;// 十六进制的颜色，比如 123456

#pragma mark - view 属性
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable NSString *borderColor;
@property (nonatomic, strong) IBInspectable NSString *backColor;// 背景颜色


@property (nonatomic, strong) IBInspectable NSString *unifySet;// 统一设置（在子类使用，在子类中实现setter，给上面的 IBInspectable 属性赋值）

@end

NS_ASSUME_NONNULL_END
