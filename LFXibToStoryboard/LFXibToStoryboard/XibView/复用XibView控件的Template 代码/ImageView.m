//
//  ImageView.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/11.
//  Copyright © 2020 9130. All rights reserved.
//

#import "ImageView.h"

@implementation ImageView

- (void)setUnifySet:(NSString *)unifySet {
    if (unifySet.intValue > 0) {
        self.cornerRadius = 8;
        self.borderColor = @"FF2600";
        self.borderWidth = 4;
    }
}

@end
