//
//  BNIndicator.h
//  BNIndicator
//
//  Created by Tatsuya Tobioka on 12/08/21.
//  Copyright (c) 2012年 Tatsuya Tobioka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNIndicator : NSObject

+ (void)showForView:(UIView *)view;
+ (void)showForView:(UIView *)view withMessage:(NSString *)message;
+ (void)showForView:(UIView *)view withSize:(float)size;
+ (void)showForView:(UIView *)view withMessage:(NSString *)message size:(float)size;

+ (void)hideForView:(UIView *)view;

@end
