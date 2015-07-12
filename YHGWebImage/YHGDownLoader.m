//
//  YHGDownLoader.m
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
#import "YHGDownLoader.h"
#import "YHGImageOperation.h"
@interface YHGDownLoader ()
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) NSMutableDictionary *operationCache;
@end

@implementation YHGDownLoader

// 取消操作
- (void)cancelOperationWithURL:(NSURL *)url{
    
    YHGImageOperation *operation = self.operationCache[url];
    if (operation) {
        YHGLog(@"取消操作%@",url);
        // 取消操作
        [operation cancel];
        // 移除操作
        [self.operationCache removeObjectForKey:url];
    }

}

// 下载图片
- (void)downloaderImageWithUrl:(NSURL *)url completion:(imageBlock)completion{
    
    if (url) {
        // 判断操作队列中是否存在操作,防止重复创建操作
        if (self.operationCache[url]) {
            YHGLog(@"正在努力下载中.....");
            return;
        }
        // 创建操作
        YHGImageOperation *operation = [YHGImageOperation imageOperationWithUrl:url completion:^(UIImage *image) {
            
            // 调用block
            completion(image);
            
            // 下载完成,把操作从操作缓存中移除
            [self.operationCache removeObjectForKey:url];
            
        }];
        // 把操作添加到队列
        [self.queue addOperation:operation];
        // 把操作添加到操作缓存
        [self.operationCache setObject:operation forKey:url];
    }
    
}

- (void)downloaderImageWithUrlString:(NSString *)urlString completion:(imageBlock)completion{
    if (urlString) {
        NSURL *url = [NSURL URLWithString:urlString];
        [self downloaderImageWithUrl:url completion:completion];
    }
}

// 清理内存
- (void)clearMemory{
    [self.operationCache removeAllObjects];
}

// MARK: - 懒加载
- (NSMutableDictionary *)operationCache{
    if (_operationCache == nil) {
        _operationCache = [[NSMutableDictionary alloc] init];
    }
    return _operationCache;
}

- (NSOperationQueue *)queue{
    if (_queue == nil) {
        _queue = [[NSOperationQueue alloc] init];
        // 设置最大线程并发数
        _queue.maxConcurrentOperationCount = 6;
    }
    return _queue;
}
@end
