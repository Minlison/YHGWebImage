//
//  YHGImageManager.m
//  YHGWebImage
//
//  Created by 袁航 on 15/7/12.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//

#import "YHGImageManager.h"

@implementation YHGImageManager

// 一次性代码实现单例
+ (instancetype)shareManager{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(memoryWaring) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

// 接收到内存警告
- (void)memoryWaring{
    // 移除操作队列缓存
    [self.downloader clearMemory];
    //
}

// 取消对应操作
- (void)cancelOperationWithUrl:(NSURL *)url{
    [self.downloader cancelOperationWithURL:url];
}

// 下载图片
- (void)managerDownloadImageWithUrl:(NSURL *)url completion:(void (^)(UIImage *))completion{
    [self.downloader downloaderImageWithUrl:url completion:^(UIImage *image) {
        // 对下载好的图片做缓存
        [self.cacher cacheImage:image withUrl:url];
        completion(image);
    }];
}



// 从内存取图片
- (UIImage *)managerGetImageFromMemoryWithURL:(NSURL *)url{
   return  [self.cacher getCacheImageWithUrl:url];
}
// 从沙盒取图片
- (UIImage *)managerGetImageFromCacheWithURL:(NSURL *)url{
    return [self.cacher getSandImageWithUrl:url];
}

- (YHGDownLoader *)downloader{
    if (_downloader == nil) {
        _downloader = [[YHGDownLoader alloc] init];
    }
    return _downloader;
}
- (YHGCacher *)cacher{
    if (_cacher == nil) {
        _cacher = [[YHGCacher alloc] init];
    }
    return _cacher;
}

@end
