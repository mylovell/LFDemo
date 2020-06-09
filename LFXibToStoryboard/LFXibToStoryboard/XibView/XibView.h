//
//  XibView.h
//  Single
//
//  Created by Feng Luo on 2020/3/14.
//  Copyright © 2020 Feng Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/*
XibLabel 可做为父类，供其他子类继承，这样子类也享有父类的功能：
1、实用属性可视化，（IBInspectable）
2、界面实时更新显示。（IB_DESIGNABLE）

*/

IB_DESIGNABLE

@interface XibView : UIView

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable NSString *borderColor;
@property (nonatomic, strong) IBInspectable NSString *backColor;// 背景颜色

@end

NS_ASSUME_NONNULL_END
