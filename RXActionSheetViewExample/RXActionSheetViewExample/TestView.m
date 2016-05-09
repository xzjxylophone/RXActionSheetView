//
//  TestView.m
//  RXActionSheetViewExample
//
//  Created by ceshi on 16/5/6.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "TestView.h"

@implementation TestView



- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width - 100;
        CGFloat height = 100;
        

//        self.e_RX_ActionSheetViewAnimateDirection = kE_RX_ActionSheetViewAnimateDirection_FromBottomToTop;
//        self.e_RX_ActionSheetViewAnimateDirection = kE_RX_ActionSheetViewAnimateDirection_FromTopToBottom;
//        self.e_RX_ActionSheetViewAnimateDirection = kE_RX_ActionSheetViewAnimateDirection_FromRightToLeft;
//        self.e_RX_ActionSheetViewAnimateDirection = kE_RX_ActionSheetViewAnimateDirection_FromLeftToRight;
        
        self.frame = CGRectMake(50, ([UIScreen mainScreen].bounds.size.height - height) / 2.0f, width, height);
        self.frame = CGRectMake(0, 0, width, height);
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}


@end
