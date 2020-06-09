//
//  XibView2.m
//  Single
//
//  Created by Feng Luo on 2020/3/14.
//  Copyright © 2020 Feng Luo. All rights reserved.
//

#import "XibView2.h"

@implementation XibView2


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    
    // 1、添加子控件，会实时显示
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.text = @"XibView2";
    label.font = [UIFont systemFontOfSize:13];
    [self addSubview:label];
    
    // 2、设置其他对象的属性，也会实时显示
    self.layer.borderWidth = 2;
    self.layer.borderColor = [UIColor redColor].CGColor;
    
    // 3、但是设置自身属性，不会实时显示，需要通过 IBInspectable 来设置
    self.backgroundColor = [UIColor redColor];
    self.alpha = 0.5;
}

@end
