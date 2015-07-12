//
//  YHGOperation.h
//  YHGWebImage
//
//  Created by 袁航 on 15/7/12.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YHGImageOperation : NSOperation

// 下载操作
+ (instancetype)imageOperationWithUrl:(NSURL *)url completion:(void(^)(UIImage *image))completion;
+ (instancetype)imageOperationWithUrlString:(NSString *)urlString  completion:(void (^)(UIImage *))completion;

@end
