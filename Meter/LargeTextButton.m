//
//  LargeTextButton.m
//  Meter
//
//  Created by Ben Redfield on 3/4/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import "LargeTextButton.h"

@implementation LargeTextButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    self.titleLabel.font = [UIFont fontWithName:@"Avenir-medium" size:44];
    
}


@end
