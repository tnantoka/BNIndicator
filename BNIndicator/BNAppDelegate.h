//
//  BNAppDelegate.h
//  BNIndicator
//
//  Created by Tatsuya Tobioka on 12/08/21.
//  Copyright (c) 2012年 Tatsuya Tobioka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNViewController;

@interface BNAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BNViewController *viewController;

@end
