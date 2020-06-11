//
//  CView11.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/10.
//  Copyright © 2020 9130. All rights reserved.
//

#import "CView11.h"
#import <Masonry/Masonry.h>

@implementation CView11

- (void)setUnifySet:(NSString *)unifySet {
    if (unifySet.intValue > 0) {
        self.cornerRadius = 8;
        self.borderColor = @"942193";
        self.borderWidth = 3;
        self.backColor = @"FF9300";
    }
}



@end
