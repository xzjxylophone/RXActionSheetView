//
//  RXActionSheetView.h
//  YYTS
//
//  Created by Rush.D.Xzj on 15/9/24.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXActionSheetView : UIView

@property (nonatomic, strong) UIView *vBg;
@property (nonatomic, strong) UIView *vMain;


@property (nonatomic, readonly) CGFloat showY;


// 是否支持点击其他地方消失关闭
@property (nonatomic, assign) BOOL isSupportClickOtherToClose;
// 是否支持显示和关闭的动画
@property (nonatomic, assign) BOOL isSupportAnimate;


- (void)show;
- (void)close;

+ (id)rxActionSheetView;

@end
