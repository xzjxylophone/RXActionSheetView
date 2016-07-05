//
//  RXASView.m
//  RXActionSheetViewExample
//
//  Created by ceshi on 16/7/5.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RXASView.h"

@implementation RXASView



- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = 120;
        
        self.e_RX_ActionSheetViewAnimatePosition = kE_RX_ActionSheetViewAnimatePosition_Bottom;
        
        self.backgroundColor = [UIColor redColor];
        self.frame = CGRectMake(0, 0, width, height);
    }
    return self;
}



@end
