//
//  YHAlertView.m
//  Integration
//
//  Created by survivors on 2018/9/3.
//  Copyright © 2018年 survivors. All rights reserved.
//

#import "YHAlertView.h"

@interface YHAlertView ()

/** 底部蒙版*/
@property (nonatomic, strong) UIView *viewBackground;

@end

@implementation YHAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

/**
 创建 View
 */
- (void)createView {
    if (self.viewBackground) {
        return;
    }
    
    // Request link get dataSource
    [self showHotActivity:@{} AndShowState:StateClose];
    
    // Show view
    self.viewBackground = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.viewBackground.userInteractionEnabled = YES;
    self.viewBackground.backgroundColor = [UIColor blackColor];
    self.viewBackground.alpha = 0.4;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.viewBackground];
    [window addSubview:self];
}

/**
 移除当前模板
 */
- (void)closeView {
    [self.viewBackground removeFromSuperview];
    self.viewBackground = nil;
    [self removeFromSuperview];
}

/**
 热活介绍
 
 @param dicContent  展现内容
 @param state       展现状态
 */
- (void)showHotActivity:(NSDictionary *)dicContent AndShowState:(ShowState)state {
    // Get data
    NSString *strTit = [NSString stringWithFormat:@"%@", [dicContent objectForKey:@"title"]];
    NSString *strContent = [NSString stringWithFormat:@"%@", [dicContent objectForKey:@"content"]];
    NSString *strBtnState = [NSString stringWithFormat:@"%@", [dicContent objectForKey:@"state"]];// 不展示:0 & 展示:1
    // Title
    UILabel *labTit = [[UILabel alloc] init];
    labTit.text = strTit;
    labTit.numberOfLines = 0;
    labTit.textAlignment = NSTextAlignmentCenter;
    // Content
    UILabel *labContent = [[UILabel alloc] init];
    labContent.text = strContent;
    // Btn do
    UIButton *btnDo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDo.backgroundColor = [UIColor blueColor];
    [btnDo setTitle:@"确认" forState:UIControlStateNormal];
    [btnDo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnDo.tag = 100;
    [btnDo addTarget:self
              action:@selector(btnClick:)
    forControlEvents:UIControlEventTouchUpInside];
    // Btn close
    UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnClose setImage:[[UIImage imageNamed:@"closeWhite"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
              forState:UIControlStateNormal];
    btnClose.tag = 200;
    [btnClose addTarget:self
                 action:@selector(btnClick:)
       forControlEvents:UIControlEventTouchUpInside];
    // Add UI
    [self addSubview:labTit];
    [self addSubview:labContent];
    [self addSubview:btnDo];
    if ([strBtnState isEqualToString:@"1"]) {
        [self addSubview:btnClose];
    }
    
    // Set UI frame
    [labTit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(20);
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.height.equalTo(@60);
    }];
    [btnDo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(60);
        make.right.equalTo(self).offset(-60);
        make.bottom.equalTo(self).offset(-10);
        make.height.equalTo(@44);
    }];
    [labContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labTit.mas_bottom).offset(10);
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.height.equalTo(btnDo.mas_top).offset(-6);
    }];
    if ([strBtnState isEqualToString:@"1"]) {
        [btnClose mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(6);
            make.right.equalTo(self).offset(-4);
            make.width.equalTo(@44);
            make.height.equalTo(@44);
        }];
    }
}

#pragma mark - 点击事件
- (void)btnClick:(UIButton *)btn {
    if (100 == btn.tag) {
        NSLog(@"Btn 被点击了 --- 确认");
        
        
    }
    else {
        NSLog(@"Btn 被点击了 --- 关闭");
        [self closeView];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
