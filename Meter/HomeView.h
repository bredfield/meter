//
//  HomeView.h
//  Meter
//
//  Created by Ben Redfield on 3/5/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"



@interface HomeView : UIView<UIAlertViewDelegate>

@property (assign, nonatomic) id <HomeViewControllerDelegate>delegate;

- (void)updateProgressView:(CGFloat)progress;
- (void)updateAccuracyText:(NSString*)accuracyText;

@end
