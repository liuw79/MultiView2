//
//  AppDelegate.h
//  MultiView2
//
//  Created by liuwei on 12-11-25.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwitchViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) SwitchViewController *switcher;

@end
