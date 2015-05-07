//
//  ListViewDataSource.m
//  GroupProject
//
//  Created by Christopher Hoffmann on 4/30/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import "ListViewDataSource.h"
#import "EntryController.h"

@implementation ListViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    NSDate *start = entry.timestamp;
    NSString *prettyDate = [formatter stringFromDate:start];
    
    NSDate *end = entry.endTimeStamp;
    NSString *prettyEndDate = [formatter stringFromDate:end];
    
    if (prettyDate == nil) {
        prettyDate = @"";
    }
    if (prettyEndDate == nil) {
        prettyEndDate = @"";
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@ till %@", entry.titleOfEntry, prettyDate, prettyEndDate];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [EntryController sharedInstance].entries.count;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
        
        [[EntryController sharedInstance] deleteEntry:entry];
        
        
        [tableView reloadData];
        
    }
}


@end
