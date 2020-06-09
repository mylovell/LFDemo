//
//  LFViewController.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/8.
//  Copyright © 2020 9130. All rights reserved.
//

#import "LFViewController.h"
#import "LFButton11.h"

@interface LFViewController ()

@end

@implementation LFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)button1Action:(LFButton11 *)sender {
    NSLog(@"%s",__func__);
}
- (IBAction)button2Action:(LFButton11 *)sender {
    NSLog(@"%s",__func__);
}


@end
