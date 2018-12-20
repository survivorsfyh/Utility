//
//  YHAlertController.h
//  Integration
//
//  Created by survivors on 2018/11/29.
//  Copyright © 2018年 survivors. All rights reserved.
//

/**
 提示框相关
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHAlertController : NSObject

/**
 提示框(单事件)

 @param title           标题
 @param message         内容
 @param preferred       展示风格
 @param confirmHandler  事件回调
 @return 当前控件
 */
+ (UIAlertController *)createHintAlertWithTitle:(NSString *)title AndMessage:(NSString *)message AndPreferred:(UIAlertControllerStyle)preferred ConfirmHandler:(void (^)(UIAlertAction *action))confirmHandler;

/**
 提示框(双事件)
 
 @param title           标题
 @param message         内容
 @param preferred       展示风格
 @param confirmHandler  事件回调
 @param cancleHandler   事件回调
 @return 当前控件
 */
+ (UIAlertController *)createAlertWithTitle:(NSString *)title AndMessage:(NSString *)message AndPreferred:(UIAlertControllerStyle)preferred ConfirmHandler:(void (^)(UIAlertAction *action))confirmHandler cancleHandler:(void (^)(UIAlertAction *action))cancleHandler;

@end

NS_ASSUME_NONNULL_END
