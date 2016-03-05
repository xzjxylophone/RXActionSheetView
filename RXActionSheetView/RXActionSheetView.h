//
//  RXActionSheetView.h
//  YYTS
//
//  Created by Rush.D.Xzj on 15/9/24.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum E_RX_ActionSheetViewAnimatePosition {
    kE_RX_ActionSheetViewAnimatePosition_Top,
    kE_RX_ActionSheetViewAnimatePosition_Mid,
    kE_RX_ActionSheetViewAnimatePosition_Bottom,
}E_RX_ActionSheetViewAnimatePosition;


@interface RXActionSheetView : UIView

@property (nonatomic, strong) UIView *backgroundView;


// 默认是 Mid
@property (nonatomic, assign) E_RX_ActionSheetViewAnimatePosition e_RX_ActionSheetViewAnimatePosition;



// 是否支持点击其他地方消失关闭
@property (nonatomic, assign) BOOL isSupportClickOtherToClose;
// 是否支持显示和关闭的动画
@property (nonatomic, assign) BOOL isSupportAnimate;


- (void)show;
- (void)close;

- (void)showWithCompletion:(void(^)(void))completion;
- (void)closeWithCompletion:(void(^)(void))completion;


+ (id)rxActionSheetView;

@end
