//
//  ViewController.m
//  LFMasonry
//
//  Created by luofeng on 2020/6/7.
//  Copyright © 2020 9130. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "UIView+removeConstraints.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

//@property (weak, nonatomic) UIView *redView;
@property (nonatomic ,assign) CGFloat x;
@property (nonatomic ,assign) CGFloat y;
@property (nonatomic ,assign) CGFloat width;
@property (nonatomic ,assign) CGFloat height;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.x = 11;
    self.y = 81;
    self.width = 100;
    self.height = 100;
    
//    UIView *redView = [UIView new];
//    redView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:redView];
//    self.redView = redView;
//
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.center.equalTo(self.view);
//        make.top.mas_equalTo(self.y);
//        make.left.mas_equalTo(self.x);
//        make.width.mas_equalTo(self.width);
//        make.height.mas_equalTo(self.height);
//    }];
    
    NSLog(@"redView:%@",self.redView);
}

- (IBAction)update:(UIButton *)sender {
    self.x += 10;
    self.y += 10;
    self.width += 10;
    self.height += 10;
    
    
//    [self.redView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.y);
//        make.left.mas_equalTo(self.x);
//        make.width.mas_equalTo(self.width);
//        make.height.mas_equalTo(self.height);
//    }];
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.y);
        make.left.mas_equalTo(self.x);
        make.width.mas_equalTo(self.width);
        make.height.mas_equalTo(self.height);
    }];
    
//    [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.y);
//    //        make.left.mas_equalTo(self.x);
//    //        make.width.mas_equalTo(self.width);
//    //        make.height.mas_equalTo(self.height);
//        }];
}

- (IBAction)log:(UIButton *)sender {
    NSLog(@"%@",self.redView.constraints);
    NSLog(@"%@",self.view.constraints);
    NSLog(@"===================================");
}

- (IBAction)remove:(UIButton *)sender {
    
    [self.redView removeAllConstraints];
}




@end
