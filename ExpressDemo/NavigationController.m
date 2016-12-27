//
//  NavigationController.m
//  ExpressDemo
//
//  Created by txx on 16/12/27.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "NavigationController.h"
#import "REFrostedViewController.h"
#import "HomeViewController.h"
#import "UIBarButtonItem+GFBarButtonItem.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)showMenu
{
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    [self.frostedViewController presentMenuViewController];
}

#pragma mark -
#pragma mark Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController panGestureRecognized:sender];
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"%s",__func__);
    if (self.viewControllers.count != 0) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"back"] highImage:[UIImage imageNamed:@"back"] target:self action:@selector(backToMainMenu) forControlEvents:UIControlEventTouchDown];
        
    }
    [super pushViewController:viewController animated:animated];
}

-(void)backToMainMenu {
    [self popToRootViewControllerAnimated:YES];
}


-(void)popToRoot {
    [self pushViewController:[HomeViewController new] animated:YES];
}

@end
