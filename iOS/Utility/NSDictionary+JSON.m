//
//  NSDictionary+JSON.m
//  Trip2013
//
//  Created by shenghua on 7/22/13.
//  Copyright (c) 2013 xunhai. All rights reserved.
//

#import "NSDictionary+JSON.h"
#import "NSString+JSON.h"

@implementation NSDictionary (JSON)

- (NSString *)jsonString {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:&error];
    if (error)
        return nil;
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

- (void)writeToJsonFile:(NSString *)path atomically:(BOOL)atomically {
    NSData *content = [[self jsonString] dataUsingEncoding:NSUTF8StringEncoding];
    [content writeToFile:path atomically:atomically];
}

+ (NSDictionary *)dictionaryWithContentsOfJsonFile:(NSString *)path {
    NSError *error = nil;
    NSString *content = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        return nil;
    }
    id result = [content jsonObject];
    if (![result isKindOfClass:[self class]]) {
        return nil;
    }
    return result;
}



@end
