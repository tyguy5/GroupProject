//
//  EntryController.m
//  GroupProject
//
//  Created by Alan Barth on 4/25/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import "EntryController.h"
#import "Stack.h"

@implementation EntryController 

+ (EntryController *) sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
    });
    return sharedInstance;
}

#pragma mark - Create

- (Entry *) createEntryWithTitle: (NSString *) title {
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    entry.titleOfEntry = title;
//    if (self.startingDate) {
//        entry.timestamp = self.startingDate;
//    }
//    if (self.endingDate) {
//        entry.endTimeStamp = self.endingDate;
//    }
    
    [self saveToPersistentStorage];
    
    return entry;
    
}

- (Entry *) createTimeStamp: (NSDate *) date andEndTime: (NSDate *)endDate {
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    entry.timestamp = date;
    entry.endTimeStamp = endDate;
    [self saveToPersistentStorage];
    return entry;
}


#pragma mark - Read

//Custom Getting method
- (NSArray *) entries {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    NSArray *fetchObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return fetchObjects;
}

- (void) saveToPersistentStorage {
    [[Stack sharedInstance].managedObjectContext save:nil];
}

#pragma mark - Update

-(void) save {
    [self saveToPersistentStorage];
}

#pragma mark - Delete

-(void) deleteEntry:(Entry *) entry {
    [entry.managedObjectContext deleteObject:entry];
}

@end
