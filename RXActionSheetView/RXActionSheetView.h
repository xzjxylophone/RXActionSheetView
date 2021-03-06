//
//  RXActionSheetView.h
//  YYTS
//
//  Created by Rush.D.Xzj on 15/9/24.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, E_RX_ActionSheetViewAnimatePosition) {
    kE_RX_ActionSheetViewAnimatePosition_Left,
    kE_RX_ActionSheetViewAnimatePosition_Right,
    kE_RX_ActionSheetViewAnimatePosition_Top,
    kE_RX_ActionSheetViewAnimatePosition_Bottom,
    kE_RX_ActionSheetViewAnimatePosition_Mid,
};


typedef NS_ENUM(NSInteger, E_RX_ActionSheetViewAnimateDirection) {
    kE_RX_ActionSheetViewAnimateDirection_FromLeftToRight,
    kE_RX_ActionSheetViewAnimateDirection_FromRightToLeft,
    kE_RX_ActionSheetViewAnimateDirection_FromTopToBottom,
    kE_RX_ActionSheetViewAnimateDirection_FromBottomToTop,
};


@interface RXActionSheetView : UIView

@property (nonatomic, strong) UIView *backgroundView;


// default is kE_RX_ActionSheetViewAnimatePosition_Mid
@property (nonatomic, assign) E_RX_ActionSheetViewAnimatePosition e_RX_ActionSheetViewAnimatePosition;
// default is kE_RX_ActionSheetViewAnimateDirection_FromBottomToTop
@property (nonatomic, assign) E_RX_ActionSheetViewAnimateDirection e_RX_ActionSheetViewAnimateDirection;
// default is YES
@property (nonatomic, assign) BOOL isSupportClickOtherToClose;
// default is YES
@property (nonatomic, assign) BOOL isSupportAnimate;
// default is 0.5
@property (nonatomic, assign) NSTimeInterval duration;


// backgroundViewTapGestureRecoginizer
@property (nonatomic, strong) UITapGestureRecognizer *backgroundViewTapGestureRecoginizer;


@property (nonatomic, copy) void(^closeCompletion)(void);
@property (nonatomic, copy) void(^showCompletion)(void);

@property (nonatomic, readonly) CGPoint startPoint;
@property (nonatomic, readonly) CGPoint endPoint;

// 是否是显示状态,default
@property (nonatomic, assign) BOOL isShow;




// can override this two method
// can use showWithStartPoint:endPoint:completion  And  closeWithEndPotin:completion
- (void)show;
- (void)close;

// use this please careful
- (void)showInView:(UIView *)view;
- (void)showInViewController:(UIViewController *)vc;

- (void)showWithCompletion:(void(^)(void))completion;
- (void)closeWithCompletion:(void(^)(void))completion;

- (void)showWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint completion:(void(^)(void))completion;
- (void)closeWithEndPotin:(CGPoint)endPoint completion:(void(^)(void))completion;





+ (id)rxActionSheetView;































@end
