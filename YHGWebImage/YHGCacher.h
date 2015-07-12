//
//  YHGCacher.h
//  YHGWebImage
//
//  Created by 袁航 on 15/7/13.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface YHGCacher : NSObject
+ (instancetype)sharedCacher;
- (void)cacheImage:(UIImage *)image withUrl:(NSURL *)url;
- (UIImage *)getCacheImageWithUrl:(NSURL *)url;
- (UIImage *)getSandImageWithUrl:(NSURL *)url;
@end
