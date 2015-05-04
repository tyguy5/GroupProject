//
//  GeoFence.h
//  GroupProject
//
//  Created by Christopher Hoffmann on 5/2/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface GeoFence : NSObject <CLLocationManagerDelegate> {
    BOOL _didStartMonitoringRegion;
}

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLCircularRegion *fence;
@property (strong, nonatomic) NSArray *fences;
@property (strong, nonatomic) CLPlacemark *selectedLocation;
@property (strong, nonatomic) CLLocation *currentLocation;


//CLLocationManager delegate methods
-(void)addCurrentLocation:(id)sender;
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations;


-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region;
-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region;
-(void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region;



@end
