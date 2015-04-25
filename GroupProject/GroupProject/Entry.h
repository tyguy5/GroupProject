//
//  Entry.h
//  GroupProject
//
//  Created by Alan Barth on 4/25/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entry : NSManagedObject

@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) NSString * recentLocations;
@property (nonatomic, retain) NSString * titleOfEntry;

@end
