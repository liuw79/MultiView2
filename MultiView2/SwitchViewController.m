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

@interface SwitchViewController ()

@end

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
    [self removeAllSubViews];
    
    NSLog(@"show first view");
    if(nil == self.first)
    {
        FirstViewController *f = [[FirstViewController alloc] initWithNibName:@"FirstView" bundle:nil];
        self.first = f;
        [f release];
        f = nil;
    }
    
    //添加
    [UIView beginAnimations:@"change view" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
    [self.view insertSubview:self.first.view atIndex:0];
    [UIView commitAnimations];
}

- (void)showSecondView
{
    [self removeAllSubViews];
    
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
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    [self.view insertSubview:self.second.view atIndex:0];
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
