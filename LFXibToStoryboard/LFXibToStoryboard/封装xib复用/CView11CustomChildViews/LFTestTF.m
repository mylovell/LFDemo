//
//  LFTestTF.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/11.
//  Copyright © 2020 9130. All rights reserved.
//

#import "LFTestTF.h"

@implementation LFTestTF

- (void)setUnifySet:(NSString *)unifySet {
    if (unifySet.intValue > 0) {
        
        self.phFontName = @"PingFangSC-Thin";
        self.phFontSize = 12;
        self.phFontColor = @"FF9300";// 橘红色
        
        self.fontName = @"PingFangSC-Semibold";
        self.fontColor = @"FF2600";// 红
        self.fontSize = 18;
        
        self.cornerRadius = 5;
        self.borderWidth = 4;
        self.borderColor = @"941751";// 栗色
        self.backColor = @"00FDFF";// 蓝绿色
    }
}

@end
