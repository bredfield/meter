//
//  HeartRatesIndexView.m
//  Meter
//
//  Created by Ben Redfield on 3/6/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import "HeartRatesIndexView.h"
#import "ArrayDataSource.h"

@interface HeartratesIndexView()



@end

@implementation HeartratesIndexView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    [self addSubview:self.heartratesTableView];
    
    [self setNeedsUpdateConstraints];
}


- (void)updateConstraints
{
    [self.heartratesTableView autoPinEdgesToSuperviewEdgesWithInsets:(UIEdgeInsets){0,0,0,0}];
    
    [super updateConstraints];
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate tableViewDidSelectedRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Methods

#pragma mark - Actions

#pragma mark - Getters

- (UITableView*)heartratesTableView
{
    if (!_heartratesTableView) {
        _heartratesTableView = [[UITableView alloc] initForAutoLayout];

        _heartratesTableView.delegate = self;
    }
    
    return _heartratesTableView;
}

@end
