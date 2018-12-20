//
//  NSDictionary+FYH.h
//  Integration
//
//  Created by survivors on 2018/11/16.
//  Copyright © 2018年 survivors. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (FYH)

/**
 *  对象转换为字典
 *
 *  @param obj 需要转化的对象
 *
 *  @return 转换后的字典
 */
+ (NSDictionary*)getObjectData:(id)obj;

@end

NS_ASSUME_NONNULL_END
