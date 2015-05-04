//
//  GeoFence.h
//  GroupProject
//
//  Created by Christopher Hoffmann on 5/2/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface GeoFence : NSObject <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLCircularRegion *fence;
@property (strong, nonatomic) CLPlacemark *selectedLocation;
@property (strong, nonatomic) CLLocation *currentLocation;

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region;
-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region;
-(void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region;


@end
