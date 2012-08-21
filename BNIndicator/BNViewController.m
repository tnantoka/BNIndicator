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
    
    float margin = 5.0f;
    
    UIButton *plainButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [plainButton setTitle:@"Plain" forState:UIControlStateNormal];
    [plainButton addTarget:self action:@selector(plainAction:) forControlEvents:UIControlEventTouchUpInside];
    plainButton.frame = CGRectMake(margin, margin, 0, 0);
    [plainButton sizeToFit];
    [self.view addSubview:plainButton];

    UIButton *messageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [messageButton setTitle:@"Loading" forState:UIControlStateNormal];
    [messageButton addTarget:self action:@selector(enMessageAction:) forControlEvents:UIControlEventTouchUpInside];
    messageButton.frame = CGRectMake(plainButton.frame.origin.x + plainButton.frame.size.width + margin, margin, 0, 0);
    [messageButton sizeToFit];
    [self.view addSubview:messageButton];

    UIButton *messageButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [messageButton2 setTitle:@"読込中" forState:UIControlStateNormal];
    [messageButton2 addTarget:self action:@selector(jaMessageAction:) forControlEvents:UIControlEventTouchUpInside];
    messageButton2.frame = CGRectMake(messageButton.frame.origin.x + messageButton.frame.size.width + margin, margin, 0, 0);
    [messageButton2 sizeToFit];
    [self.view addSubview:messageButton2];

    UIButton *hideButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [hideButton setTitle:@"Hide" forState:UIControlStateNormal];
    [hideButton addTarget:self action:@selector(hideAction:) forControlEvents:UIControlEventTouchUpInside];
    hideButton.frame = CGRectMake(messageButton2.frame.origin.x + messageButton2.frame.size.width + margin, margin, 0, 0);
    [hideButton sizeToFit];
    [self.view addSubview:hideButton];

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

- (void)enMessageAction:(id)sender {
    [BNIndicator showForView:self.view withMessage:@"Loading"];
}

- (void)jaMessageAction:(id)sender {
    [BNIndicator showForView:self.view withMessage:@"読込中"];
}

- (void)hideAction:(id)sender {
    [BNIndicator hideForView:self.view];
}

@end
