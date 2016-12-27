//
//  LeftViewController.m
//  ExpressDemo
//
//  Created by txx on 16/12/27.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "LeftViewController.h"
#import "UIView+Extend.h"
#import "PersonInfoViewController.h"
#import "NavigationController.h"
#import "REFrostedViewController.h"


#define SCRE_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCRE_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)UIView      *headView;

@end

static NSString *const TCellId = @"TCellId";

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}
-(void)headTapClick
{
    PersonInfoViewController *persinalInfo = [[PersonInfoViewController alloc]init];
    
    NavigationController *navigationController = [[NavigationController alloc] initWithRootViewController:persinalInfo];
    self.frostedViewController.contentViewController = navigationController;
    [self.frostedViewController hideMenuViewController];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TCellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TCellId];
        cell.textLabel.text = [NSString stringWithFormat:@"%ld-%ld",(long)indexPath.row,(long)indexPath.section];
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"我的钱包";
            cell.imageView.image = [UIImage imageNamed:@"wallet"];
            
            UIImageView *accessImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 40, 20)];
            accessImageView.image = [UIImage imageNamed:@"score"];
            [accessImageView sizeToFit];
            cell.accessoryView = accessImageView;
            
        }else if (indexPath.row == 1)
        {
            cell.textLabel.text = @"我的订单";
            cell.imageView.image = [UIImage imageNamed:@"orders"];
        } else if (indexPath.row == 2)
        {
            cell.textLabel.text = @"消息中心";
            cell.imageView.image = [UIImage imageNamed:@"msg"];
        }
    } else if(indexPath.section == 1)  {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"推荐有奖";
            cell.imageView.image = [UIImage imageNamed:@"recommend"];
        }else if (indexPath.row == 1)
        {
            cell.textLabel.text = @"常用地址";
            cell.imageView.image = [UIImage imageNamed:@"address"];
        }else if (indexPath.row == 2) {
            cell.textLabel.text = @"设置";
            cell.imageView.image = [UIImage imageNamed:@"setting"];
        }
    }
    return cell ;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width *0.9, 1)];
    view.backgroundColor = [UIColor redColor];
    return view ;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, SCRE_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self ;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
        
        _tableView.tableHeaderView = self.headView ;
    }
    return _tableView ;
}
-(UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 140)];
        
        UIView *imageView = [[UIView alloc] initWithFrame:CGRectMake(0, 35, SCRE_WIDTH * 4/5, 100)];
        [_headView addSubview:imageView];
        UITapGestureRecognizer *headTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapClick)];
        [imageView addGestureRecognizer:headTap];
        
        UIImageView *headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 80, 80)];
        headImageView.image = [UIImage imageNamed:@"head"];
        headImageView.layer.cornerRadius = headImageView.width/2;
        headImageView.layer.borderWidth = 5;
        headImageView.layer.borderColor = [[UIColor whiteColor] CGColor];
        headImageView.layer.masksToBounds = YES;
        [imageView addSubview:headImageView];
        
        UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headImageView.frame) + 10, CGRectGetMinY(headImageView.frame) + 15, SCRE_WIDTH/2, 20)];
        userNameLabel.text = @"Goofyy";
        userNameLabel.font = [UIFont systemFontOfSize:13];
        userNameLabel.textAlignment = NSTextAlignmentLeft;
        [imageView addSubview:userNameLabel];
        
        
        UILabel *userPhoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(userNameLabel.frame), CGRectGetMaxY(userNameLabel.frame) + 5, 100, 20)];
        userPhoneNumberLabel.text = @"188****4180";
        userPhoneNumberLabel.font = [UIFont systemFontOfSize:13];
        userPhoneNumberLabel.textAlignment = NSTextAlignmentLeft;
        [imageView addSubview:userPhoneNumberLabel];
        
        UIImageView *imageViewMak = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(imageView.frame) - 40, 20, 10, 20)];
        imageViewMak.image = [UIImage imageNamed:@"detail"];
        [imageView addSubview:imageViewMak];
    }
    return _headView ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
