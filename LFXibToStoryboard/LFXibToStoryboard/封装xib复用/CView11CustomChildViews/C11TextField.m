//
//  C11TextField.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/10.
//  Copyright © 2020 9130. All rights reserved.
//

#import "C11TextField.h"

@implementation C11TextField

- (void)setUnifySet:(NSString *)unifySet {
    if (unifySet.intValue > 0) {
        
        self.phFontName = @"PingFangSC-Regular";
        self.phFontColor = @"9437FF";// 葡萄紫
        self.phFontSize = 14;
        
        self.fontName = @"PingFangSC-Medium";
        self.fontColor = @"FF2600";// 红
        self.fontSize = 18;
        
        self.cornerRadius = 10;
        
        self.borderWidth = 4;
        self.borderColor = @"008F00";
        self.backColor = @"8EFA00";
        
        self.cursorColor = @"FF2600";
    }
}

@end
