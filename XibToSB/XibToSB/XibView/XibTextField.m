//
//  XibTextField.m
//  Parents
//
//  Created by luofeng on 2020/5/8.
//  Copyright © 2020 9130. All rights reserved.
//

#import "XibTextField.h"

@implementation XibTextField

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"placeholder" context:nil];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _phFontName = @"PingFangSC-Regular";
        _phFontSize = 13;
        _phFontColor = @"A9A9A9";
        _fontName = @"PingFangSC-Medium";
        _fontSize = 18;
        _fontColor = @"424242";
        
        // 为了每次输入的文字，都能设置到样式
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(XibTextFieldDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:nil];
        
        // 为了每次占位文字的改变，都能设置到样式
        [self addObserver:self forKeyPath:@"placeholder" options:(NSKeyValueObservingOptionNew) context:nil];
    }
    return self;
}

- (void)XibTextFieldDidChangeNotification:(NSNotification *)noti {
    [self checkNilValue];
    
    UIFont *font = [UIFont fontWithName:_fontName size:_fontSize];
    UIColor *color = [self colorWithHexString:_fontColor alpha:1.0];
    NSDictionary *dic = @{
        NSFontAttributeName : font,
        NSForegroundColorAttributeName : color
    };
    self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:dic];
    
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
    // object : C11TextField
    // change[@"new"] : placeholder修改
    if ([keyPath isEqualToString:@"placeholder"]) {
        //NSLog(@"change[new]:%@",change[@"new"]);
        
        [self checkNilValue];
        UIColor *newColor = [self colorWithHexString:_phFontColor alpha:1];
        UIFont *newFont = [UIFont fontWithName:[self fontNameMap:_phFontName] size:_phFontSize];
        NSDictionary *dic =@{
            NSFontAttributeName : newFont,
            NSForegroundColorAttributeName : newColor
        };
        
        // new attrString
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self.placeholder attributes:dic];
        self.attributedPlaceholder = attrString;
    }
}

- (void)checkNilValue {
    _phFontName = _phFontName.length == 0 ? @"PingFangSC-Regular" : _phFontName;
    _phFontSize = _phFontSize == 0 ? 13 : _phFontSize;
    _phFontColor = _phFontColor.length == 0 ? @"A9A9A9" : _phFontColor;
    _fontName = _fontName.length == 0 ? @"PingFangSC-Medium" : _fontName;
    _fontSize = _fontSize == 0 ? 18 : _fontSize;
    _fontColor = _fontColor.length == 0 ? @"424242" : _fontColor;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (void)setBorderColor:(NSString *)borderColor {
    UIColor *color = [self colorWithHexString:borderColor alpha:1];
    self.layer.borderColor = color.CGColor;
}

- (void)setBackColor:(NSString *)backColor {
    UIColor *color = [self colorWithHexString:backColor alpha:1];
    self.backgroundColor = color;
}


#pragma mark - placeholder
-(void)setPhFontName:(NSString *)phFontName {
    _phFontName = phFontName;
    
    if (self.placeholder.length == 0) {
        return;
    }
    
//    // new fontName
//    NSRange rp = [self.placeholder rangeOfString:self.placeholder];
//    UIFont *oldFont = [self.attributedPlaceholder attribute:NSFontAttributeName atIndex:0 effectiveRange:&rp];
//    phFontName = [self fontNameMap:phFontName];
//    UIFont *newFont = [UIFont fontWithName:phFontName size:oldFont.pointSize];
//    NSDictionary *newFontAttr = @{NSFontAttributeName : newFont};
//
//    // add new font name attr
//    NSDictionary *oldAttr = [self.attributedPlaceholder attributesAtIndex:0 effectiveRange:&rp];
//    NSMutableDictionary *newAttr = [NSMutableDictionary dictionaryWithDictionary:oldAttr];
//    [newAttr addEntriesFromDictionary:newFontAttr];
    
    
    UIColor *newColor = [self colorWithHexString:_phFontColor alpha:1];
    UIFont *newFont = [UIFont fontWithName:[self fontNameMap:phFontName] size:_phFontSize];
    NSDictionary *dic =@{
        NSFontAttributeName : newFont,
        NSForegroundColorAttributeName : newColor
    };
    
    // new attrString
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self.placeholder attributes:dic];
    self.attributedPlaceholder = attrString;
    
}
-(void)setPhFontSize:(NSInteger)phFontSize {
    _phFontSize = phFontSize;
    
    if (self.placeholder.length == 0) {
        return;
    }
    
//    // new font size
//    NSRange rp = [self.placeholder rangeOfString:self.placeholder];
//    NSDictionary *oldAttr = [self.attributedPlaceholder attributesAtIndex:0 effectiveRange:&rp];
//    UIFont *oldFont = [self.attributedPlaceholder attribute:NSFontAttributeName atIndex:0 effectiveRange:&rp];
//    // new attr
//    UIFont *newFont = [UIFont fontWithName:oldFont.fontName size:phFontSize];
//    NSDictionary *newFontAttr = @{NSFontAttributeName : newFont};
//    NSMutableDictionary *newAttr = [NSMutableDictionary dictionaryWithDictionary:oldAttr];
//    [newAttr addEntriesFromDictionary:newFontAttr];
    
    
    
    UIColor *newColor = [self colorWithHexString:_phFontColor alpha:1];
    UIFont *newFont = [UIFont fontWithName:[self fontNameMap:_phFontName] size:_phFontSize];
    NSDictionary *dic =@{
        NSFontAttributeName : newFont,
        NSForegroundColorAttributeName : newColor
    };
    
    // new attrString
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self.placeholder attributes:dic];
    self.attributedPlaceholder = attrString;
}


-(void)setPhFontColor:(NSString *)phFontColor {
    _phFontColor = phFontColor;
    
    if (self.placeholder.length == 0) {
        return;
    }
    
//    // new color
//    NSRange rp = [self.placeholder rangeOfString:self.placeholder];
//    //UIColor *originColor = [self.attributedPlaceholder attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:&rp];
//    UIColor *newColor = [self colorWithHexString:phFontColor alpha:1];
//    NSDictionary *newColorAttr = @{NSForegroundColorAttributeName : newColor};
//    // new attr
//    NSDictionary *originAttr = [self.attributedPlaceholder attributesAtIndex:0 effectiveRange:&rp];
//    NSMutableDictionary *newAttr = [NSMutableDictionary dictionaryWithDictionary:originAttr];
//    [newAttr addEntriesFromDictionary:newColorAttr];
    
    
    UIColor *newColor = [self colorWithHexString:_phFontColor alpha:1];
    UIFont *newFont = [UIFont fontWithName:[self fontNameMap:_phFontName] size:_phFontSize];
    NSDictionary *dic =@{
        NSFontAttributeName : newFont,
        NSForegroundColorAttributeName : newColor
    };
    
    // new attrString
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self.placeholder attributes:dic];
    self.attributedPlaceholder = attrString;
    
}

//- (void)setPhContent:(NSString *)phContent {
//    _phContent = phContent;
//    self.placeholder = _phContent;
//    
//    UIColor *defaultPhColor = [[UIColor grayColor] colorWithAlphaComponent:0.7];
//    NSInteger defaultPhFontSize = 13;
//    NSString *defaultPhFontName = @"PingFangSC-Regular";
//    
//    UIColor *newColor = _phFontColor ? [self colorWithHexString:_phFontColor alpha:1] : defaultPhColor;
//    NSInteger pointSize = _phFontSize > 0 ? _phFontSize : defaultPhFontSize;
//    NSString *phFontName =  _phFontName.length > 0 ? _phFontName : defaultPhFontName;
//    phFontName = [self fontNameMap:phFontName];
//    UIFont *newFont = [UIFont fontWithName:phFontName size:pointSize];
//    
//    NSDictionary *dic =@{
//        NSFontAttributeName : newFont,
//        NSForegroundColorAttributeName : newColor
//    };
//    
//    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self.placeholder attributes:dic];
//    self.attributedPlaceholder = attrString;
//}


#pragma mark - TEXT
-(void)setFontName:(NSString *)fontName {
    _fontName = fontName;
//    self.font = [UIFont fontWithName:fontName size:self.font.pointSize];
    
    if (!self.text) { return; }
    _fontName = [self fontNameMap:_fontName];
    UIFont *font = [UIFont fontWithName:_fontName size:_fontSize];
    UIColor *color = [self colorWithHexString:_fontColor alpha:1.0];
    NSDictionary *dic = @{
        NSFontAttributeName : font,
        NSForegroundColorAttributeName : color
    };
    self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:dic];
    
}
- (void)setFontSize:(NSInteger)fontSize {
    _fontSize = fontSize;
//    self.font = [UIFont fontWithName:self.font.fontName size:fontSize];
    
    if (!self.text) { return; }
    UIFont *font = [UIFont fontWithName:_fontName size:_fontSize];
    UIColor *color = [self colorWithHexString:_fontColor alpha:1.0];
    NSDictionary *dic = @{
        NSFontAttributeName : font,
        NSForegroundColorAttributeName : color
    };
    self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:dic];

}
-(void)setFontColor:(NSString *)fontColor {
    _fontColor = fontColor;
//    self.textColor = [self colorWithHexString:fontColor alpha:1];
    
    if (!self.text) { return; }
    UIFont *font = [UIFont fontWithName:_fontName size:_fontSize];
    UIColor *color = [self colorWithHexString:_fontColor alpha:1.0];
    NSDictionary *dic = @{
        NSFontAttributeName : font,
        NSForegroundColorAttributeName : color
    };
    self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:dic];
    
}

#pragma mark - cursor
-(void)setCursorColor:(NSString *)cursorColor {
    self.tintColor = [self colorWithHexString:cursorColor alpha:1];
}


#pragma mark - help
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
