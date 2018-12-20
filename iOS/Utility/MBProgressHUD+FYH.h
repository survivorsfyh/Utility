//
//  MBProgressHUD+FYH.h
//  Integration
//
//  Created by survivors on 2018/1/24.
//  Copyright © 2018年 survivors. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (FYH)

+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view;



/** Hud 可设置滞留时间*/
+ (void)showCommonHudWithAlertString:(NSString *)aString afterDelay:(int)time toView:(UIView *)view;

@end
