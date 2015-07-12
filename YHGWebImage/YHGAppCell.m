//
//  YHGAppCell.m
//  YHGWebImage
//
//  Created by 袁航 on 15/7/12.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//

#import "YHGAppCell.h"
#import "UIImageView+Cache.h"
@implementation YHGAppCell

- (void)awakeFromNib {
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"appCell";
    YHGAppCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (void)setAppModel:(YHGApps *)appModel{
    _appModel = appModel;
    self.textLabel.text = appModel.name;
    self.detailTextLabel.text = appModel.download;
    
}

@end
