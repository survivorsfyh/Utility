//
//  NSString+FYH.h
//  Integration
//
//  Created by survivors on 2018/1/24.
//  Copyright © 2018年 survivors. All rights reserved.
//

/*
    字符串处理相关
 */
#import <Foundation/Foundation.h>

@interface NSString (FYH)

/** 验证身份证号是否有效*/
+ (BOOL)verifyIdentityCard:(NSString *)idCard;
/** 验证邮箱是否有效*/
+ (BOOL)verifyEmail:(NSString *)email;
/** 验证电话号是否有效*/
+ (BOOL)verifyPhoneNumber:(NSString *)phone;

/** 根据身份证计算年龄*/
+ (NSString *)calculateAgeWithBirthDay:(NSString *)birth;

/** 医生的职称*/
+ (NSString *)doctorJobTitle:(NSInteger)code;

+(BOOL)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
/** 正则判断手机号*/
+ (BOOL)checkTel:(NSString *)phone;
/** 字符串中是否含有子字符串中的内容(strChild)*/
+ (BOOL)isHaveSpaceInString:(NSString *)string InString:(NSString *)strChild;
/** 将旧的 str 中某个元素替换成新的元素后生成新的 str*/
+ (NSString *)theStr:(NSString *)str ChangeTheChildElementStr:(NSString *)strEle ToNewElementStr:(NSString *)strNewEle;
/** 判断 str 内容是否为空*/
+ (NSString *)convertNull:(NSString *)str;
/** 字符串去除空格*/
+ (NSString *)stringRemovesSpace:(NSString *)str;

/**
 校验本地路径文件内参数是否为空
 
 @param parameter   参数
 @param name        文件名称
 @param path        文件路径
 @return            校验状态(不存在:0 & 存在无数据:1 & 存在有数据即直接返回数据)
 */
+ (NSString *)verifyCurrentParameter:(NSString *)parameter IsEmptyFormFileName:(NSString *)name AndFilePath:(NSString *)path;

/**
 中文转unicode
 
 @param string  原始字符串
 @return        结果
 */
+ (NSString *)utf8ToUnicode:(NSString *)string;

@end
