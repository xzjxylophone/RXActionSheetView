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


@end



@implementation RXActionSheetView


- (UITapGestureRecognizer *)tgr
{
    if (_tgr == nil) {
        _tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(vBgAction:)];
    }
    return _tgr;
}

- (void)vBgAction:(id)sender
{
    [self close];
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

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height)];
        self.backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.isSupportClickOtherToClose = YES;
        self.backgroundColor = [UIColor clearColor];
        
        
        
    }
    return self;
}

- (void)setFrameTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}



- (CGFloat)showY
{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    return (height - self.frame.size.height) / 2.0f;
}


- (void)show
{
    [self.backgroundView addSubview:self];
    UIView *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.backgroundView];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat selfY = self.showY;
    [self setFrameTop:height];
    if (self.isSupportAnimate) {
        [UIView beginAnimations:@"abc" context:nil];
        [UIView setAnimationDuration:0.5];
    }
    [self setFrameTop:selfY];
    if (self.isSupportAnimate) {
        [UIView commitAnimations];
    }
    
}
- (void)close
{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if (self.isSupportAnimate) {
        [UIView beginAnimations:@"stop" context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
    } else {
        [self.backgroundView removeFromSuperview];
        [self removeFromSuperview];
    }
    [self setFrameTop:height];
    if (self.isSupportAnimate) {
        [UIView commitAnimations];
    }
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    [self.backgroundView removeFromSuperview];
    [self removeFromSuperview];
}


+ (id)rxActionSheetView
{
    Class cls = [self class];
    id result = [[cls alloc] initWithFrame:CGRectZero];
    return result;
}

@end
