# BNIndicator

Very simple indicator for iOS.

(Supporting ARC/Non-ARC project.)

![](http://tobioka.net/wp-content/uploads/2012/08/bnindicator.png)

## How to use

* Copy `BNIndicator.h`, `BNIndicator.m`, `BNIndicatorView.h`, `BNIndicatorView.m` to your projects.
* Add `QuartzCore.framework` in Build Phases.
* Import `BNIndicator.h`.
* Call `[BNIndicator showForView:]`.

## Example

    // Show
    [BNIndicator showForView:self.view withMessage:@"Loading"];
    // Hide
    [BNIndicator hideForView:self.view];

## LICENSE

New BSD License
