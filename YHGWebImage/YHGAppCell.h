//
//  YHGAppCell.h
//  YHGWebImage
//
//  Created by 袁航 on 15/7/12.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHGApps.h"
@interface YHGAppCell : UITableViewCell

@property (nonatomic, strong) YHGApps *appModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
