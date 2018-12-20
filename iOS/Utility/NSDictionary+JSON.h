//
//  NSDictionary+JSON.h
//  Trip2013
//
//  Created by shenghua on 7/22/13.
//  Copyright (c) 2013 xunhai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)

- (NSString *)jsonString;

- (void)writeToJsonFile:(NSString *)path atomically:(BOOL)atomically;

+ (NSDictionary *)dictionaryWithContentsOfJsonFile:(NSString *)path;



@end
