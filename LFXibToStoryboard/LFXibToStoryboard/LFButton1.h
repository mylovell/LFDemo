//
//  LFButton1.h
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/8.
//  Copyright © 2020 9130. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE

@interface LFButton1 : UIButton

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
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable NSString *borderColor;
@property (nonatomic, strong) IBInspectable NSString *backColor;// 背景颜色

@property (strong, nonatomic) IBOutlet LFButton1 *mButton;

@end

NS_ASSUME_NONNULL_END
