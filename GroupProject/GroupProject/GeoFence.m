//
//  GeoFence.m
//  GroupProject
//
//  Created by Christopher Hoffmann on 5/2/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import "GeoFence.h"

@implementation GeoFence

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    //NSLog(@"Welcome to %@", region.identifier);
}


-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    //NSLog(@"Bye bye");
}

-(void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    //NSLog(@"Now monitoring for %@", region.identifier);
    
    //set desired accuracy to best
    //track movement 
}


@end
