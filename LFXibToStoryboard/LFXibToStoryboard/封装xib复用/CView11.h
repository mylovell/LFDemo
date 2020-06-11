//
//  CView11.h
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/10.
//  Copyright © 2020 9130. All rights reserved.
//

#import "XibView.h"
#import "C11ImageView.h"
#import "C11Label.h"
#import "LFTestTF.h"

NS_ASSUME_NONNULL_BEGIN

@interface CView11 : XibView

@property (weak, nonatomic) IBOutlet C11ImageView *c11ImageView;
@property (weak, nonatomic) IBOutlet C11Label *c11Label;
@property (weak, nonatomic) IBOutlet LFTestTF *lfTestTF;


@end

NS_ASSUME_NONNULL_END
