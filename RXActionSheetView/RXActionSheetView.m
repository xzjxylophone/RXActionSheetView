//
//  RXActionSheetView.m
//  YYTS
//
//  Created by Rush.D.Xzj on 15/9/24.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXActionSheetView.h"

@interface RXActionSheetView ()


@property (nonatomic, strong) UITapGestureRecognizer *tgr;


@property (nonatomic, copy) void(^closeCompletion)(void);
@property (nonatomic, copy) void(^showCompletion)(void);

@property (nonatomic, assign) E_RX_ActionSheetViewAnimateDirection closeDirection;
@end



@implementation RXActionSheetView

#pragma mark - Proverty
- (UITapGestureRecognizer *)tgr
{
    if (_tgr == nil) {
        _tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(vBgAction:)];
    }
    return _tgr;
}
- (void)setIsSupportClickOtherToClose:(BOOL)isSupportClickOtherToClose
{
    _isSupportClickOtherToClose = isSupportClickOtherToClose;
    if (isSupportClickOtherToClose) {
        self.backgroundView.userInteractionEnabled = YES;
        [self.backgroundView addGestureRecognizer:self.tgr];
    } else {
        [self.backgroundView removeGestureRecognizer:self.tgr];
    }
}
- (void)setE_RX_ActionSheetViewAnimateDirection:(E_RX_ActionSheetViewAnimateDirection)e_RX_ActionSheetViewAnimateDirection
{
    _e_RX_ActionSheetViewAnimateDirection = e_RX_ActionSheetViewAnimateDirection;
    switch (e_RX_ActionSheetViewAnimateDirection) {
        case kE_RX_ActionSheetViewAnimateDirection_FromTopToBottom:
        {
            self.closeDirection = kE_RX_ActionSheetViewAnimateDirection_FromBottomToTop;
        }
            break;
        case kE_RX_ActionSheetViewAnimateDirection_FromBottomToTop:
        {
            self.closeDirection = kE_RX_ActionSheetViewAnimateDirection_FromTopToBottom;
        }
            break;
        case kE_RX_ActionSheetViewAnimateDirection_FromLeftToRight:
        {
            self.closeDirection = kE_RX_ActionSheetViewAnimateDirection_FromRightToLeft;
        }
            break;
        case kE_RX_ActionSheetViewAnimateDirection_FromRightToLeft:
        {
            self.closeDirection = kE_RX_ActionSheetViewAnimateDirection_FromLeftToRight;
        }
            break;
        default:
            break;
    }
}

#pragma mark - Action
- (void)vBgAction:(id)sender
{
    [self close];
}
#pragma mark - Private
- (void)__private_setFrameTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}
- (void)__private_setFrameLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}
- (void)__private_setFrameOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin.x = origin.x;
    frame.origin.y = origin.y;
    self.frame = frame;
}
#pragma mark - Constructor And Destructor
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height)];
        self.backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.isSupportClickOtherToClose = YES;
        self.backgroundColor = [UIColor clearColor];
        self.isSupportAnimate = YES;
        self.e_RX_ActionSheetViewAnimatePosition = kE_RX_ActionSheetViewAnimatePosition_Mid;
        self.e_RX_ActionSheetViewAnimateDirection = kE_RX_ActionSheetViewAnimateDirection_FromBottomToTop;
    }
    return self;
}

#pragma mark - Public Method
- (void)show
{
    [self showWithCompletion:nil];
}
- (void)close
{
    [self closeWithCompletion:nil];
}
- (void)showWithCompletion:(void(^)(void))completion
{
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(0, 0);
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat selfWidth = self.frame.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat selfHeigth = self.frame.size.height;
    switch (self.e_RX_ActionSheetViewAnimateDirection) {
        case kE_RX_ActionSheetViewAnimateDirection_FromLeftToRight:
        case kE_RX_ActionSheetViewAnimateDirection_FromRightToLeft:
        {
            CGFloat endLeft = 0;
            switch (self.e_RX_ActionSheetViewAnimatePosition) {
                case kE_RX_ActionSheetViewAnimatePosition_Left:
                {
                    endLeft = 0;
                }
                    break;
                case kE_RX_ActionSheetViewAnimatePosition_Right:
                {
                    endLeft = (width - selfWidth);
                }
                    break;
                case kE_RX_ActionSheetViewAnimatePosition_Mid:
                case kE_RX_ActionSheetViewAnimatePosition_Top:
                case kE_RX_ActionSheetViewAnimatePosition_Bottom:
                default:
                {
                    endLeft = (width - selfWidth) / 2.0f;
                }
                    break;
            }
            endPoint.x = endLeft;
//            endPoint.y = (height - selfHeigth) / 2.0f;
            if (self.isSupportAnimate) {
                CGFloat startLeft = 0;
                if (self.e_RX_ActionSheetViewAnimateDirection == kE_RX_ActionSheetViewAnimateDirection_FromLeftToRight) {
                    startLeft = -selfWidth;
                } else {
                    startLeft = width;
                }
                startPoint.x = startLeft;
            } else {
            }
            
        }
            break;
        case kE_RX_ActionSheetViewAnimateDirection_FromTopToBottom:
        case kE_RX_ActionSheetViewAnimateDirection_FromBottomToTop:
        default:
        {
            CGFloat endTop = 0;
            switch (self.e_RX_ActionSheetViewAnimatePosition) {
                case kE_RX_ActionSheetViewAnimatePosition_Top:
                {
                    endTop = 0;
                }
                    break;
                case kE_RX_ActionSheetViewAnimatePosition_Bottom:
                {
                    endTop = (height - selfHeigth);
                }
                    break;
                case kE_RX_ActionSheetViewAnimatePosition_Mid:
                case kE_RX_ActionSheetViewAnimatePosition_Left:
                case kE_RX_ActionSheetViewAnimatePosition_Right:
                default:
                {
                    endTop = (height - selfHeigth) / 2.0f;
                }
                    break;
            }
            endPoint.y = endTop;
            if (self.isSupportAnimate) {
                CGFloat startTop = 0;
                if (self.e_RX_ActionSheetViewAnimateDirection == kE_RX_ActionSheetViewAnimateDirection_FromTopToBottom) {
                    startTop = -selfHeigth;
                } else {
                    startTop = height;
                }
                startPoint.y = startTop;
            } else {
            }
        }
            break;
    }
    [self showWithStartPoint:startPoint endPoint:endPoint completion:completion];
    
}

- (void)closeWithCompletion:(void(^)(void))completion
{
    CGPoint endPoint = CGPointMake(0, 0);
    switch (self.closeDirection) {
        case kE_RX_ActionSheetViewAnimateDirection_FromLeftToRight:
        case kE_RX_ActionSheetViewAnimateDirection_FromRightToLeft:
        {
            CGFloat width = [UIScreen mainScreen].bounds.size.width;
            CGFloat selfWidth = self.frame.size.width;
            CGFloat endLeft = 0;
            switch (self.closeDirection) {
                case kE_RX_ActionSheetViewAnimateDirection_FromLeftToRight:
                    endLeft = width;
                    break;
                case kE_RX_ActionSheetViewAnimateDirection_FromRightToLeft:
                default:
                    endLeft = -selfWidth;
                    break;
            }
            endPoint.x = endLeft;
        }
            break;
        case kE_RX_ActionSheetViewAnimateDirection_FromTopToBottom:
        case kE_RX_ActionSheetViewAnimateDirection_FromBottomToTop:
        default:
        {
            CGFloat height = [UIScreen mainScreen].bounds.size.height;
            CGFloat selfHeigth = self.frame.size.height;
            CGFloat endTop = 0;
            switch (self.closeDirection) {
                case kE_RX_ActionSheetViewAnimateDirection_FromBottomToTop:
                    endTop = -selfHeigth;
                    break;
                case kE_RX_ActionSheetViewAnimateDirection_FromTopToBottom:
                default:
                    endTop = height;
                    break;
            }
            endPoint.y = endTop;
        }
            break;
    }
    [self closeWithEndPotin:endPoint completion:completion];
}



- (void)showWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint completion:(void(^)(void))completion
{
    self.showCompletion = completion;
    [self.backgroundView addSubview:self];
    UIView *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.backgroundView];
    switch (self.e_RX_ActionSheetViewAnimateDirection) {
        case kE_RX_ActionSheetViewAnimateDirection_FromLeftToRight:
        case kE_RX_ActionSheetViewAnimateDirection_FromRightToLeft:
        {
            CGFloat endLeft = endPoint.x;
            if (self.isSupportAnimate) {
                CGFloat startLeft = startPoint.x;
                [self __private_setFrameLeft:startLeft];
                [UIView beginAnimations:@"abc" context:nil];
                [UIView setAnimationDuration:0.5];
                [UIView setAnimationDelegate:self];
                [UIView setAnimationDidStopSelector:@selector(animationDidStop:showFinished:)];
                [self __private_setFrameLeft:endLeft];
                [UIView commitAnimations];
            } else {
                [self __private_setFrameLeft:endLeft];
                [self safeBlock_showCompletion];
            }
        }
            break;
        case kE_RX_ActionSheetViewAnimateDirection_FromTopToBottom:
        case kE_RX_ActionSheetViewAnimateDirection_FromBottomToTop:
        default:
        {
            CGFloat endTop = endPoint.y;
            if (self.isSupportAnimate) {
                CGFloat startTop = startPoint.y;
                [self __private_setFrameTop:startTop];
                [UIView beginAnimations:@"abc" context:nil];
                [UIView setAnimationDuration:0.5];
                [UIView setAnimationDelegate:self];
                [UIView setAnimationDidStopSelector:@selector(animationDidStop:showFinished:)];
                [self __private_setFrameTop:endTop];
                [UIView commitAnimations];
            } else {
                [self __private_setFrameTop:endTop];
                [self safeBlock_showCompletion];
            }
        }
            break;
    }
}

- (void)closeWithEndPotin:(CGPoint)endPoint completion:(void(^)(void))completion
{
    self.closeCompletion = completion;
    switch (self.closeDirection) {
        case kE_RX_ActionSheetViewAnimateDirection_FromLeftToRight:
        case kE_RX_ActionSheetViewAnimateDirection_FromRightToLeft:
        {
            CGFloat endLeft = endPoint.x;
            if (self.isSupportAnimate) {
                [UIView beginAnimations:@"stop" context:nil];
                [UIView setAnimationDuration:0.5];
                [UIView setAnimationDelegate:self];
                [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
                [self __private_setFrameLeft:endLeft];
                [UIView commitAnimations];
            } else {
                [self.backgroundView removeFromSuperview];
                [self removeFromSuperview];
                [self safeBlock_closeCompletion];
                [self __private_setFrameLeft:endLeft];
            }
        }
            break;
        case kE_RX_ActionSheetViewAnimateDirection_FromTopToBottom:
        case kE_RX_ActionSheetViewAnimateDirection_FromBottomToTop:
        default:
        {
            CGFloat endTop = endPoint.y;
            if (self.isSupportAnimate) {
                [UIView beginAnimations:@"stop" context:nil];
                [UIView setAnimationDuration:0.5];
                [UIView setAnimationDelegate:self];
                [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
                [self __private_setFrameTop:endTop];
                [UIView commitAnimations];
            } else {
                [self.backgroundView removeFromSuperview];
                [self removeFromSuperview];
                [self safeBlock_closeCompletion];
                [self __private_setFrameTop:endTop];
            }
        }
            break;
    }
}








#pragma mark - Animation Stop Action
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self.backgroundView removeFromSuperview];
    [self removeFromSuperview];
    [self safeBlock_closeCompletion];
}
- (void)animationDidStop:(CAAnimation *)anim showFinished:(BOOL)flag
{
    [self safeBlock_showCompletion];
}
#pragma mark - Safe Block
- (void)safeBlock_closeCompletion
{
    if (self.closeCompletion != nil) {
        self.closeCompletion();
        self.closeCompletion = nil;
    }
}
- (void)safeBlock_showCompletion
{
    if (self.showCompletion != nil) {
        self.showCompletion();
        self.showCompletion = nil;
    }
}
#pragma mark - Class Method
+ (id)rxActionSheetView
{
    Class cls = [self class];
    id result = [[cls alloc] initWithFrame:CGRectZero];
    return result;
}

@end
