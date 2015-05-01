//
//  WhereViewController.m
//  GroupProject
//
//  Created by Dalton on 5/1/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import "WhereViewController.h"

@import MapKit;


@interface WhereViewController () <MKMapViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *radiusTextField;

@end

@implementation WhereViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = YES;
    self.mapView.delegate = self;
    
    MKUserLocation *userLocation = self.mapView.userLocation;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 20000, 20000);
    
    [self.mapView setRegion:region animated:YES];
    
}


-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    self.mapView.centerCoordinate = userLocation.location.coordinate;
    
}
- (IBAction)EntryExitButtonTapped:(id)sender {
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}



@end
