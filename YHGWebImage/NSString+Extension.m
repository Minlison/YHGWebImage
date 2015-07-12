//
//  NSString+Extension.m
//  YHGWebImage
//
//  Created by 袁航 on 15/7/12.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (NSString *)appendCache{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    path = [path stringByAppendingPathComponent:self.lastPathComponent];
    return path;
}
- (NSString *)appendDocument{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    path = [path stringByAppendingPathComponent:self.lastPathComponent];
    return path;
}
- (NSString *)appendTemp{
    NSString *path = NSTemporaryDirectory();
    path = [path stringByAppendingPathComponent:self.lastPathComponent];
    return path;
}
@end
