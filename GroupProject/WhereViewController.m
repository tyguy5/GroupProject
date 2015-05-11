//
//  WhereViewController.m
//  GroupProject
//
//  Created by Dalton on 5/1/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import "WhereViewController.h"
#import "Pin.h"
#import "Fence.h"

@import MapKit;


@interface WhereViewController () <MKMapViewDelegate, UITextFieldDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISlider *distanceSlider;
@property (weak, nonatomic) IBOutlet UITextField *searchBar;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UISegmentedControl *fenceType;
@property (weak, nonatomic) IBOutlet UILabel *radiusLabel;
@property(nonatomic,retain)MKAnnotationView *annotationView;


@end

@implementation WhereViewController {
    
    MKLocalSearch *localSearch;
    MKLocalSearchResponse *results;
    
}

@synthesize matchingItems;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = YES;
    self.mapView.delegate = self;
    self.searchBar.delegate = self;

    
    
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
    MKUserLocation *userLocation = self.mapView.userLocation;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 20000, 20000);
    
    [self.mapView setRegion:region animated:YES];
 
    [self.distanceSlider addTarget:self action:@selector(distanceSlide:) forControlEvents:UIControlEventValueChanged];

}


#pragma mark - Search methods

- (void)getLocalSearchResults{
    
    
    self.annotationView = [[MKAnnotationView alloc] init];
    
    // This cancels any previous searches
    [localSearch cancel];
    
    // This is to perform a new search
    MKLocalSearchRequest *request = [MKLocalSearchRequest new];
    request.naturalLanguageQuery = self.searchBar.text;
    request.region = self.mapView.region;
    
    if (!matchingItems)
        matchingItems = [[NSMutableArray alloc]init];
    else{
        [matchingItems removeAllObjects];
        [self.mapView removeAnnotations:self.mapView.annotations];
    }
    
    
    // Not sure exactly what this does
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
//        if (error != nil) {
//            [[[UIAlertView alloc] initWithTitle:@"Map error"
//                                        message:[error description]
//                                       delegate:nil
//                              cancelButtonTitle:@"OK"
//                              otherButtonTitles:nil]show];
//             
//             return;
//             
//        }
//        
//        if ([response.mapItems count] == 0) {
//            [[[UIAlertView alloc] initWithTitle:@"No results"
//                                        message:[error description]
//                                       delegate:nil
//                              cancelButtonTitle:@"OK"
//                              otherButtonTitles:nil]show];
//             
//             return;
//             
//        }
//        
//        results = response;
        if (response.mapItems.count == 0)
            NSLog(@"No Matches");
        else
            for (MKMapItem *item in response.mapItems)
            {
                //                NSLog(@"name = %@", item.placemark.addressDictionary);
                //                [matchingItems addObject:item];
                
                Pin *annotation = [[Pin alloc]init];
                annotation.coordinate = item.placemark.coordinate;
                annotation.title = item.name;
                NSString *address = [item.placemark.addressDictionary objectForKey:@"Street"];
                NSString *neighborhood = [item.placemark.addressDictionary objectForKey:@"SubLocality"];
                annotation.subtitle = [NSString stringWithFormat:@"%@ - %@", address, neighborhood];
                [self.mapView addAnnotation:annotation];
            }
        
}];
    
}

-(BOOL)textFieldShouldReturn:(UITextField*)textfield{
    
    [self getLocalSearchResults];
    
    [textfield resignFirstResponder];
    
    return YES;
}



//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//    return [results.mapItems count];
//    
//}
//
//- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    self.searchController.active = YES;
//    self.searchController.dimsBackgroundDuringPresentation = NO;
//    self.searchController.hidesNavigationBarDuringPresentation = NO;
//    
//    static NSString *identifier = @"ResultCell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
//    }
//    
//
//    MKMapItem *item = results.mapItems[indexPath.row];
//    cell.textLabel.text = item.name;
//    cell.detailTextLabel.text = item.placemark.addressDictionary[@"Street"];
//    
//    return cell;
//    
//}
//
//
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    self.searchController.active = YES;
//    
//    MKMapItem *item = results.mapItems[indexPath.row];
//    
//    [self.mapView addAnnotation:item.placemark];
//    [self.mapView selectAnnotation:item.placemark animated:YES];
//    
//    [self.mapView setCenterCoordinate:item.placemark.location.coordinate];
//    
//    [self.mapView setUserTrackingMode:MKUserTrackingModeNone];
//    
//    
//}



- (IBAction)whereViewDone:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    self.mapView.centerCoordinate = userLocation.location.coordinate;
    
    
    
}
- (IBAction)EntryExitButtonTapped:(id)sender {
}


#pragma mark Set geofence
#pragma mark Set Geofence

-(void)addPinWithCoordinate:(CLLocationCoordinate2D )coordinate{
    
    
    [self.mapView removeAnnotations:[self.mapView annotations]];
    [self.mapView removeOverlays:[self.mapView overlays]];
    
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(coordinate, 700, 800) animated:YES];
    
    Pin *pin=[[Pin alloc]init];
    pin.coordinate = coordinate;
    pin.userInteractionEnabled = NO;
    pin.canShowCallout = NO;
    [self.mapView addAnnotation:pin];
    
    MKCircle *circle = [MKCircle circleWithCenterCoordinate:pin.coordinate radius:self.distanceSlider.value/2];
    [self.mapView addOverlay:circle];
    
    
}

- (IBAction)dropPin:(UILongPressGestureRecognizer *)sender {
    if(sender.state == UIGestureRecognizerStateBegan){
        
        self.distanceSlider.enabled = YES;
        NSLog(@"x:%f y:%f", [sender locationInView:self.mapView].x, [sender locationInView:self.mapView].y);
        
        [self addPinWithCoordinate:[self.mapView convertPoint:[sender locationInView:self.mapView] toCoordinateFromView:self.mapView]];
    }
    
}



-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    
    MKCircleRenderer *circleview = [[MKCircleRenderer alloc]initWithOverlay:overlay];
    circleview.fillColor=[UIColor colorWithRed:0/255.0 green:91/255.0 blue:255/255.0 alpha:0.1];
    circleview.strokeColor=[UIColor colorWithRed:0/255.0 green:91/255.0 blue:255/255.0 alpha:1];
    
    circleview.lineWidth=1.0;
    
    return circleview;
    
}


- (IBAction)distanceSlide:(UISlider *)sender {
    
    if(sender.value<200)
        [sender setValue:200];
    else{
        if ((int)sender.value % 100>50){
            
            [sender setValue:sender.value+(100-(int)sender.value % 100) ];
            
        }
        else{
            
            [sender setValue:sender.value-((int)sender.value % 100) ];
            
        }
        
        [self setNewRadius];
        
    }
 
    self.radiusLabel.text = [NSString stringWithFormat:@"Radius: %d meters", (int)sender.value];
    
}


-(void)setNewRadius{
    
    
    MKCircle *circle = [[self.mapView overlays] objectAtIndex:0];
    circle = [MKCircle circleWithCenterCoordinate:circle.coordinate radius:self.distanceSlider.value/2];
    
    [self.mapView removeOverlays:[self.mapView overlays]];
    [self.mapView addOverlay:circle];
    
}


- (IBAction)addFence:(id)sender {
    
    CLCircularRegion *fence = [[CLCircularRegion alloc]initWithCenter:[[[self.mapView annotations] objectAtIndex:0] coordinate] radius:self.distanceSlider.value identifier:nil];
    
    if(self.fenceType.selectedSegmentIndex==0)
        fence.notifyOnExit=NO;
    else
        fence.notifyOnEntry=NO;
    
    Fence *fenceMan = [Fence sharedInstance];
    
    [fenceMan addGeofenceInRegion:fence];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];

    
}


@end
