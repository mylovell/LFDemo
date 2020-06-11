//
//  XibNavigationItem.m
//  Parents
//
//  Created by luofeng on 2020/5/7.
//  Copyright © 2020 9130. All rights reserved.
//

#import "XibNavigationItem.h"

@implementation XibNavigationItem

- (void)setFontColor:(NSString *)hex {
    
    if (!self.titleView) {
        UILabel *label = [[UILabel alloc] init];
        self.titleView = label;
    }
    
    UILabel *label = (UILabel *)self.titleView;
    label.textColor = [self colorWithHexString:hex alpha:1];
    
}

- (void)setFontName:(NSString *)fontName {
    
    if (!self.titleView) {
        UILabel *label = [[UILabel alloc] init];
        self.titleView = label;
    }
    
    UILabel *label = (UILabel *)self.titleView;
    UIFont *originFont = label.font;
    
    
    fontName = [self fontNameMap:fontName];
    label.font = [UIFont fontWithName:fontName size:originFont.pointSize];
    
}

- (void)setFontSize:(NSUInteger )fontSize {
    
    if (!self.titleView) {
        UILabel *label = [[UILabel alloc] init];
        self.titleView = label;
    }
    
    UILabel *label = (UILabel *)self.titleView;
    UIFont *originFont = label.font;
    label.font = [UIFont fontWithName:originFont.fontName size:fontSize];
    
}

-(void)setTitleContent:(NSString *)titleContent {
    
    if (!self.titleView) {
        UILabel *label = [[UILabel alloc] init];
        self.titleView = label;
    }
    
    UILabel *label = (UILabel *)self.titleView;
    label.text = titleContent;
    
}

/**
 16进制颜色转换为UIColor

 @param hexColor 16进制字符串（可以以0x开头，可以以#开头，也可以就是6位的16进制）
 @param opacity 透明度
 @return 16进制字符串对应的颜色
 */
- (UIColor *)colorWithHexString:(NSString *)hexColor alpha:(float)opacity{
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
