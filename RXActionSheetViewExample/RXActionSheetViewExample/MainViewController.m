//
//  MainViewController.m
//  RXActionSheetViewExample
//
//  Created by Rush.D.Xzj on 15/11/20.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MainViewController.h"
#import "TestView.h"
#import "RXASView.h"

@interface MainViewController ()

@end

@implementation MainViewController


- (IBAction)buttonTouchUpInside:(id)sender {
//    TestView *tv = [TestView rxActionSheetView];
//    [tv show];
    
    RXASView *view = [RXASView rxActionSheetView];
    [view showInView:self.view];
    
}

- (IBAction)button2TouchUpInside:(id)sender {
    TestView *tv = [TestView rxActionSheetView];
//    [tv showWithStartPoint:CGPointMake(0, 0) endPoint:CGPointMake(100, 300) completion:nil];
    
    [tv showInViewController:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
