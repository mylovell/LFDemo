//
//  XibImageView.h
//  Parents
//
//  Created by luofeng on 2020/5/14.
//  Copyright © 2020 9130. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE

@interface XibImageView : UIImageView

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable NSString *borderColor;

@property (nonatomic, strong) IBInspectable NSString *unifySet;/// 统一设置（在子类使用，在子类中实现setter，给上面的 IBInspectable 属性赋值）

@end

NS_ASSUME_NONNULL_END
