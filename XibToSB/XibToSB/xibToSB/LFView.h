//
//  LFView.h
//  LFXIb
//
//  Created by luofeng on 2020/6/11.
//  Copyright © 2020 9130. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^LFViewButtonActionBlock)(UIButton *button);
typedef void(^LFViewSegmentedActionBlock)(NSInteger index);

@interface LFView : UIView

// 拿到内部的控件，可再次自定义操作
@property (weak, nonatomic) IBOutlet UILabel *lfLabel;


// 内部控件事件回调
- (void)lfViewAction:(LFViewButtonActionBlock)block1 action2:(LFViewSegmentedActionBlock)block2;

@end

NS_ASSUME_NONNULL_END
