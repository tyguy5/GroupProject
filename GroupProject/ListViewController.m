//
//  ListViewController.m
//  GroupProject
//
//  Created by Christopher Hoffmann on 4/30/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import "ListViewController.h"
#import "AddViewController.h"
#import "EntryController.h"
#import "ListViewDataSource.h"
@interface ListViewController () <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    if ([segue.identifier isEqualToString:@"viewEntry"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        AddViewController *viewController = segue.destinationViewController;
        
        Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
        
        viewController.navigationItem.rightBarButtonItem = nil;
        
        viewController.entry = entry;
        
    }
    
    // Pass the selected object to the new view controller.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - table view delegate methods





@end
