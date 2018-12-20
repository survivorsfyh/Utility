//
//  NSString+FYH.m
//  Integration
//
//  Created by survivors on 2018/1/24.
//  Copyright © 2018年 survivors. All rights reserved.
//

#import "NSString+FYH.h"
#import "Utility+FYH.h"

@implementation NSString (FYH)

#pragma mark - 验证身份证号是否有效
+ (BOOL)verifyIdentityCard:(NSString *)idCard
{
    NSString *parten = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", parten];
    BOOL res1 = [regextestmobile evaluateWithObject:idCard];
    
    return res1;
}

#pragma mark - 验证邮箱是否有效
+ (BOOL)verifyEmail:(NSString *)email
{
    //    NSString *parten = @"\\w{2,15}[@][a-z0-9]{2,}[.]\\p{Alpha}{2,3}";
    //NSString *parten = @"^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$";
    //    NSString *parten = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    //    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", parten];
    //    BOOL res1 = [regextestmobile evaluateWithObject:email];
    //    return res1;
    
    //    NSRange foundObj=[email rangeOfString:@"@@" options:NSCaseInsensitiveSearch];
    //    if(foundObj.length>0) {
    //        return YES;
    //    } else {
    //        return NO;
    //    }
    
    if (0 == email.length) {
        return YES;
    }else{
        if ([email rangeOfString:@"@"].location == NSNotFound) {
            NSLog(@"string 不存在 martin");
            return NO;
        } else {
            return YES;
        }
    }
}

#pragma mark - 验证电话号是否有效
+ (BOOL)verifyPhoneNumber:(NSString *)phone
{
    NSScanner* scan = [NSScanner scannerWithString:phone];
    int val;
    
    if ([scan scanInt:&val] && [scan isAtEnd] && phone.length == 11) {
        return YES;
    }else{
        return NO;
    }
}

+ (NSString *)calculateAgeWithBirthDay:(NSString *)birth {
    NSInteger age = 0;
    NSString *currentDate = StringFromDate([NSDate date],@"yyyyMMdd");
    
    if (birth) {
        age = [[currentDate substringToIndex:4] integerValue] - [[birth substringToIndex:4] integerValue] - 1;
        NSInteger deltaMonth = [[currentDate substringWithRange:NSMakeRange(4, 2)] integerValue] - [[birth substringWithRange:NSMakeRange(4, 2)] integerValue];
        if (deltaMonth > 0) {
            ++ age;
        }
        else if (deltaMonth == 0) {
            NSInteger deltaDay = [[currentDate substringWithRange:NSMakeRange(6, 2)] integerValue] - [[birth substringWithRange:NSMakeRange(6, 2)] integerValue];
            if (deltaDay >= 0) {
                ++ age;
            }
        }
    }
    return [NSString stringWithFormat:@"%d",(int)age];
}

#pragma mark - 医生职称 code
+ (NSString *)doctorJobTitle:(NSInteger)code
{
    switch (code) {
        case 1:
            return @"主任医师";
            break;
        case 2:
            return @"副主任医师";
            break;
        case 3:
            return @"主治医师";
            break;
        case 4:
            return @"住院医师";
            break;
            
        default:
            return nil;
            break;
    }
}

+(BOOL)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return YES;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return NO;
    }
    //NSLog(@"Both dates are the same");
    return YES;
    
}

#pragma mark - 手机号正则判定设置
+ (BOOL)checkTel:(NSString *)phone
{
    /*
     电信号段:133/153/180/181/189/177
     联通号段:130/131/132/155/156/185/186/145/176
     移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
     虚拟运营商:170
     @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$"
     
     Other:
     @"^[1][0-9][0-9]{9}$"
     @"^1+[34578]+\\d{9}"
     */
    //新正则（）："^[1]([3-8]{1}[0-9]{1}|59|58|88|89)[0-9]{8}"
    //^[1]([0-8]{1}[0-9]{1}|59|58|88|89)[0-9]{8}
    NSString *regex = @"^[1]([3-8]{1}[0-9]{1}|59|58|88|89)[0-9]{8}";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:phone];
    
    return isMatch;
}

#pragma mark - 判断 str 中是否包含 strChild 元素
+ (BOOL)isHaveSpaceInString:(NSString *)string InString:(NSString *)strChild {
    NSRange _range = [string rangeOfString:strChild];
    if (_range.location != NSNotFound) {
        return YES;
    }else {
        return NO;
    }
}

#pragma mark - 将旧的 str 中某个元素替换成新的元素后生成新的 str
/**
 *  将 str 中某个旧元素替换成某个新的元素后,生成新的 str
 *
 *  @param str          原始 str
 *  @param strEle       旧元素
 *  @param strNewEle    新元素
 *
 *  @return 生成新的 str
 */
+ (NSString *)theStr:(NSString *)str ChangeTheChildElementStr:(NSString *)strEle ToNewElementStr:(NSString *)strNewEle {
    return [str stringByReplacingOccurrencesOfString:strEle withString:strNewEle];
}

+ (BOOL)isNull:(NSString *)str {
    if ([str isEqual:[NSNull null]]) {
        return YES;
    } else if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    } else if (str == nil) {
        return YES;
    }
    return NO;
}

+ (NSString *)convertNull:(NSString *)str {
    if ([NSString isNull:str]) {
        return @"";
    }
    return str;
}

/**
 字符串去除空格

 @param str 初始字符串
 @return    结果集
 */
+ (NSString *)stringRemovesSpace:(NSString *)str {
    if (kStringIsEmpty(str)) {
        return nil;
    }
    else {
        return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
}

#pragma mark - 校验本地路径文件内参数是否为空
/**
 校验本地路径文件内参数是否为空
 
 @param parameter   参数
 @param name        文件名称
 @param path        文件路径
 @return            校验状态(不存在:0 & 存在无数据:1 & 存在有数据即直接返回数据)
 */
+ (NSString *)verifyCurrentParameter:(NSString *)parameter IsEmptyFormFileName:(NSString *)name AndFilePath:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:[kDocumentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@%@", path, name]]]) {// 存在 [NSString stringWithFormat:@"%@IMedConfigInfo.plist", [kDocumentPath stringByAppendingPathComponent:path]]
        NSMutableDictionary *dataSource = [NSMutableDictionary dictionaryWithContentsOfFile:[kDocumentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@%@", path, name]]];
        NSString *currentParameter = [NSString stringWithFormat:@"%@", [dataSource objectForKey:parameter]];
        if (kStringIsEmpty(currentParameter)) {
            return @"1";
        }
        else {
            return currentParameter;
        }
    }
    else {// 不存在
        return @"0";
    }
}

#pragma mark - 中文转unicode
/**
 中文转unicode

 @param string  原始字符串
 @return        结果
 */
+ (NSString *)utf8ToUnicode:(NSString *)string {
    NSUInteger length = [string length];
    NSMutableString *str = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++){
        NSMutableString *s = [NSMutableString stringWithCapacity:0];
        unichar _char = [string characterAtIndex:i];
        // 判断是否为英文和数字
        if (_char <= '9' && _char >='0'){
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        }else if(_char >='a' && _char <= 'z'){
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        }else if(_char >='A' && _char <= 'Z')
        {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        }else{
            // 中文和字符
            [s appendFormat:@"\\u%x",[string characterAtIndex:i]];
            // 不足位数补0 否则解码不成功
            if(s.length == 4) {
                [s insertString:@"00" atIndex:2];
            } else if (s.length == 5) {
                [s insertString:@"0" atIndex:2];
            }
        }
        [str appendFormat:@"%@", s];
    }
    return str;
}



@end
