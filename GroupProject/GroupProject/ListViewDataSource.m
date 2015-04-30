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
    
    cell.textLabel.text = entry.titleOfEntry;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [EntryController sharedInstance].entries.count;
    
}

@end
