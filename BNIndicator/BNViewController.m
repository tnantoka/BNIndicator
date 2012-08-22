//
//  BNViewController.m
//  BNIndicator
//
//  Created by Tatsuya Tobioka on 12/08/21.
//  Copyright (c) 2012年 Tatsuya Tobioka. All rights reserved.
//

#import "BNViewController.h"

#import "BNIndicator.h"

@interface BNViewController ()

@end

@implementation BNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *plainButton = [self _addButtonWithTitle:@"Plain" action:@selector(plainAction:)];
    UIButton *messageButton = [self _addButtonWithTitle:@"Message" action:@selector(messageAction:)];
    UIButton *sizeButton = [self _addButtonWithTitle:@"Size" action:@selector(sizeAction:)];
    UIButton *hideButton = [self _addButtonWithTitle:@"Hide" action:@selector(hideAction:)];

    [self _layoutViews:[NSArray arrayWithObjects:plainButton, messageButton, sizeButton, hideButton, nil] withMargin:5.0f];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

# pragma mark - Button actions

- (void)plainAction:(id)sender {
    [BNIndicator showForView:self.view];
}

- (void)messageAction:(id)sender {
    [BNIndicator showForView:self.view withMessage:@"Loading"];
}

- (void)sizeAction:(id)sender {
    [BNIndicator showForView:self.view withMessage:@"Loading" size:100.0f];
}

- (void)hideAction:(id)sender {
    [BNIndicator hideForView:self.view];
}

# pragma mark - Utilities

- (UIButton *)_addButtonWithTitle:(NSString *)title action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    [self.view addSubview:button];
    return button;
}

- (void)_layoutViews:(NSArray *)views withMargin:(float)margin {
    int x = margin;
    for (int i = 0; i < views.count; i++) {
        UIView *view = [views objectAtIndex:i];
        view.frame = CGRectMake(x, margin, view.frame.size.width, view.frame.size.height);
        x += view.frame.size.width + margin;
    }
}


@end
