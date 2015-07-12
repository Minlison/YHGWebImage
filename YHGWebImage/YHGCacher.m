//
//  YHGCacher.m
//  YHGWebImage
//
//  Created by 袁航 on 15/7/13.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//
#ifdef DEBUG
#define  YHGLog(...) NSLog(__VA_ARGS__)
#else
#define YHGLog(...) /**/
#endif
#import "YHGCacher.h"
#import "NSString+Extension.h"

@interface YHGCacher ()
@property (nonatomic, strong) NSCache *imageCache;
@end

@implementation YHGCacher

- (void)cacheImage:(UIImage *)image withUrl:(NSURL *)url{
    
    if (image && url) {
        // 缓存到内存
        [self.imageCache setObject:image forKey:url];
        // 缓存到沙盒
        NSString *path = [url.lastPathComponent appendCache];
        
        NSData *data = UIImagePNGRepresentation(image);
        
        [data writeToFile:path atomically:YES];
        
        YHGLog(@"缓存路径--->%@",path);
    }
}
+ (instancetype)sharedCacher{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (UIImage *)getCacheImageWithUrl:(NSURL *)url{
   return (UIImage *)[self.imageCache objectForKey:url];
}
- (UIImage *)getSandImageWithUrl:(NSURL *)url{
    NSString *path = [url.lastPathComponent appendCache];
    NSData *data = [NSData dataWithContentsOfFile:path];
    UIImage *image = [UIImage imageWithData:data];
    // 添加到内存缓存中
    if (image) {
        [self.imageCache setObject:image forKey:url];
    }
    return image;
}

- (NSCache *)imageCache{
    if (_imageCache == nil) {
        _imageCache = [[NSCache alloc] init];
    }
    return _imageCache;
}

@end
