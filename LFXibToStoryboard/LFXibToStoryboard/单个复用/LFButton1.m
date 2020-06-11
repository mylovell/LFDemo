//
//  LFButton1.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/8.
//  Copyright © 2020 9130. All rights reserved.
//

#import "LFButton1.h"

@implementation LFButton1

- (void)setUnifySet:(NSString *)unifySet {
    if (unifySet.intValue > 0) {
        self.fontName = @"PingFangSC-Semibold";
        self.fontColor = @"FF2600";
        self.fontSize = 20;
        self.cornerRadius = 5;
        self.borderWidth = 4;
        self.borderColor = @"008F00";
        self.backColor = @"FF9300";
    }
}

@end
