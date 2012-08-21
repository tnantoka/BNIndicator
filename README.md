# BNIndicator

Very simple indicator for iOS

## How to use

* Copy `BNIndicator.h`, `BNIndicator.m` to your projects.
* Add `QuartzCore.framework` in Build Phases.
* Import `BNIndicator.h`.
* Call `[[BNIndicator showForView:]`.

## Example

    // Show
    [BNIndicator showForView:self.view withMessage:@"Loading"];
    // Hide
    [BNIndicator hideForView:self.view];

## LICENSE

New BSD License
