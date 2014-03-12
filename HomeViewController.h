//
//  HomeViewController.h
//  Meter
//
//  Created by Ben Redfield on 2/26/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeViewControllerDelegate <NSObject>

- (void)createHeartrateTimer;
- (void)clearMeterTimer;
- (CGFloat)calculateHeartrateFromHeartbeats:(CGFloat)heartbeats;
- (void)presentHeartratesIndexViewController;

@end

@interface HomeViewController : UIViewController<HomeViewControllerDelegate,UITextFieldDelegate, UIAlertViewDelegate>

@end
