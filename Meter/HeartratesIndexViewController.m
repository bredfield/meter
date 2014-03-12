//
//  HeartratesIndexViewController.m
//  Meter
//
//  Created by Ben Redfield on 3/1/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import "HeartratesIndexViewController.h"
#import "HeartratesIndexView.h"

@interface HeartratesIndexViewController ()

@property (strong, nonatomic) NSArray *heartrates;
@property (strong, nonatomic) HeartratesIndexView *view;

@end

@implementation HeartratesIndexViewController

- (void)loadView
{
    //Create custom root view
    HeartratesIndexView *heartratesIndexView = [[HeartratesIndexView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    heartratesIndexView.delegate = self;
    heartratesIndexView.heartratesTableView.dataSource = self;
    
    self.view = heartratesIndexView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupData];
    [self setupNavigationBar];
}

- (void)setupData
{
    self.heartrates = @[@"hey"];
}

- (void)setupNavigationBar
{
    UIBarButtonItem *closeButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(closeBarButtonItemPressed:)];
    self.navigationItem.leftBarButtonItem = closeButtonItem;
}

- (void)closeBarButtonItemPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - HeartratesIndexViewControllerDelegate
- (void)tableViewDidSelectedRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.row == 1) {
        
    }
}

#pragma mark - UITableviewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heartrates.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}






@end
