//
//  YHGApps.m
//  YHGWebImage
//
//  Created by 袁航 on 15/7/12.
//  Copyright (c) 2015年 yuanhang. All rights reserved.
//

#import "YHGApps.h"

@implementation YHGApps
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)appWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (NSMutableArray *)appsList{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil];
    
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:dictArray.count];
    
    [dictArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        NSDictionary *dict = (NSDictionary *)obj;
        
        YHGApps *model = [[YHGApps alloc] initWithDict:dict];
        
        [modelArray addObject:model];
    }];
    return modelArray;

}
@end
