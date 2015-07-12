//
//  UIImageView+Cache.m
//  YHGWebImage
//
//  Created by 袁航 on 15/7/12.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//
#ifdef DEBUG
#define  YHGLog(...) NSLog(__VA_ARGS__)
#else
#define YHGLog(...) /**/
#endif
#import "UIImageView+Cache.h"
#import "YHGImageManager.h"
#import <objc/runtime.h>

@implementation UIImageView (Cache)
static void *urlKey = "urlKey";

- (void)setImageWithUrl:(NSURL *)url{
    
    if (url == nil) {
        return;
    }
    
    // 获取单例对象
    YHGImageManager *manager = [YHGImageManager shareManager];
    
    // 从内存读取图片
    UIImage *imageMemory = [manager managerGetImageFromMemoryWithURL:url];
    if (imageMemory) {
        YHGLog(@"从内存获取");
        // 给自身image赋值
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = imageMemory;
        });
        return;
    }
    
    // 从沙盒读取图片
    UIImage *imageSand = [manager managerGetImageFromCacheWithURL:url];
    if (imageSand) {
        YHGLog(@"从沙盒获取");
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.image = imageSand;
        });
        return;
    }
    
    if (self.downLoadURL == nil) {
        YHGLog(@"第一次下载");
        [self getImageWithURL:url];
        
        // 重新赋值downloadUrl
        self.downLoadURL = url;
        
    }else if([self.downLoadURL isEqual:url]){
        return;
    }else if (![self.downLoadURL isEqual:url]) {
        
        YHGLog(@"撤销之前操作%@,下载",self.downLoadURL);
        [manager cancelOperationWithUrl:self.downLoadURL];
        // 下载新的图片
        [self getImageWithURL:url];
        // 重写给downLoadURL赋值
        self.downLoadURL = url;
    }
    
}

- (void)getImageWithURL:(NSURL *)url{
    
    // 获取单例对象
    YHGImageManager *manager = [YHGImageManager shareManager];
    // 单例对象下载图片
    [manager managerDownloadImageWithUrl:url completion:^(UIImage *image) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = image;
        });
        
    }];
}

- (void)setDownLoadURL:(NSURL *)downLoadURL{
    
    objc_setAssociatedObject(self, urlKey, downLoadURL, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSURL *)downLoadURL{
    
    NSURL *url = objc_getAssociatedObject(self, urlKey);
    
    return url;
}

- (void)setImageWithUrlString:(NSString *)urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    [self setImageWithUrl:url];
}

- (void)setImageWithUrlString:(NSString *)urlString usePlacehoderImage:(UIImage *)image{
    
    self.image = image;
    
    [self setImageWithUrlString:urlString];
}
- (void)setImageWithhUrl:(NSURL *)url usePlacehoderImage:(UIImage *)image{
    
    // 设置占位图片
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.image = image;
    });
    
    [self setImageWithUrl:url];
    
}
@end
