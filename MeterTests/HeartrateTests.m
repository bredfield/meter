//
//  HeartrateTests.m
//  Meter
//
//  Created by Ben Redfield on 3/1/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Heartrate.h"

@interface HeartrateTests : XCTestCase

@property (strong, nonatomic) Heartrate *heartrate;

@end

@implementation HeartrateTests

- (void)setUp
{
    [super setUp];

    self.heartrate = [Heartrate new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCalculateHeartrate
{
    
    self.heartrate.elapsedTime = 600;
    float calculatedHeartrate = [self.heartrate getCalculatedHeartbeat:60];
    XCTAssertTrue(calculatedHeartrate == 60.0, @"");
}

- (void)testTimerInterval
{
    XCTAssertTrue([self.heartrate getTimerInterval] == 0.1, @"");
}

- (void)testTimerProgress
{
    self.heartrate.elapsedTime = 300;
    XCTAssertTrue([self.heartrate getProgress] == 0.5, @"");
}

@end
