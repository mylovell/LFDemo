//
//  XibTextField.m
//  Parents
//
//  Created by luofeng on 2020/5/8.
//  Copyright © 2020 9130. All rights reserved.
//

#import "XibTextField.h"

@implementation XibTextField

-(void)setPhFontName:(NSString *)placeholderFontName {
    
    // new font name
    NSRange rp = NSRangeFromString(self.placeholder);
    UIFont *originFont = [self.attributedPlaceholder attribute:NSFontAttributeName atIndex:0 effectiveRange:&rp];
    placeholderFontName = [self fontNameMap:placeholderFontName];
    UIFont *newFont = [UIFont fontWithName:placeholderFontName size:originFont.pointSize];
    NSDictionary *newFontAttr = @{NSFontAttributeName : newFont};
    
    // new attr
    NSDictionary *originAttr = [self.attributedPlaceholder attributesAtIndex:0 effectiveRange:&rp];
    NSMutableDictionary *newAttr = [NSMutableDictionary dictionaryWithDictionary:originAttr];
    [newAttr addEntriesFromDictionary:newFontAttr];
    
    // new attrString
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self.placeholder attributes:newAttr];
    self.attributedPlaceholder = attrString;
    
}
-(void)setPhFontSize:(NSUInteger)placeholderFontSize {
    
    // new font size
    NSRange rp = NSRangeFromString(self.placeholder);
    UIFont *originFont = [self.attributedPlaceholder attribute:NSFontAttributeName atIndex:0 effectiveRange:&rp];
    UIFont *newFont = [UIFont fontWithName:originFont.fontName size:placeholderFontSize];
    NSDictionary *newFontAttr = @{NSFontAttributeName : newFont};
    
    // new attr
    NSDictionary *originAttr = [self.attributedPlaceholder attributesAtIndex:0 effectiveRange:&rp];
    NSMutableDictionary *newAttr = [NSMutableDictionary dictionaryWithDictionary:originAttr];
    [newAttr addEntriesFromDictionary:newFontAttr];
    
    // new attrString
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self.placeholder attributes:newAttr];
    self.attributedPlaceholder = attrString;
}
-(void)setPhFontColor:(NSString *)placeholderFontColor {
    
    // new color
    NSRange rp = NSRangeFromString(self.placeholder);
    //UIFont *originColor = [self.attributedPlaceholder attribute:NSFontAttributeName atIndex:0 effectiveRange:&rp];
    UIColor *newColor = [XibTextField colorWithHexString:placeholderFontColor alpha:1];
    NSDictionary *newColorAttr = @{NSForegroundColorAttributeName : newColor};
    
    // new attr
    NSDictionary *originAttr = [self.attributedPlaceholder attributesAtIndex:0 effectiveRange:&rp];
    NSMutableDictionary *newAttr = [NSMutableDictionary dictionaryWithDictionary:originAttr];
    [newAttr addEntriesFromDictionary:newColorAttr];
    
    // new attrString
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self.placeholder attributes:newAttr];
    self.attributedPlaceholder = attrString;
    
}


-(void)setFontName:(NSString *)fontName {
    fontName = [self fontNameMap:fontName];
    self.font = [UIFont fontWithName:fontName size:self.font.pointSize];
}
- (void)setFontSize:(NSUInteger)fontSize {
    self.font = [UIFont fontWithName:self.font.fontName size:fontSize];
}
-(void)setFontColor:(NSString *)fontColor {
    UIColor *color = [XibTextField colorWithHexString:fontColor alpha:1];
    self.textColor = color;
}

-(void)setCursorColor:(NSString *)cursorColor {
    self.tintColor = [XibTextField colorWithHexString:cursorColor alpha:1];
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
