//
//  YHAlertController.m
//  Integration
//
//  Created by survivors on 2018/11/29.
//  Copyright © 2018年 survivors. All rights reserved.
//

#import "YHAlertController.h"

@implementation YHAlertController

/**
 提示框(单事件)
 
 @param title           标题
 @param message         内容
 @param preferred       展示风格
 @param confirmHandler  事件回调
 @return 当前控件
 */
+ (UIAlertController *)createHintAlertWithTitle:(NSString *)title AndMessage:(NSString *)message AndPreferred:(UIAlertControllerStyle)preferred ConfirmHandler:(void (^)(UIAlertAction * _Nonnull))confirmHandler {
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferred];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:confirmHandler];
    [alertCon addAction:action];
    
    return alertCon;
}

/**
 提示框(双事件)
 
 @param title           标题
 @param message         内容
 @param preferred       展示风格
 @param confirmHandler  事件回调
 @param cancleHandler   事件回调
 @return 当前控件
 */
+ (UIAlertController *)createAlertWithTitle:(NSString *)title AndMessage:(NSString *)message AndPreferred:(UIAlertControllerStyle)preferred ConfirmHandler:(void (^)(UIAlertAction * _Nonnull))confirmHandler cancleHandler:(void (^)(UIAlertAction * _Nonnull))cancleHandler {
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferred];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:confirmHandler];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:cancleHandler];
    
    [alertCon addAction:confirmAction];
    [alertCon addAction:cancleAction];
    
    return alertCon;
}


/**
 提示框相关(待改造)
 
 @param content 提示内容
 @param title   提示标头
 */
- (void)showAlertWithTitlet:(NSString *)title AndContent:(NSString *)content AndSelectMethod:(NSString *)selectMethod {
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:title
                                                                      message:content
                                                               preferredStyle:UIAlertControllerStyleAlert];
    
    [alertCon addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        /*
         https://www.cnblogs.com/gcb999/p/3178728.html
         
         if (self.leftSelectDelegate && [self.leftSelectDelegate respondsToSelector:@selector(clickLeftSelectScrollButton:)]) {
         [self.leftSelectDelegate clickLeftSelectScrollButton:tag];
         }
         */
        NSString *method = selectMethod;
        SEL selector = NSSelectorFromString(method);
        if ([self respondsToSelector:selector]) {
            [self performSelector:selector];
        }
        
//        [self.navigationController popToRootViewControllerAnimated:YES];
    }]];
    
//    [self presentViewController:alertCon animated:YES completion:^{
//
//    }];
}


@end
