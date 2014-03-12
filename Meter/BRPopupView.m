//
//  BRAlertView.m
//  Meter
//
//  Created by Ben Redfield on 3/6/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import "BRPopupView.h"

@implementation BRPopupView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    self.layer.cornerRadius = 6.0;
    self.backgroundColor = [UIColor whiteColor];
}

- (void)animateFrameUp
{
    [UIView animateWithDuration:.3 animations:^{
        CGRect originalFrame = self.frame;
        self.frame = CGRectMake(originalFrame.origin.x, 80, originalFrame.size.width, originalFrame.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.2 animations:^{
            CGRect originalFrame = self.frame;
            self.frame = CGRectMake(originalFrame.origin.x, 100, originalFrame.size.width, originalFrame.size.height);
        }];
    }];
}

@end
