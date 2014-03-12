//
//  BRBlurView.m
//  Meter
//
//  Created by Ben Redfield on 3/1/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import "BRBlurView.h"


@interface BRBlurView ()

@property (nonatomic, strong) UIToolbar *toolbar;

@end


@implementation BRBlurView

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
    // If we don't clip to bounds the toolbar draws a thin shadow on top
    self.clipsToBounds = YES;
    
    [self addSubview:self.toolbar];
    
    [self fadeInBlur];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
    [self.toolbar autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [super updateConstraints];
}

- (void)fadeInBlur
{
    [UIView animateWithDuration:.3 animations:^{
        self.toolbar.layer.opacity = .3;
    }];
}

- (void)fadeOutBlur
{
    [UIView animateWithDuration:.3 animations:^{
        self.toolbar.layer.opacity = .0;
    }];
}

- (UIToolbar*)toolbar
{
    if (!_toolbar) {
        _toolbar = [[UIToolbar alloc] initForAutoLayout];
        _toolbar.tintColor = [UIColor blackColor];
        _toolbar.backgroundColor = [UIColor blackColor];
    }
    
    return _toolbar;
}

@end
