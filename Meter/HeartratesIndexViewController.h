//
//  HeartratesIndexViewController.h
//  Meter
//
//  Created by Ben Redfield on 3/1/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeartratesIndexViewControllerDelegate <NSObject>

- (void)tableViewDidSelectedRowAtIndexPath:(NSIndexPath*)indexPath;

@end

@interface HeartratesIndexViewController : UIViewController<HeartratesIndexViewControllerDelegate, UITableViewDataSource>

@end
