//
//  BNIndicator.m
//  BNIndicator
//
//  Created by Tatsuya Tobioka on 12/08/21.
//  Copyright (c) 2012年 Tatsuya Tobioka. All rights reserved.
//

#import "BNIndicator.h"
#import "BNIndicatorView.h"

#import <QuartzCore/QuartzCore.h>

#define DURATION 0.4f
#define SIZE 80.0f

@implementation BNIndicator

+ (void)showForView:(UIView *)view {
    [self showForView:view withMessage:nil size:SIZE];
}

+ (void)showForView:(UIView *)view withMessage:(NSString *)message {
    [self showForView:view withMessage:message size:SIZE];
}

+ (void)showForView:(UIView *)view withSize:(float)size {
    [self showForView:view withMessage:nil size:size];
}

+ (void)showForView:(UIView *)view withMessage:(NSString *)message size:(float)size {

    // Not add if exists
    for (UIView *v in view.subviews) {
        if ([v isKindOfClass:[BNIndicatorView class]]) {
            return;
        }
    }
    
    BNIndicatorView *indicatorView = [[BNIndicatorView alloc] initWithMessage:message size:size];
    indicatorView.center = view.center;
    indicatorView.layer.opacity = 0.0f;
    [view addSubview:indicatorView];
#if !__has_feature(objc_arc)
    [indicatorView release];
#endif
    
    [UIView animateWithDuration:DURATION animations:^{
        indicatorView.layer.opacity = 1.0f;
    }];

}


+ (void)hideForView:(UIView *)view {
    for (UIView *v in view.subviews) {
        if ([v isKindOfClass:[BNIndicatorView class]]) {
            [UIView animateWithDuration:DURATION animations:^{
                v.layer.opacity = 0.0f;
            } completion:^(BOOL finished) {
                [v removeFromSuperview];
            }];
        }
    }
}

@end
