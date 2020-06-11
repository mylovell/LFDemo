//
//  XibBarButtonItem.h
//  Parents
//
//  Created by luofeng on 2020/5/7.
//  Copyright © 2020 9130. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE

@interface XibBarButtonItem : UIBarButtonItem

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


@property (nonatomic, strong) IBInspectable NSString *unifySet;/// 统一设置（在子类使用，在子类中实现setter，给上面的 IBInspectable 属性赋值）

@end

NS_ASSUME_NONNULL_END
