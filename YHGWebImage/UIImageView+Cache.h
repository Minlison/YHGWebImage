//
//  UIImageView+Cache.h
//  YHGWebImage
//
//  Created by 袁航 on 15/7/12.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Cache)

@property (nonatomic, strong) NSURL *downLoadURL;

// 根据Url设置图片
- (void)setImageWithUrl:(NSURL *)url;
// 根据Url字符串设置图片
- (void)setImageWithUrlString:(NSString *)urlString;

- (void)setImageWithUrlString:(NSString *)urlString usePlacehoderImage:(UIImage *)image;
- (void)setImageWithhUrl:(NSURL *)url usePlacehoderImage:(UIImage *)image;
@end
