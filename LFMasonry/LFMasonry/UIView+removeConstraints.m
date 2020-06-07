//
//  UIView+removeConstraints.m
//  LFMasonry
//
//  Created by luofeng on 2020/6/7.
//  Copyright © 2020 9130. All rights reserved.
//

#import "UIView+removeConstraints.h"

@implementation UIView (removeConstraints)

/// 一直玩上遍历父控件，寻找含有该view的约束，找到就删除，一直到没有父控件了。可删Masonry和storyboard中的布局。这种方案不太优雅
- (void)removeAllConstraints
{
    
    // 该view 在父控件上的布局删掉
    UIView *superview = self.superview;
    while (superview != nil) {
        for (NSLayoutConstraint *c in superview.constraints) {
            if (c.firstItem == self || c.secondItem == self) {
                [superview removeConstraint:c];
            }
        }
        superview = superview.superview;
    }

    // 该view 在自身的布局删掉
    [self removeConstraints:self.constraints];
    
    // 自动设置布局
//    self.translatesAutoresizingMaskIntoConstraints = YES;
}

@end
