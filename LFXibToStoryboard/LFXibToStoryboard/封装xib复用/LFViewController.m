//
//  LFViewController.m
//  LFXibToStoryboard
//
//  Created by luofeng on 2020/6/8.
//  Copyright © 2020 9130. All rights reserved.
//

#import "LFViewController.h"
#import "CView11.h"
#import "XibTextField.h"
#import "XibButton.h"
#import "C11TextField.h"
#import "C11Button.h"


@interface LFViewController ()
@property (weak, nonatomic) IBOutlet CView11 *view11;
@property (weak, nonatomic) IBOutlet C11TextField *c11TF;
@property (weak, nonatomic) IBOutlet XibTextField *lftextTF;

@end

@implementation LFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    CView11 *view = [[NSBundle mainBundle] loadNibNamed:@"CView11" owner:nil options:nil].firstObject;
//    view.frame = self.view11.bounds;
//    [self.view11 addSubview:view];
    
}

- (IBAction)changeTFPlaceHolder:(C11Button *)sender {
    self.c11TF.placeholder = @"placeholder修改";
    self.lftextTF.placeholder = @"请输入密码";
}


- (IBAction)TextField1Changed:(XibTextField *)sender {
    NSLog(@"%@",sender.text);
}
- (IBAction)switchChanged:(UISwitch *)sender {
    NSLog(@"%i",sender.on);
}


@end
