//
//  Entry.h
//  GroupProject
//
//  Created by Dalton on 5/2/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entry : NSManagedObject

@property (nonatomic, retain) NSString * recentLocations;
@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) NSString * titleOfEntry;
@property (nonatomic, retain) NSDate * endTimeStamp;

@end
