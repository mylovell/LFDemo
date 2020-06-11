//
//  ViewController2.m
//  LFXIb
//
//  Created by luofeng on 2020/6/11.
//  Copyright © 2020 9130. All rights reserved.
//

#import "ViewController2.h"
#import "LFView.h"

@interface ViewController2 ()

@property (weak, nonatomic) IBOutlet LFView *mLFView1;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mLFView1.lfLabel.textColor = [UIColor brownColor];
    [self.mLFView1 lfViewAction:^(UIButton *button){
        NSLog(@"点击了button:%@",button);
    } action2:^(NSInteger index) {
        NSLog(@"点击了segmented: %li",(long)index);
    }];
    
}


@end
