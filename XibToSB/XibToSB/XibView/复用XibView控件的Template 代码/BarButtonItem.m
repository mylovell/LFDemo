//
//  BarButtonItem.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/11.
//  Copyright © 2020 9130. All rights reserved.
//

#import "BarButtonItem.h"

@implementation BarButtonItem

- (void)setUnifySet:(NSString *)unifySet {
    if (unifySet.intValue > 0) {
        self.fontName = @"PingFangSC-Semibold";
        self.fontColor = @"FF2600";
        self.fontSize = 20;
    }
}

@end
