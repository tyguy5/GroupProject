//
//  GeoFence.m
//  GroupProject
//
//  Created by Christopher Hoffmann on 5/2/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import "GeoFence.h"

@implementation GeoFence

-(void)addCurrentLocation:(id)sender {
    
    _didStartMonitoringRegion = NO;
    
    [self.locationManager startUpdatingLocation];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    if (locations && [locations count] && !_didStartMonitoringRegion) {
    
    CLLocation *location = [locations objectAtIndex:0];
    
    CLCircularRegion *fence = [[CLCircularRegion alloc] initWithCenter:[location coordinate] radius:250.0 identifier:[[NSUUID UUID] UUIDString]];
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization];
        }
    [self.locationManager startMonitoringForRegion:fence];
    [self.locationManager stopUpdatingLocation];
    
    }
    
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLCircularRegion *)region {
    //NSLog(@"Welcome to %@", region.identifier);
}


-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLCircularRegion *)region {
    //NSLog(@"Bye bye");
}

-(void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLCircularRegion *)region {
    //NSLog(@"Now monitoring for %@", region.identifier);
    
    //set desired accuracy to best
    //track movement 
}


@end
