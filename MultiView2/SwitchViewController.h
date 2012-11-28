//
//  SwitchViewController.h
//  MultiView2
//
//  Created by liuwei on 12-11-25.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FirstViewController;
@class SecondViewController;

@interface SwitchViewController : UIViewController

@property (nonatomic, retain) FirstViewController *first;
@property (nonatomic, retain) SecondViewController *second;

- (IBAction)showFirstView;
- (IBAction)showSecondView;
- (void)removeAllSubViews;

@end
