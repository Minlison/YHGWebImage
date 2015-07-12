//
//  YHGOperation.m
//  YHGWebImage
//
//  Created by 袁航 on 15/7/12.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//

#import "YHGImageOperation.h"

typedef void(^imageBlock)(UIImage *image);

@interface YHGImageOperation ()

@property (nonatomic, copy) imageBlock completion;

@property (nonatomic, strong) NSURL *url;

@end

@implementation YHGImageOperation

- (void)main{
#pragma mark - 模拟延时
    [NSThread sleepForTimeInterval:1.0];
    
    @autoreleasepool {
       
        UIImage *image = [self downloadImage];
        
        if (self.isCancelled) {
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.completion(image);
        });
        
    }

}

- (UIImage *)downloadImage{
    
    if (self.isCancelled) {
        return nil;
    }
    NSData *imageData = [NSData dataWithContentsOfURL:self.url];
    
    if (self.isCancelled) {
        return nil;
    }
    UIImage *image = [UIImage imageWithData:imageData];
    if (self.isCancelled) {
        return nil;
    }
    return image;

}


+ (instancetype)imageOperationWithUrl:(NSURL *)url completion:(imageBlock)completion{
    
    YHGImageOperation *operation = [[self alloc] init];
    operation.url = url;
    operation.completion = completion;
    
    return operation;
}

+ (instancetype)imageOperationWithUrlString:(NSString *)urlString completion:(imageBlock)completion{
    
    NSURL *url = [NSURL URLWithString:urlString];
    return [self imageOperationWithUrl:url completion:completion];
    

}

@end
