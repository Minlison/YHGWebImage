//
//  YHGDownLoader.h
//  YHGWebImage
//
//  Created by 袁航 on 15/7/12.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^imageBlock)(UIImage *image);

@interface YHGDownLoader : NSObject

- (void)downloaderImageWithUrl:(NSURL *)url completion:(imageBlock)completion;
- (void)downloaderImageWithUrlString:(NSString *)urlString completion:(imageBlock)completion;

- (void)cancelOperationWithURL:(NSURL *)url;
- (void)clearMemory;
@end
