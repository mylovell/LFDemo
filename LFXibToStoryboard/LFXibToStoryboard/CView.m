//
//  CView.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/9.
//  Copyright © 2020 9130. All rights reserved.
//

#import "CView.h"

@implementation CView

// 用于在xib、storyboard中可以实时显示
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"%s",__func__);
        [self setupView];
    }
    return self;
}

// 用于运行起来可以从xib、storyboard加载出来，否则跑起来不显示该view
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"%s",__func__);
        [self setupView];
    }
    return self;
}

- (void)setupView {
    
    UIButton *button = [UIButton buttonWithType:0];
    button.frame = CGRectMake(0, 0, 200, 40);
    [button setTitle:@"LFTestView：测试在IB_DESIGNABLE下做界面" forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.backgroundColor = [UIColor yellowColor];
    
    button.layer.borderWidth = 2;
    button.layer.borderColor = [UIColor greenColor].CGColor;
    button.layer.cornerRadius = 10;
    
    [self addSubview:button];
    self.cButton = button;
    
    self.backgroundColor = [UIColor blueColor];
    
}

@end
