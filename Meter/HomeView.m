//
//  HomeView.m
//  Meter
//
//  Created by Ben Redfield on 3/5/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import "HomeView.h"
#import "LargeTextButton.h"
#import "BRPopupView.h"

@interface HomeView()

//Elements
@property (strong, nonatomic) UIProgressView *meterProgress;
@property (strong, nonatomic) UIButton *heartratesIndexButton;
@property (strong, nonatomic) UITextField *heartbeatField;
@property (strong, nonatomic) UILabel *accuracyLabel;
@property (strong, nonatomic) LargeTextButton *startButton;
@property (strong, nonatomic) LargeTextButton *stopButton;
@property (strong, nonatomic) BRPopupView *savePopupView;
@property (strong, nonatomic) UIControl *popupBackgroundView;

//Constraints
@property (strong, nonatomic) NSLayoutConstraint *savePopupTopConstraint;

@end

@implementation HomeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

#pragma mark - Subviews 

- (void)setupViews
{
    //Add subviews
    [self addSubview:self.heartratesIndexButton];
    [self addSubview:self.heartbeatField];
    [self addSubview:self.startButton];
    [self addSubview:self.stopButton];
    [self addSubview:self.accuracyLabel];
    [self addSubview:self.meterProgress];
    
    //Initial styles
    self.backgroundColor = UIColorFromRGB(BRANDPRIMARY);
    [self swapElementsWithCounting:NO];
    
    //Commit layouts
    [super setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
    //Index button
    [self.heartratesIndexButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20.0];
    [self.heartratesIndexButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20.0];
    
    //Heartbeat field
    [self.heartbeatField autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.heartbeatField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:140.0];
    [self.heartbeatField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:100.0];
    [self.heartbeatField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:100.0];
    
    //Start Button
    [self.startButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self withOffset:0.0];
    [self.startButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withOffset:60.0];
    
    //Stop Button
    [self.stopButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.startButton];
    [self.stopButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.startButton];
    
    //Accuracy Label
    [self.accuracyLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.startButton withOffset:100.0];
    [self.accuracyLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];

    //Progress View
    [self.meterProgress autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0.0];
    [self.meterProgress autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0.0];
    [self.meterProgress autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0.0];
    [self.meterProgress autoSetDimension:ALDimensionHeight toSize:60.0];
    
    //Save popup view
    if (_savePopupView) {
        [self.savePopupView autoSetDimensionsToSize:CGSizeMake(300, 400)];
        [self.savePopupView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        self.savePopupTopConstraint = [self.savePopupView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:-500.0];
    }
    
    //Popup background
    if (_popupBackgroundView)
        [self.popupBackgroundView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    //Save alert view
    [super updateConstraints];
}

#pragma mark - Methods
- (void)updateProgressView:(CGFloat)progress
{
    [self.meterProgress setProgress:progress];
}

- (void)updateAccuracyText:(NSString*)accuracyText
{
    [self.accuracyLabel setText:accuracyText];
}

- (void)swapElementsWithCounting:(BOOL)isCounting
{
    [self.accuracyLabel setHidden:!isCounting];
    [self.stopButton setHidden:!isCounting];
    [self.startButton setHidden:isCounting];
}

- (void)createSavePopupView
{
    //Popupbackground
    [self addSubview:self.popupBackgroundView];
    [self setNeedsUpdateConstraints];
    
    //Animate in background view
    [UIView animateWithDuration:.4 animations:^{
        self.popupBackgroundView.layer.opacity = .5;
    } completion:^(BOOL finished) {
        //Add save view
        [self addSubview:self.savePopupView];
        [self setNeedsUpdateConstraints];
        [self layoutIfNeeded];
        
        self.savePopupTopConstraint.constant = 100;
        
        [UIView animateWithDuration:.3 animations:^{
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
            self.savePopupTopConstraint.constant = 80;
            
            [UIView animateWithDuration:.2 animations:^{
                [self layoutIfNeeded];
            }];
        }];
        
    }];
}

- (void)destroySavePopupView
{
    self.savePopupTopConstraint.constant = 100;
    
    //Animate in background view
    [UIView animateWithDuration:.2 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.savePopupTopConstraint.constant = -500;
        
        [UIView animateWithDuration:.3 animations:^{
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:.2 animations:^{
                //Fade out background
                self.popupBackgroundView.layer.opacity = 0;
            } completion:^(BOOL finished) {
                //Destroy views & references
                [self.popupBackgroundView removeFromSuperview];
                [self.savePopupView removeFromSuperview];
                self.popupBackgroundView = nil;
                self.savePopupView = nil;
            }];
        }];
    }];

}

#pragma mark - Actions
- (void)startButtonPressed:(id)sender
{
    [self.delegate createHeartrateTimer];
    
    [self.accuracyLabel setText:@"Keep countin', not accurate yet."];
    [self swapElementsWithCounting:YES];
}

- (void)stopButtonPressed:(id)sender
{
    [self.delegate clearMeterTimer];
    
    [self swapElementsWithCounting:NO];
    self.heartbeatField.hidden = NO;
    self.heartbeatField.text = @"";
    [self.heartbeatField becomeFirstResponder];
}

- (void)keyboardDonePressed:(id)sender
{
    //Hide keyboard
    [self endEditing:YES];
    
    CGFloat heartrate = [self.delegate calculateHeartrateFromHeartbeats:[self.heartbeatField.text floatValue]];
    
    //Alert user of heartrate
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Heartrate: %i",(int)heartrate] message:@"Do you want to save this heartrate?" delegate:self cancelButtonTitle:@"Nope" otherButtonTitles:@"Yep",nil];
    [alert show];
    
    //Clear elements
    [self.meterProgress setProgress:0.0];
    [self.heartbeatField setHidden:YES];
    [self.heartbeatField setText:@""];
}

- (void)heartratesIndexButtonPressed:(id)sender
{
    [self.delegate presentHeartratesIndexViewController];
}

#pragma mark - Alert View Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self createSavePopupView];
    }
}

#pragma mark - Getters
- (UIButton*)heartratesIndexButton
{
    if (!_heartratesIndexButton) {
        _heartratesIndexButton = [[UIButton alloc] initForAutoLayout];
        [_heartratesIndexButton setTitle:@"Index" forState:UIControlStateNormal];
        _heartratesIndexButton.titleLabel.textColor = [UIColor whiteColor];
        [_heartratesIndexButton addTarget:self action:@selector(heartratesIndexButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _heartratesIndexButton;
}

- (UITextField*)heartbeatField
{
    if (!_heartbeatField) {
        _heartbeatField = [[UITextField alloc] initForAutoLayout];
        _heartbeatField.textColor = [UIColor whiteColor];
        _heartbeatField.text = @"0";
        _heartbeatField.hidden = YES;
        _heartbeatField.keyboardType = UIKeyboardTypeNumberPad;
        _heartbeatField.font = [UIFont fontWithName:@"Avenir-medium" size:60.0];
        _heartbeatField.textAlignment = NSTextAlignmentCenter;
        
        //Create the keyboard toolbar
        UIToolbar *keyboardToolbar = [[UIToolbar alloc] init];
        [keyboardToolbar sizeToFit];
        
        UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(keyboardDonePressed:)];
        
        [keyboardToolbar setItems:@[spaceItem, doneItem]];
        
        [_heartbeatField setInputAccessoryView:keyboardToolbar];
    }
    return _heartbeatField;
}

- (LargeTextButton*)stopButton
{
    if (!_stopButton) {
        self.stopButton = [[LargeTextButton alloc] initForAutoLayout];
        [self.stopButton setTitle:@"STOP" forState:UIControlStateNormal];
        
        [_stopButton addTarget:self action:@selector(stopButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _stopButton;
}

- (LargeTextButton*)startButton
{
    if (!_startButton) {
        _startButton = [[LargeTextButton alloc] initForAutoLayout];
        [_startButton setTitle:@"START" forState:UIControlStateNormal];
        [_startButton addTarget:self action:@selector(startButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startButton;
}

- (UILabel *)accuracyLabel
{
    if (!_accuracyLabel) {
        self.accuracyLabel = [[UILabel alloc] initForAutoLayout];
        self.accuracyLabel.text = @"Accurate";
        self.accuracyLabel.textColor = [UIColor whiteColor];
    }
    
    return _accuracyLabel;
}

- (UIProgressView *)meterProgress
{
    if (!_meterProgress) {
        _meterProgress = [[UIProgressView alloc] initForAutoLayout];
        _meterProgress.progress = 0;
        _meterProgress.progressTintColor = UIColorFromRGB(BRANDPRIMARYLIGHT);
        _meterProgress.backgroundColor = UIColorFromRGB(BRANDPRIMARY);
        _meterProgress.progressViewStyle = UIProgressViewStyleBar;
    }
    
    return _meterProgress;
}

- (BRPopupView*)savePopupView
{
    if (!_savePopupView) {
        _savePopupView = [[BRPopupView alloc] initForAutoLayout];
    }
    
    return _savePopupView;
}

- (UIView*)popupBackgroundView
{
    if (!_popupBackgroundView) {
        _popupBackgroundView = [[UIControl alloc] initForAutoLayout];
        _popupBackgroundView.backgroundColor = [UIColor blackColor];
        _popupBackgroundView.layer.opacity = 0;
        
        [_popupBackgroundView addTarget:self action:@selector(destroySavePopupView) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _popupBackgroundView;
}

@end
