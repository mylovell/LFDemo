//
//  CellLabel.h
//  Single
//
//  Created by Feng Luo on 2020/3/14.
//  Copyright © 2020 Feng Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


// IB_DESIGNABLE 不支持枚举。
//typedef enum : NSUInteger {
//    Medium,
//    Semibold,
//    Light,
//    Ultralight,
//    Regular,
//    Thin,
//} PingFangSCName;



/*
 XibLabel 可做为父类，供其他子类继承，这样子类也享有父类的功能：
 1、实用属性可视化，（IBInspectable）
 2、界面实时更新显示。（IB_DESIGNABLE）
 
 */

IB_DESIGNABLE

@interface XibLabel : UILabel

#pragma mark - label 属性
// ======= label 属性 ========

/* 平方字体取值：
 PingFangSC-Medium，
 PingFangSC-Semibold，
 PingFangSC-Light，
 PingFangSC-Ultralight，
 PingFangSC-Regular，
 PingFangSC-Thin
 */
@property (nonatomic, assign) IBInspectable NSString *fontName;
@property (nonatomic, assign) IBInspectable NSUInteger fontSize;
@property (nonatomic, strong) IBInspectable NSString *fontColor;// 十六进制的颜色，比如 123456



#pragma mark - view 属性
// ======= view 属性 ========

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable NSString *borderColor;
@property (nonatomic, strong) IBInspectable NSString *backColor;// 背景颜色

// 不支持枚举类型，所有不会在xib中展示
//@property (nonatomic, assign) IBInspectable PingFangSCName fontName1;

@end

NS_ASSUME_NONNULL_END
