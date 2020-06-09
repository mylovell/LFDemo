//
//  ViewController.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/8.
//  Copyright © 2020 9130. All rights reserved.
//

#import "ViewController.h"
#import "LFButton1.h"
#import "LFLabel1.h"
#import "LFViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LFButton1 *button1 = [[NSBundle mainBundle] loadNibNamed:@"LFButton1" owner:nil options:nil].firstObject;
    button1.frame = CGRectMake(10, 460, 200, 40);
    [self.view addSubview:button1];

//    LFLabel1 *label1 = [[NSBundle mainBundle] loadNibNamed:@"LFLabel1" owner:nil options:nil].firstObject;
//    label1.frame = CGRectMake(10, 260, 200, 40);
//    [self.view addSubview:label1];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateInitialViewController];
    vc.modalPresentationStyle = 0;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
