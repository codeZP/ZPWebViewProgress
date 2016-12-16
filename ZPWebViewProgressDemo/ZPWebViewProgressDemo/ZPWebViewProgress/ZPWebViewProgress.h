//
//  ZPWebViewProgress.h
//  ZPWebViewProgressDemo
//
//  Created by yueru on 2016/12/16.
//  Copyright © 2016年 yueru. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface ZPWebViewProgress : CAShapeLayer

/**
 进度颜色
 */
@property (strong, nonatomic) UIColor *progressColor;

/**
 加载完成
 */
- (void)finishedLoad;

/**
 开始加载
 */
- (void)startLoad;

/**
 关闭时间
 */
- (void)closeTimer;

@end
