//
//  C11ImageView.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/10.
//  Copyright © 2020 9130. All rights reserved.
//

#import "C11ImageView.h"

@implementation C11ImageView


- (void)setUnifySet:(NSString *)unifySet {
    if (unifySet.intValue > 0) {
        self.cornerRadius = 8;
        self.borderColor = @"FF2600";
        self.borderWidth = 4;
    }
}


@end
