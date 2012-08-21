//
//  BNIndicatorView.m
//  BNIndicator
//
//  Created by Tatsuya Tobioka on 12/08/21.
//  Copyright (c) 2012年 Tatsuya Tobioka. All rights reserved.
//

#import "BNIndicatorView.h"

#import <QuartzCore/QuartzCore.h>

@implementation BNIndicatorView

- (id)initWithMessage:(NSString *)message {
    float size = 80.0f;
    
    self = [super initWithFrame:CGRectMake(0.0f, 0.0f, size, size)];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f];
        self.layer.cornerRadius = 7.5f;
        self.layer.shadowOpacity = 0.3f;
        self.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
        
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        indicator.center = self.center;
        [self addSubview:indicator];
        [indicator startAnimating];
#if !__has_feature(objc_arc)
        [indicator release];
#endif
        
        if (message) {
            float messageMargin = 10.0f;
            float messageWidth = size - messageMargin * 2.0f;
            float messageHeight = 20.0f;
            UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(messageMargin,
                                                                              size - messageHeight - messageMargin,
                                                                              messageWidth,
                                                                              messageHeight)];
            messageLabel.font = [UIFont boldSystemFontOfSize:messageHeight - 6.0f];
            messageLabel.textColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.7f];
            messageLabel.backgroundColor = [UIColor clearColor];
            messageLabel.textAlignment = UITextAlignmentCenter;
            messageLabel.text = message;
            [self addSubview:messageLabel];
            
            indicator.center = CGPointMake(indicator.center.x, indicator.center.y - messageMargin);
#if !__has_feature(objc_arc)
            [messageLabel release];
#endif
        }
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
