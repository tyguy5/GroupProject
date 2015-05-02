//
//  EntryController.h
//  GroupProject
//
//  Created by Alan Barth on 4/25/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (strong, nonatomic, readonly) NSArray *entries;

+ (EntryController *) sharedInstance;
-(void) save;
- (Entry *) createEntryWithTitle: (NSString *) title;
- (Entry *) createTimeStamp: (NSDate *) date;


@end
