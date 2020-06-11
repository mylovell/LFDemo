//
//  TextField.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/11.
//  Copyright © 2020 9130. All rights reserved.
//

#import "TextField.h"

@implementation TextField

- (void)setUnifySet:(NSString *)unifySet {
    if (unifySet.intValue > 0) {
        
        self.cornerRadius = 10;
        self.borderWidth = 4;
        self.borderColor = @"008F00";
        self.backColor = @"8EFA00";
        
        self.phFontName = @"PingFangSC-Regular";
        self.phFontColor = @"9437FF";// 葡萄紫
        self.phFontSize = 14;
        
        self.fontName = @"PingFangSC-Medium";
        self.fontColor = @"FF2600";// 红
        self.fontSize = 18;
        
        self.cursorColor = @"FF2600";
    }
}

@end
