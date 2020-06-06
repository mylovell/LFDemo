//
//  ViewController.m
//  LFBase64
//
//  Created by luofeng on 2020/6/5.
//  Copyright © 2020 9130. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV1;
@property (weak, nonatomic) IBOutlet UIImageView *imageV2;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIView *playView1;
@property (weak, nonatomic) IBOutlet UIView *playView2;
@property (weak, nonatomic) IBOutlet UITextView *textView1;
@property (weak, nonatomic) IBOutlet UITextView *textView2;


@property (nonatomic ,strong) NSString *base64_data;
@property (nonatomic ,strong) NSString *base64_string;
@property (nonatomic ,strong) NSString *base64_mp3;
@property (nonatomic ,strong) NSString *base64_mp4;
@property (nonatomic ,strong) NSString *base64_txt;


@property (nonatomic ,strong) AVPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 编码 / 解码
/*
 编码：原始内容 --> NSData --> Base64
 解码：Base64 --> NSData --> 原始内容
 */


#pragma mark - UIImage / Base64
- (IBAction)imageToBase64String:(UIButton *)button {
    UIImage *originImage = [UIImage imageNamed:@"刷新"];
    
    NSData *data = UIImagePNGRepresentation(originImage);// 原图
    NSString *base64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    self.base64_data = base64;
    
    self.imageV1.image = originImage;
}

- (IBAction)base64StringToImage:(UIButton *)button {
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self.base64_data options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:data];
    self.imageV2.image = image;
}

#pragma mark - NSString / Base64
- (IBAction)NSStirngToBase64String:(UIButton *)button {
    NSString *originString = @"山雨欲来风满楼";
    
    NSData *data = [originString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    self.base64_string = base64;
    
    self.label1.text = originString;
}

- (IBAction)base64StringToNSString:(UIButton *)button {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self.base64_string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    self.label2.text = string;
}

#pragma mark - Mp3 / Base64
- (IBAction)Mp3ToBase64String:(UIButton *)sender {
    // initWithContentsOfFile: 不需要 file:// 前缀，因为就是本地的，无歧义。
    // initWithContentsOfURL:  需要  file:// 前缀，避免歧义，避免去网络请求
    NSString *path = [[NSBundle mainBundle] pathForResource:@"trophy.mp3" ofType:nil];
    path = [@"file://" stringByAppendingString:path];
    NSURL *URL = [NSURL URLWithString:path];
    
    NSData *data = [[NSData alloc] initWithContentsOfURL:URL];
    NSString *base64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    self.base64_mp3 = base64;
    
    // play
    AVPlayer *player = [[AVPlayer alloc] initWithURL:URL];
    self.player = player;
    [player play];
}

- (IBAction)base64StringToMp3:(UIButton *)sender {
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self.base64_mp3 options:NSDataBase64DecodingIgnoreUnknownCharacters];

    NSString *path = [NSTemporaryDirectory() stringByAppendingFormat:@"abc.mp3"];
    path = [@"file://" stringByAppendingString:path];
    NSURL *URL = [NSURL URLWithString:path];

    NSError *error;
    BOOL isWrite = [data writeToURL:URL options:(NSDataWritingAtomic) error:&error];
    NSLog(@"%i---%@---%@",isWrite,error,URL);
    
    if (isWrite) {
        AVPlayer *player = [[AVPlayer alloc] initWithURL:URL];
        self.player = player;
        [player play];
    }
    
}

#pragma mark - Mp4 / Base64
- (IBAction)Mp4ToBase64String:(UIButton *)sender {
    
    // mp4 write to local
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tictok1.mp4" ofType:nil inDirectory:nil];
    path = [@"file://" stringByAppendingString:path];
    NSURL *URL = [NSURL URLWithString:path];
    NSData *data = [[NSData alloc] initWithContentsOfURL:URL];
    NSString *base64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    self.base64_mp4 = base64;
    
    // play video
    AVPlayer *player = [[AVPlayer alloc] initWithURL:URL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = CGRectMake(0, 0, self.playView1.frame.size.width, self.playView1.frame.size.height);
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    [self.playView1.layer addSublayer:playerLayer];
    
    self.player = player;
    [player play];
    
}

- (IBAction)base64StringToMp4:(UIButton *)sender {
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self.base64_mp4 options:NSDataBase64DecodingIgnoreUnknownCharacters];

    // Write to local
    NSString *path = [NSTemporaryDirectory() stringByAppendingFormat:@"1.mp4"];
    path = [@"file://" stringByAppendingString:path];
    NSURL *URL = [NSURL URLWithString:path];
    NSError *error;
    BOOL isWrite = [data writeToURL:URL options:(NSDataWritingAtomic) error:&error];
    NSLog(@"%i---%@---%@",isWrite,error,URL);
    
    // play video
    if (isWrite) {
        AVPlayer *player = [[AVPlayer alloc] initWithURL:URL];
        AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
        playerLayer.frame = CGRectMake(0, 0, self.playView2.frame.size.width, self.playView2.frame.size.height);
        [self.playView2.layer addSublayer:playerLayer];
        
        [player play];
        self.player = player;
    }
}

#pragma mark - txt / Base64

- (IBAction)TxtToBase64String:(UIButton *)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"0608.txt" ofType:nil];
    path = [@"file://" stringByAppendingString:path];
    NSURL *URL = [NSURL URLWithString:path];
    
    NSData *data = [[NSData alloc] initWithContentsOfURL:URL];
    NSString *base64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    self.base64_txt = base64;
    
    // display txt
    self.textView1.text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
- (IBAction)base64StringToTxt:(UIButton *)sender {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self.base64_txt options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    self.textView2.text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
}



@end
