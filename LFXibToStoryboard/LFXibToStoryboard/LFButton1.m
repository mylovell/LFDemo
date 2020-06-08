//
//  LFButton1.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/8.
//  Copyright © 2020 9130. All rights reserved.
//

#import "LFButton1.h"

@implementation LFButton1


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 为了能在 xib 中看到 layer 的设置【代码中的设置，只有initWithFrame中的设置才会在xib中展示】
        [self _commonUse];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        // 为了能让 xib 中加载出来的 layer 被真正设置
        [self _commonUse];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self _commonUse];
    
}

/*
 在这里弥补 IBInspectable 显示在 storyboard 上无效设置:
 1、layer相关的设置 如圆角cornerRadius 、2、背景颜色backgroundColor
 
 */
- (void)_commonUse {
    
    self.cornerRadius = 20;
    self.borderWidth = 2;
    self.borderColor = @"#267545";
    self.backColor = @"#FCD893";
    
    self.fontColor = @"#942192";
}

- (void)setFontColor:(NSString *)hex {
    UIColor *titleColor = [LFButton1 colorWithHexString:hex alpha:1];
    [self setTitleColor:titleColor forState:(UIControlStateNormal)];
}

- (void)setFontName:(NSString *)fontName {
    fontName = [self fontNameMap:fontName];
    UIFont *font = [UIFont fontWithName:fontName size:self.titleLabel.font.pointSize];
    self.titleLabel.font = font;
}

- (void)setFontSize:(NSUInteger )fontSize {
    UIFont *font = [self.titleLabel.font fontWithSize:fontSize];
    self.titleLabel.font = font;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (void)setBorderColor:(NSString *)borderColor {
    UIColor *color = [LFButton1 colorWithHexString:borderColor alpha:1];
    self.layer.borderColor = color.CGColor;
}

- (void)setBackColor:(NSString *)backColor {
    UIColor *color = [LFButton1 colorWithHexString:backColor alpha:1];
    self.backgroundColor = color;
    
}

/**
 16进制颜色转换为UIColor

 @param hexColor 16进制字符串（可以以0x开头，可以以#开头，也可以就是6位的16进制）
 @param opacity 透明度
 @return 16进制字符串对应的颜色
 */
+(UIColor *)colorWithHexString:(NSString *)hexColor alpha:(float)opacity{
    NSString * cString = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor blackColor];

    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];

    if ([cString length] != 6) return [UIColor blackColor];

    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString * rString = [cString substringWithRange:range];

    range.location = 2;
    NSString * gString = [cString substringWithRange:range];

    range.location = 4;
    NSString * bString = [cString substringWithRange:range];

    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:opacity];
}

- (NSString *)fontNameMap:(NSString *)fontName {
    NSDictionary *dic = @{
        @"PingFang-SC-Heavy"        :@"PingFangSC-Semibold",
        @"PingFang-SC-Semibold"     :@"PingFangSC-Semibold",
        @"PingFang-SC-Bold"         :@"PingFangSC-Semibold",
        @"PingFang-SC-Medium"       :@"PingFangSC-Medium",
        @"PingFang-SC-Regular"      :@"PingFangSC-Regular",
        @"PingFang-SC-Thin"         :@"PingFangSC-Thin",
        @"PingFang-SC-Light"        :@"PingFangSC-Light",
        @"PingFang-SC-Ultralight"   :@"PingFangSC-Ultralight"
    };
    if ([dic[fontName] length] != 0) {
        fontName = dic[fontName];
    }
    return fontName;
}


@end
