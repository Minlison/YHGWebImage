//
//  YHGImageManager.h
//  YHGWebImage
//
//  Created by 袁航 on 15/7/12.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YHGDownLoader.h"
#import "YHGCacher.h"
@interface YHGImageManager : NSObject
// 下载器
@property (nonatomic, strong) YHGDownLoader *downloader;

// 缓存器
@property (nonatomic, strong) YHGCacher *cacher;

// 单例对象
+ (instancetype)shareManager;

// 下载图片
- (void)managerDownloadImageWithUrl:(NSURL *)url completion:(void (^)(UIImage *image))completion;



// 从沙盒取图片
- (UIImage *)managerGetImageFromMemoryWithURL:(NSURL *)url;

// 从内存取图片
- (UIImage *)managerGetImageFromCacheWithURL:(NSURL *)url;

// 取消对应操作
- (void)cancelOperationWithUrl:(NSURL *)url;

@end
