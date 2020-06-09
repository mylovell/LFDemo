//
//  LFButton2.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/9.
//  Copyright © 2020 9130. All rights reserved.
//

#import "LFButton2.h"
#import "UIColor+MQHex.h"

@implementation LFButton2


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"%s",__func__);
        // 为了能在 xib 中看到 layer 的设置【代码中的设置，只有initWithFrame中的设置才会在xib中展示】
        
//        [self.titleLabel setFont:[UIFont systemFontOfSize:10]];
//        [self setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
//        [self setBackgroundColor:[UIColor yellowColor]];
//        self.layer.cornerRadius = 20;
//        self.layer.borderColor = [UIColor purpleColor].CGColor;
//        self.layer.borderWidth = 2;
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"%s",__func__);
        // 为了能让 xib 中加载出来的 layer 被真正设置
//        [self _commonUse];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"%s",__func__);
//    [self _commonUse];
    
    NSLog(@"---");
}


@end
