//
//  ArrayDataSource.h
//  Meter
//
//  Created by Ben Redfield on 3/8/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);


@interface ArrayDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) NSString *cellIdentifier;
@property (strong, nonatomic) TableViewCellConfigureBlock configureCellBlock;

- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)cellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end

