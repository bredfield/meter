//
//  HomeViewController.m
//  Meter
//
//  Created by Ben Redfield on 2/26/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import "HomeViewController.h"
#import "Heartrate.h"
#import "HomeView.h"
#import "HeartratesIndexViewController.h"

@interface HomeViewController ()

@property (strong, nonatomic) HomeView *view;
@property (strong, nonatomic) NSTimer *meterTimer;
@property (nonatomic, assign) BOOL isCounting;
@property (strong, nonatomic) Heartrate *heartrate;

@end

@implementation HomeViewController

static const float precision = 10;
static const float secondsDuration = 60;
static float elapsedTime = 0;

- (void)loadView
{
    HomeView *homeView = [[HomeView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    homeView.delegate = self;
    self.view = homeView;
}

#pragma mark - HomeViewController Delegate methods

- (void)createHeartrateTimer
{
    //Create heartrate object & start timer
    self.heartrate = [[Heartrate alloc] initWithPrecision:precision secondsDuration:secondsDuration];
    [self.heartrate setIsCounting:YES];
    
    self.meterTimer = [NSTimer scheduledTimerWithTimeInterval:[self.heartrate getTimerInterval] target:self selector:@selector(meterTimerFired:) userInfo:nil repeats:YES];
}

- (void)clearMeterTimer
{
    //Destroy timer
    if(self.meterTimer != nil){
        [self.meterTimer invalidate];
        self.meterTimer = nil;
        elapsedTime = 0;
    }
    if (self.heartrate != nil) {
        [self.heartrate setIsCounting:NO];
    }
}

- (CGFloat)calculateHeartrateFromHeartbeats:(CGFloat)heartbeats
{
    return [self.heartrate getCalculatedHeartbeat:heartbeats];
}

- (void)presentHeartratesIndexViewController
{
    HeartratesIndexViewController *heartratesIndexviewController = [HeartratesIndexViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:heartratesIndexviewController];
    
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (void)saveHeartrate:(NSInteger*)heartrate
{
    
}

#pragma mark - actions

- (void)meterTimerFired:(id)sender {
    //Adjust timing
    elapsedTime++;
    self.heartrate.elapsedTime = elapsedTime;
    

    //Alter accuracy label
    if( elapsedTime == 15 * precision
       || elapsedTime == 30 * precision
       || elapsedTime == 45 * precision
       || elapsedTime == 60 * precision ){
        [self.view updateAccuracyText:[self.heartrate getAccuracyText]];
    }
    
    [self.view updateProgressView:[self.heartrate getProgress]];
}

@end
