//
//  ArrayDataSource.m
//  Meter
//
//  Created by Ben Redfield on 3/8/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import "ArrayDataSource.h"

@interface ArrayDataSource()

@end

@implementation ArrayDataSource

//- (id)init
//{
//    return nil;
//}

- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)cellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
{
    self = [super init];
    if (self) {
        self.items = items;
        self.cellIdentifier = cellIdentifier;
        self.configureCellBlock = [configureCellBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger) indexPath.row];
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
//                                                            forIndexPath:indexPath];
//    id item = [self itemAtIndexPath:indexPath];
//    self.configureCellBlock(cell, item);
    
//    return cell;
    return [UITableViewCell new];
}

@end
