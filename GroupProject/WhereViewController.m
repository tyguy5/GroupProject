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

@end

@implementation WhereViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
