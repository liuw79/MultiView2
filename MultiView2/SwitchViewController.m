//
//  SwitchViewController.m
//  MultiView2
//
//  Created by liuwei on 12-11-25.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import "SwitchViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface SwitchViewController ()

@end

#define kDuration 0.5   // 动画持续时间(秒)

@implementation SwitchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if (self.first == nil ) {
        FirstViewController *f = [[FirstViewController alloc] initWithNibName:@"FirstView" bundle:nil];
        self.first = f;
        [f release];
        f = nil;
    }
    
    [self.view insertSubview:self.first.view atIndex:0];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    [label setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:label];
    [label release];
}

- (void)removeAllSubViews
{
    for (UIView *v in [self.view subviews])
    {
        [v removeFromSuperview];
    }
}

- (void)showFirstView
{
//    //[self removeAllSubViews];
//    
//    NSLog(@"show first view");
//    if(nil == self.first)
//    {
//        FirstViewController *f = [[FirstViewController alloc] initWithNibName:@"FirstView" bundle:nil];
//        self.first = f;
//        [f release];
//        f = nil;
//    }
//    
//    //添加
//    [UIView beginAnimations:@"change view" context:nil];
//    [UIView setAnimationDuration:1.0];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationTransition:UIViewAnimationCurveLinear forView:self.view cache:YES];
//    CGRect rect1 = self.view.frame;
//    rect1.size.height -= 100;
//    [self.first.view setFrame:rect1];
//    [self.view insertSubview:self.first.view atIndex:0];
//    [UIView commitAnimations];
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromLeft;
    NSUInteger green = [[self.view subviews] indexOfObject:self.first];
    NSUInteger blue = [[self.view subviews] indexOfObject:self.second];
    [self.view exchangeSubviewAtIndex:green withSubviewAtIndex:blue];
    
    [[self.first.view layer] addAnimation:animation forKey:@"animation"];
    


}

- (void)showSecondView
{
    //[self removeAllSubViews];
    
    NSLog(@"show second view");
    if(nil == self.second)
    {
        SecondViewController *s = [[SecondViewController alloc] initWithNibName:@"SecondView" bundle:nil];
        self.second = s;
        [s release];
        s = nil;
    }
    
    //添加
    [UIView beginAnimations:@"change view" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationCurveLinear forView:self.view cache:YES];
    [self.view insertSubview:self.second.view atIndex:0];
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
