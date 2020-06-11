//
//  C11Button.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/10.
//  Copyright © 2020 9130. All rights reserved.
//

#import "C11Button.h"

@implementation C11Button

- (void)setUnifySet:(NSString *)unifySet {
    if (unifySet.intValue > 0) {
        self.fontName = @"PingFangSC-Semibold";
        self.fontColor = @"FF2600";
        self.fontSize = 20;
        self.cornerRadius = 5;
        self.borderWidth = 4;
        self.borderColor = @"008F00";
        self.backColor = @"005493";
    }
}


@end
