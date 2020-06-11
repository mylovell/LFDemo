//
//  ViewController.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/8.
//  Copyright © 2020 9130. All rights reserved.
//

#import "ViewController.h"
#import "LFButton1.h"
#import "LFLabel1.h"
#import "LFViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *mTextField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *string = @"石达开";
//    NSRange rp = NSRangeFromString(string);
    NSRange rp = [string rangeOfString:string];
    NSLog(@"%@",NSStringFromRange(rp));
    
    
    
    
//    LFButton1 *button1 = [[NSBundle mainBundle] loadNibNamed:@"LFButton1" owner:nil options:nil].firstObject;
//    button1.frame = CGRectMake(10, 460, 200, 40);
//    [self.view addSubview:button1];

//    LFLabel1 *label1 = [[NSBundle mainBundle] loadNibNamed:@"LFLabel1" owner:nil options:nil].firstObject;
//    label1.frame = CGRectMake(10, 260, 200, 40);
//    [self.view addSubview:label1];
    [self textTF];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateInitialViewController];
//    vc.modalPresentationStyle = 0;
//    [self presentViewController:vc animated:YES completion:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)buttonAction:(LFButton1 *)sender {
    self.mTextField.placeholder = @"fix placeholder";
}

- (void)textTF {
    
    
    
//    self.mTextField.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textTFNotice:) name:UITextFieldTextDidChangeNotification object:nil];
    
    
    self.mTextField.font = [UIFont fontWithName:@"PingFangSC-Medium" size:19];
    self.mTextField.textColor = [self colorWithHexString:@"FF2F92" alpha:1.0];//草莓红
        
    
    
    
    NSString *defaultPhColor = @"0096FF";// 浅蓝色
    NSInteger defaultPhFontSize = 13;
    NSString *defaultPhFontName = @"PingFangSC-Regular";
    
    UIColor *newColor = [self colorWithHexString:defaultPhColor alpha:1.0];
//    NSInteger pointSize = _phFontSize > 0 ? _phFontSize : defaultPhFontSize;
//    NSString *phFontName =  _phFontName.length > 0 ? _phFontName : defaultPhFontName;
//    phFontName = [self fontNameMap:phFontName];
    UIFont *newFont = [UIFont fontWithName:defaultPhFontName size:defaultPhFontSize];
    
    NSDictionary *dic =@{
        NSFontAttributeName : newFont,
        NSForegroundColorAttributeName : newColor
    };
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:self.mTextField.placeholder attributes:dic];
    self.mTextField.attributedPlaceholder = attr;
    
    
    
    

//    UIFont *font2 = [UIFont fontWithName:@"PingFangSC-Medium" size:19];
//    UIColor *color2 = [self colorWithHexString:@"FF2F92" alpha:1.0];//草莓红
//    NSDictionary *dic2 = @{
//        NSFontAttributeName : font2,
//        NSForegroundColorAttributeName : color2
//    };
//    NSAttributedString *attr2 = [[NSAttributedString alloc] initWithString:self.mTextField.text attributes:dic2];
//    self.mTextField.attributedText = attr2;
            
        

    
//    [self _setPFontName:@"PingFangSC-Regular"];
//    [self _setPFontSize:12];
//    [self _setPFontColor:@"73FA79"];// 青绿色
//    [self _setFontName:@"PingFangSC-Medium"];
//    [self _setFontSize:18];
//    [self _setFontColor:@"FF2F92"];//草莓红
}

- (void)textTFNotice:(NSNotification *)noti {
//     noti.object;
    
    UIFont *font2 = [UIFont fontWithName:@"PingFangSC-Medium" size:19];
    UIColor *color2 = [self colorWithHexString:@"FF2F92" alpha:1.0];//草莓红
    NSDictionary *dic2 = @{
        NSFontAttributeName : font2,
        NSForegroundColorAttributeName : color2
    };
    NSAttributedString *attr2 = [[NSAttributedString alloc] initWithString:self.mTextField.text attributes:dic2];
    self.mTextField.attributedText = attr2;
    
}

- (void)_setPFontName:(NSString *)pFontName {
    
    NSRange rp = [self.mTextField.placeholder rangeOfString:self.mTextField.placeholder];
    UIFont *oldFont = [self.mTextField.attributedPlaceholder attribute:NSFontAttributeName atIndex:0 effectiveRange:&rp];
    UIFont *newFont = [UIFont fontWithName:pFontName size:oldFont.pointSize];
    
    
    NSDictionary *oldAttrDic = [self.mTextField.attributedPlaceholder attributesAtIndex:0 effectiveRange:&rp];
    NSDictionary *mutDic = [NSMutableDictionary dictionaryWithDictionary:oldAttrDic];
    [mutDic setValue:newFont forKey:NSFontAttributeName];
    
    
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:self.mTextField.placeholder attributes:mutDic];
    self.mTextField.attributedPlaceholder = attr;
}

- (void)_setPFontSize:(CGFloat)pFontSize {
    
    NSRange rp = [self.mTextField.placeholder rangeOfString:self.mTextField.placeholder];
    UIFont *oldFont = [self.mTextField.attributedPlaceholder attribute:NSFontAttributeName atIndex:0 effectiveRange:&rp];
    UIFont *newFont = [UIFont fontWithName:oldFont.fontName size:pFontSize];
    
    
    NSDictionary *oldAttrDic = [self.mTextField.attributedPlaceholder attributesAtIndex:0 effectiveRange:&rp];
    NSDictionary *mutDic = [NSMutableDictionary dictionaryWithDictionary:oldAttrDic];
    [mutDic setValue:newFont forKey:NSFontAttributeName];
    
    
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:self.mTextField.placeholder attributes:mutDic];
    self.mTextField.attributedPlaceholder = attr;
    
}

- (void)_setPFontColor:(NSString *)pFontColor {
    
    NSRange rp = [self.mTextField.placeholder rangeOfString:self.mTextField.placeholder];
    //UIColor *oldColor = [self.mTextField.attributedPlaceholder attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:&rp];
    UIColor *newColor = [self colorWithHexString:pFontColor alpha:1];
    
    
    NSDictionary *oldAttrDic = [self.mTextField.attributedPlaceholder attributesAtIndex:0 effectiveRange:&rp];
    NSDictionary *mutDic = [NSMutableDictionary dictionaryWithDictionary:oldAttrDic];
    [mutDic setValue:newColor forKey:NSForegroundColorAttributeName];
    
    
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:self.mTextField.placeholder attributes:mutDic];
    self.mTextField.attributedPlaceholder = attr;
    
}

- (void)_setPString:(NSString *)pString {
    NSRange rp = [self.mTextField.placeholder rangeOfString:self.mTextField.placeholder];
    NSDictionary *oldAttrDic = [self.mTextField.attributedPlaceholder attributesAtIndex:0 effectiveRange:&rp];
    
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:self.mTextField.placeholder attributes:oldAttrDic];
    self.mTextField.attributedPlaceholder = attr;
}

- (void)_setFontName:(NSString *)fontName {
    
    NSRange rp = [self.mTextField.text rangeOfString:self.mTextField.text];
    UIFont *oldFont = [self.mTextField.attributedText attribute:NSFontAttributeName atIndex:0 effectiveRange:&rp];
//    UIFont *newFont = [UIFont fontWithName:fontName size:oldFont.pointSize];
//
//    NSDictionary *oldAttrDic = [self.mTextField.attributedText attributesAtIndex:0 effectiveRange:&rp];
//    NSDictionary *mutDic = [NSMutableDictionary dictionaryWithDictionary:oldAttrDic];
//    [mutDic setValue:newFont forKey:NSFontAttributeName];
//
//    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:self.mTextField.text attributes:mutDic];
//    self.mTextField.attributedText = attr;
    
    
    self.mTextField.font = [UIFont fontWithName:fontName size:oldFont.pointSize];
}

- (void)_setFontSize:(CGFloat)fontSize {
    
    NSRange rp = [self.mTextField.text rangeOfString:self.mTextField.text];
    UIFont *oldFont = [self.mTextField.attributedText attribute:NSFontAttributeName atIndex:0 effectiveRange:&rp];
//    UIFont *newFont = [UIFont fontWithName:oldFont.fontName size:fontSize];
//
//    NSDictionary *oldAttrDic = [self.mTextField.attributedText attributesAtIndex:0 effectiveRange:&rp];
//    NSDictionary *mutDic = [NSMutableDictionary dictionaryWithDictionary:oldAttrDic];
//    [mutDic setValue:newFont forKey:NSFontAttributeName];
//
//    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:self.mTextField.text attributes:mutDic];
//    self.mTextField.attributedText = attr;

    self.mTextField.font = [UIFont fontWithName:oldFont.fontName size:fontSize];
}

- (void)_setFontColor:(NSString *)fontColor {
    
    NSRange rp = [self.mTextField.text rangeOfString:self.mTextField.text];
    //UIColor *oldColor = [self.mTextField.attributedPlaceholder attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:&rp];
    UIColor *newColor = [self colorWithHexString:fontColor alpha:1];
    
//    NSDictionary *oldAttrDic = [self.mTextField.attributedText attributesAtIndex:0 effectiveRange:&rp];
//    NSDictionary *mutDic = [NSMutableDictionary dictionaryWithDictionary:oldAttrDic];
//    [mutDic setValue:newColor forKey:NSForegroundColorAttributeName];
//
//    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:self.mTextField.text attributes:mutDic];
//    self.mTextField.attributedText = attr;
    
    self.mTextField.textColor = newColor;
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
