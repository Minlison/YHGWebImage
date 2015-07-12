//
//  YHGAppsViewController.m
//  YHGWebImage
//
//  Created by 袁航 on 15/7/12.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//

#import "YHGAppsViewController.h"
#import "YHGApps.h"
#import "YHGAppCell.h"
#import "UIImageView+Cache.h"
@interface YHGAppsViewController ()
@property (nonatomic, strong) NSMutableArray *apps;
@end

@implementation YHGAppsViewController


- (NSMutableArray *)apps{
    if (_apps == nil) {
        _apps = [YHGApps appsList];
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 80;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.apps.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YHGAppCell *cell = [YHGAppCell cellWithTableView:tableView];
    
    YHGApps *appModel = self.apps[indexPath.row];
    
    cell.appModel = appModel;
    
    [cell.imageView setImageWithUrlString:appModel.icon usePlacehoderImage:[UIImage imageNamed:@"placeholder"]];
    
    return cell;
}

@end
