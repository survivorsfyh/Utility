//
//  YHAlertView.h
//  Integration
//
//  Created by survivors on 2018/9/3.
//  Copyright © 2018年 survivors. All rights reserved.
//

/*
 提示框
 
 消息推送   Base(当前 VC or Window)
 热活介绍   Up(可执行跳转可取消 or 执行跳转不可取消)
 */

#import <UIKit/UIKit.h>

// 展现状态
typedef enum {
    StateClose,// 可关闭
    StateUNClose// 不可关闭
} ShowState;

@interface YHAlertView : UIView

/**
 热活介绍

 @param dicContent  展现内容
 @param state       展现状态
 */
- (void)showHotActivity:(NSDictionary *)dicContent AndShowState:(ShowState)state;

@end
