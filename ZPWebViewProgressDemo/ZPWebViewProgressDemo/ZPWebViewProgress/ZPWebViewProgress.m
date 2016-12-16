//
//  ZPWebViewProgress.m
//  ZPWebViewProgressDemo
//
//  Created by yueru on 2016/12/16.
//  Copyright © 2016年 yueru. All rights reserved.
//

#import "ZPWebViewProgress.h"
#import "NSTimer+addition.h"

@interface ZPWebViewProgress ()

@property (strong, nonatomic) CAShapeLayer *layer;
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) CGFloat plusWidth;

@end

static NSTimeInterval const kFastTimeInterval = 0.003;

@implementation ZPWebViewProgress

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (void)setProgressColor:(UIColor *)progressColor {
    self.progressColor = progressColor;
    self.strokeColor = progressColor.CGColor;
}

- (void)initialize {
    self.lineWidth = 2;
    self.strokeColor = [UIColor greenColor].CGColor;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:kFastTimeInterval target:self selector:@selector(pathChanged:) userInfo:nil repeats:YES];
    [self.timer pause];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 2)];
    [path addLineToPoint:CGPointMake(SCREEN_WIDTH, 2)];
    
    self.path = path.CGPath;
    self.strokeEnd = 0;
    self.plusWidth = 0.01;
}

- (void)pathChanged:(NSTimer *)timer {
    self.strokeEnd += self.plusWidth;
    if (self.strokeEnd > 0.8) {
        self.plusWidth = 0.002;
    }
}

- (void)startLoad {
    [self.timer resumeWithTimeInterval:kFastTimeInterval];
}

- (void)finishedLoad {
    [self closeTimer];
    self.strokeEnd = 1.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.hidden = YES;
        [self removeFromSuperlayer];
    });
}

- (void)dealloc {
    [self closeTimer];
}

- (void)closeTimer {
    [self.timer invalidate];
    self.timer = nil;
}

@end
