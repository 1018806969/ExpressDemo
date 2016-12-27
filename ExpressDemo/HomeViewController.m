//
//  HomeViewController.m
//  ExpressDemo
//
//  Created by txx on 16/12/27.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "HomeViewController.h"
#import "REFrostedViewController.h"
#import "YCXMenu.h"
#import "UIView+Extend.h"

#define SCRE_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCRE_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface HomeViewController ()

@property (nonatomic,strong) UIView *expressView;
@property (nonatomic,strong) UIButton *choooseExpressTypeButton;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigationBar];
    [self.view addSubview:self.expressView];
    [self layoutExpressView];
    [self bottomView];
   
    NSLog(@"%@",self.navigationController.viewControllers);
    
}
-(void)leftBarButtonItemAction
{
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    [self.frostedViewController presentMenuViewController];

}
-(void)rightBarButtonItemAction
{
    [YCXMenu setTintColor:[UIColor whiteColor]];
    if ([YCXMenu isShow]){
        [YCXMenu dismissMenu];
    } else {
        NSMutableArray *items = [NSMutableArray array];
        items = [@[
                    [YCXMenuItem menuItem:@" 扫一扫"
                                    image:[UIImage imageNamed:@"scan"]
                                      tag:100
                                 userInfo:@{@"title":@"Menu"}],
                    [YCXMenuItem menuItem:@" 最近订单"
                                    image:[UIImage imageNamed:@"order"]
                                      tag:101
                                 userInfo:@{@"title":@"Menu"}],
                    [YCXMenuItem menuItem:@" 收藏快递员"
                                    image:[UIImage imageNamed:@"like"]
                                      tag:102
                                 userInfo:@{@"title":@"Menu"}]
                    
                    ] mutableCopy];

        [YCXMenu showMenuInView:self.view fromRect:CGRectMake(self.view.frame.size.width - 50, 64, 50, 0) menuItems:items selected:^(NSInteger index, YCXMenuItem *item) {
            switch (index) {
                case 0:{
                    NSLog(@"扫一扫");
                    break;
                }
                case 1:{
                    NSLog(@"最近订单");
                    break;
                }
                case 2:{
                    NSLog(@"收藏快递员");
                    break;
                }
            }
        }];
    }
}
-(void)callCourierAction
{
    NSLog(@"呼叫快递");
}
-(void)chooseExpressAction:(UIButton *)button
{
    NSLog(@"%@",button.titleLabel.text);
}
- (void)expressMoreAction {
    [UIView animateWithDuration:0.7 animations:^{
        _expressView.x -= SCRE_WIDTH;
    }];
}

//返回更少快递（第一页）
- (void)expressLessAction {
    [UIView animateWithDuration:0.7 animations:^{
        _expressView.x += SCRE_WIDTH;
    }];
}

-(void)navigationBar
{
    self.title = @"home";
    self.view.backgroundColor = [UIColor grayColor];
    UIButton *personalCenter = [[UIButton alloc]initWithFrame:CGRectMake(20, 0, 30, 40)];
    [personalCenter setImage:[UIImage imageNamed:@"leftBarItem"] forState:UIControlStateNormal];
    [personalCenter addTarget:self action:@selector(leftBarButtonItemAction) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:personalCenter];
    
    UIButton *rightItemButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 0, 20, 40)];
    [rightItemButton setImage:[UIImage imageNamed:@"rightBarItem"] forState:UIControlStateNormal];
    rightItemButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [rightItemButton addTarget:self action:@selector(rightBarButtonItemAction) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightItemButton];
}
-(void)bottomView
{
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCRE_HEIGHT - 50, SCRE_WIDTH, 50)];
    [self.view addSubview:bottomView];
    //画线
    UIBezierPath *straightLineBe = [UIBezierPath bezierPath];
    [straightLineBe moveToPoint:CGPointMake(0, 0)];
    [straightLineBe addLineToPoint:CGPointMake(SCRE_WIDTH, 0)];
    
    CAShapeLayer *shaperLayer = [[CAShapeLayer alloc]init];
    shaperLayer.strokeColor = [[UIColor blackColor]CGColor];
    shaperLayer.lineWidth = 0.2f;
    shaperLayer.path = straightLineBe.CGPath;
    [bottomView.layer addSublayer:shaperLayer];
    
    
    UIButton *callCourierButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 5, SCRE_WIDTH - 40, 40)];
    [callCourierButton setTitle:@"呼叫快递" forState:UIControlStateNormal];
    [callCourierButton setBackgroundColor:[UIColor colorWithRed:253.0/255.0 green:139.0/255.0 blue:23.0/255 alpha:1]];
    callCourierButton.layer.cornerRadius = 5.0;
    callCourierButton.layer.masksToBounds = YES;
    [callCourierButton setTintColor:[UIColor whiteColor]];
    [callCourierButton addTarget:self action:@selector(callCourierAction) forControlEvents:UIControlEventTouchDown];
    bottomView.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:callCourierButton];

}
-(UIView *)expressView {
    if (!_expressView) {
        _expressView = [[UIView alloc]initWithFrame:CGRectMake(0, SCRE_HEIGHT - 90, SCRE_WIDTH * 2, 40)];
        _expressView.backgroundColor = [UIColor whiteColor];
    }
    return _expressView;
}
-(void)layoutExpressView
{
    NSArray *titles = @[
                        @"顺丰",
                        @"韵达",
                        @"申通",
                        @"EMS",
                        @"中通",
                        @"德邦",
                        ];
    for (int i = 0; i < 5; i++) {
        self.choooseExpressTypeButton = [[UIButton alloc]init];
        _choooseExpressTypeButton.frame = CGRectMake( 15 * (i + 1) + i * (SCRE_WIDTH - 120)/5, 10, (SCRE_WIDTH - 120)/5, 20);
        _choooseExpressTypeButton.backgroundColor = [UIColor whiteColor];
        _choooseExpressTypeButton.layer.cornerRadius = 5;
        _choooseExpressTypeButton.layer.masksToBounds = YES;
        _choooseExpressTypeButton.layer.borderWidth = 0.5;
        _choooseExpressTypeButton.layer.borderColor = [[UIColor colorWithWhite:0.3 alpha:0.8]CGColor];
        _choooseExpressTypeButton.tag = 10 + i;
        _choooseExpressTypeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_choooseExpressTypeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_choooseExpressTypeButton setTitle:titles[i] forState:UIControlStateNormal];
        [_choooseExpressTypeButton addTarget:self action:@selector(chooseExpressAction:) forControlEvents:UIControlEventTouchDown];
        _expressView.backgroundColor = [UIColor greenColor];
        [_expressView addSubview:_choooseExpressTypeButton];
    }
    UIButton *expressMoreButton = [[UIButton alloc]initWithFrame:CGRectMake(SCRE_WIDTH - 30, 10, 20, 20)];
    [expressMoreButton addTarget:self action:@selector(expressMoreAction) forControlEvents:UIControlEventTouchDown];
    [expressMoreButton setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [_expressView addSubview:expressMoreButton];
    
    for (int i = 0; i < 5; i++) {
        self.choooseExpressTypeButton = [[UIButton alloc]init];
        _choooseExpressTypeButton.frame = CGRectMake( SCRE_WIDTH + 15 * (i + 1) + i * (SCRE_WIDTH - 120)/5, 10, (SCRE_WIDTH - 120)/5, 20);
        _choooseExpressTypeButton.backgroundColor = [UIColor whiteColor];
        _choooseExpressTypeButton.layer.cornerRadius = 5;
        _choooseExpressTypeButton.layer.masksToBounds = YES;
        _choooseExpressTypeButton.layer.borderWidth = 0.5;
        _choooseExpressTypeButton.layer.borderColor = [[UIColor colorWithWhite:0.3 alpha:0.8]CGColor];
        _choooseExpressTypeButton.tag = 20 + i;
        _choooseExpressTypeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_choooseExpressTypeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_choooseExpressTypeButton setTitle:titles[i] forState:UIControlStateNormal];
        [_choooseExpressTypeButton addTarget:self action:@selector(chooseExpressAction:) forControlEvents:UIControlEventTouchDown];
        _expressView.backgroundColor = [UIColor greenColor];
        [_expressView addSubview:_choooseExpressTypeButton];
    }
    
    UIButton *expressLessButton = [[UIButton alloc]initWithFrame:CGRectMake(SCRE_WIDTH * 2 - 30 , 10, 20, 20)];
    expressLessButton.backgroundColor = [UIColor redColor];
    [expressLessButton addTarget:self action:@selector(expressLessAction) forControlEvents:UIControlEventTouchDown];
    [_expressView addSubview:expressLessButton];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
