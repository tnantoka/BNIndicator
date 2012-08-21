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

@implementation BNIndicator

+ (void)showForView:(UIView *)view {
    [self showForView:view withMessage:nil];
}

+ (void)showForView:(UIView *)view withMessage:(NSString *)message {
    // Not add if exists
    for (UIView *v in view.subviews) {
        if ([v isKindOfClass:[BNIndicatorView class]]) {
            return;
        }
    }

    BNIndicatorView *indicatorView = [[BNIndicatorView alloc] initWithMessage:message];
    indicatorView.center = view.center;
    indicatorView.layer.opacity = 0.0f;
    [view addSubview:indicatorView];
#if !__has_feature(objc_arc)
    [indicatorView release];
#endif

    [UIView animateWithDuration:0.4f animations:^{
        indicatorView.layer.opacity = 1.0f;
    }];    
}


+ (void)hideForView:(UIView *)view {
    for (UIView *v in view.subviews) {
        if ([v isKindOfClass:[BNIndicatorView class]]) {
            [UIView animateWithDuration:0.4f animations:^{
                v.layer.opacity = 0.0f;
            } completion:^(BOOL finished) {
                [v removeFromSuperview];
            }];
        }
    }
}

@end
