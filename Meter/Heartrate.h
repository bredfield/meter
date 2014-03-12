//
//  Heartrate.h
//  Meter
//
//  Created by Ben Redfield on 3/12/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Heartrate : NSManagedObject

@property (nonatomic, retain) NSString * activity;
@property (nonatomic, retain) NSNumber * caffeineLevel;
@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSNumber * heartrate;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSNumber * sleepLevel;
@property (nonatomic, retain) NSNumber * stressLevel;

@end
