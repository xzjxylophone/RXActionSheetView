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

#pragma mark - Action
- (void)vBgAction:(id)sender
{
    [self close];
}
#pragma mark - Private
- (void)setFrameTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
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
    self.showCompletion = completion;
    [self.backgroundView addSubview:self];
    UIView *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.backgroundView];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    [self setFrameTop:height];
    CGFloat selfY = 0;
    switch (self.e_RX_ActionSheetViewAnimatePosition) {
        case kE_RX_ActionSheetViewAnimatePosition_Top:
        {
            selfY = 0;
        }
            break;
        case kE_RX_ActionSheetViewAnimatePosition_Mid:
        {
            
            selfY = (height - self.frame.size.height) / 2.0f;
        }
            break;
        case kE_RX_ActionSheetViewAnimatePosition_Bottom:
        {
            
            selfY = (height - self.frame.size.height);
        }
            break;
        default:
            break;
    }
    
    if (self.isSupportAnimate) {
        [UIView beginAnimations:@"abc" context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationDidStop:showFinished:)];
    }
    [self setFrameTop:selfY];
    if (!self.isSupportAnimate) {
        [self safeBlock_showCompletion];
    }
    if (self.isSupportAnimate) {
        [UIView commitAnimations];
    }
    
}

- (void)closeWithCompletion:(void(^)(void))completion
{
    self.closeCompletion = completion;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if (self.isSupportAnimate) {
        [UIView beginAnimations:@"stop" context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
    } else {
        [self.backgroundView removeFromSuperview];
        [self removeFromSuperview];
        [self safeBlock_closeCompletion];
    }
    [self setFrameTop:height];
    if (self.isSupportAnimate) {
        [UIView commitAnimations];
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
