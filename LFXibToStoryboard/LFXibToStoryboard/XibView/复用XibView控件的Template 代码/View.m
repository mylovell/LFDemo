//
//  View.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/11.
//  Copyright © 2020 9130. All rights reserved.
//

#import "View.h"

@implementation View

- (void)setUnifySet:(NSString *)unifySet {
    if (unifySet.intValue > 0) {
        self.cornerRadius = 8;
        self.borderColor = @"942193";
        self.borderWidth = 3;
        self.backColor = @"FF9300";
    }
}

@end
