//
//  YHGTurnViewController.m
//  YHGWebImage
//
//  Created by 袁航 on 15/7/12.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//

#import "YHGTurnViewController.h"
#import "YHGAppsViewController.h"
@implementation YHGTurnViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    
    // 设置返回按钮文字
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    
    
    // 添加按钮,跳转控制器
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAction) target:self action:@selector(appsTableViewController)];
}

- (void)appsTableViewController{
    YHGAppsViewController *apps = [[YHGAppsViewController alloc] init];
    apps.navigationItem.backBarButtonItem.title = @"返回";
    
    
    [self.navigationController pushViewController:apps animated:YES];
}

@end
