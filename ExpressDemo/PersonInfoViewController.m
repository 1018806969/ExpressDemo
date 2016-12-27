//
//  PersonInfoViewController.m
//  ExpressDemo
//
//  Created by txx on 16/12/27.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "PersonInfoViewController.h"
#import "UIBarButtonItem+GFBarButtonItem.h"
#import "NavigationController.h"
#import "HomeViewController.h"

@interface PersonInfoViewController ()

@end

@implementation PersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"back"] highImage:[UIImage imageNamed:@"back"] target:(NavigationController *)self.navigationController action:@selector(popToRoot) forControlEvents:UIControlEventTouchDown];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
