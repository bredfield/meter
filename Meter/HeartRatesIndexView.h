//
//  HeartRatesIndexView.h
//  Meter
//
//  Created by Ben Redfield on 3/6/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeartratesIndexViewController.h"

@interface HeartratesIndexView : UIView <UITableViewDelegate>

@property (assign, nonatomic) id <HeartratesIndexViewControllerDelegate>delegate;
@property (strong, nonatomic) UITableView *heartratesTableView;

@end
