//
//  WhereViewController.m
//  GroupProject
//
//  Created by Dalton on 5/1/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import "WhereViewController.h"

@import MapKit;


@interface WhereViewController () <MKMapViewDelegate, UITextFieldDelegate, UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *radiusTextField;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UISearchController *searchController;
@property (weak, nonatomic) IBOutlet UITableView *searchResultsTableView;


@end

@implementation WhereViewController {
    
    MKLocalSearch *localSearch;
    MKLocalSearchResponse *results;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = YES;
    self.mapView.delegate = self;
    self.searchBar.delegate = self;
    self.searchController.delegate = self;
    
    self.searchResultsTableView.hidden = YES;
    
    self.radiusTextField.delegate = self;
    
    
    MKUserLocation *userLocation = self.mapView.userLocation;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 20000, 20000);
    
    [self.mapView setRegion:region animated:YES];
    
}


#pragma mark - Search methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    
    // This cancels any previous searches
    [localSearch cancel];
    
    // This is to perform a new search
    MKLocalSearchRequest *request = [MKLocalSearchRequest new];
    request.naturalLanguageQuery = searchBar.text;
    request.region = self.mapView.region;
    
    
    // Not sure exactly what this does
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        if (error != nil) {
            [[[UIAlertView alloc] initWithTitle:@"Map error"
                                        message:[error description]
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil]show];
             
             return;
             
        }
        
        if ([response.mapItems count] == 0) {
            [[[UIAlertView alloc] initWithTitle:@"No results"
                                        message:[error description]
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil]show];
             
             return;
             
        }
        
        results = response;
        
//        self.searchResultsTableView.hidden = NO;
        
        [self.searchResultsTableView reloadData];
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [results.mapItems count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ResultCell";
    
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    

    MKMapItem *item = results.mapItems[indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.placemark.addressDictionary[@"Street"];
    
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.searchController.active = YES;
     
    MKMapItem *item = results.mapItems[indexPath.row];
    
    // Don't know what these two lines do
    [self.mapView addAnnotation:item.placemark];
    [self.mapView selectAnnotation:item.placemark animated:YES];
    
    [self.mapView setCenterCoordinate:item.placemark.location.coordinate];
    
    [self.mapView setUserTrackingMode:MKUserTrackingModeNone];
    
    
}



- (IBAction)whereViewDone:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
