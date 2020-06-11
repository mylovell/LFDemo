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
//        NSLog(@"%s",__func__);
        [self setupView];
    }
    return self;
}

// 从xib、storyboard加载，经过此方法
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
//        NSLog(@"%s",__func__);
        [self setupView];
    }
    return self;
}

- (void)setupView {
    
}

- (void)setUnifySet:(NSString *)unifySet {
    
    if (unifySet.intValue > 0) {
        self.cornerRadius = 10;
        
        self.borderWidth = 3;
        self.borderColor = @"0433FF";
        self.backColor = @"FFFB00";
    }
    
}

@end
