//
//  LFView.m
//  LFXIb
//
//  Created by luofeng on 2020/6/11.
//  Copyright © 2020 9130. All rights reserved.
//

#import "LFView.h"

@interface LFView ()

@property (nonatomic ,strong) LFViewButtonActionBlock block1;
@property (nonatomic ,strong) LFViewSegmentedActionBlock block2;

@end

@implementation LFView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        UIView *view = [[NSBundle mainBundle] loadNibNamed:@"LFCustom" owner:self options:nil].firstObject;
        view.frame = CGRectMake(10, 10, 320, 220);
        [self addSubview:view];
    }
    return self;
}

- (void)lfViewAction:(LFViewButtonActionBlock)block1 action2:(LFViewSegmentedActionBlock)block2 {
    self.block1 = block1;
    self.block2 = block2;
}

- (IBAction)iButtonAction:(UIButton *)sender {
//    NSLog(@"%s",__func__);
    if (self.block1) {
        self.block1(sender);
    }
}

- (IBAction)segmentedChanged:(UISegmentedControl *)sender {
//    NSLog(@"%s -- %li",__func__,(long)sender.selectedSegmentIndex);
    if (self.block2) {
        self.block2(sender.selectedSegmentIndex);
    }
}

@end
