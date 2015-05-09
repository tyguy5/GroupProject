//
//  WhenViewController.m
//  GroupProject
//
//  Created by Dalton on 4/28/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import "WhenViewController.h"
#import "EntryController.h"
#import "Stack.h"
#import "AddViewController.h"



@interface WhenViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation WhenViewController

@synthesize delegate;

- (IBAction)whenViewDone:(id)sender {
    [self.delegate didSelectedDates:self.datePicker.date andsecondDate:self.datePicker2.date];
    [self dismissViewControllerAnimated:YES completion:nil];
    }

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    self.datePicker.hidden = YES;
    
    self.datePicker2.datePickerMode = UIDatePickerModeDateAndTime;
    self.datePicker2.hidden = YES;
}

- (IBAction)setStartTimeButtonTapped:(id)sender {
    
    self.datePicker.hidden = NO;
    self.datePicker2.hidden = YES;
    self.doneButton.enabled = NO;
}

- (IBAction)setEndTimeButtonTapped:(id)sender {
    
    self.datePicker.hidden = NO;
    self.datePicker2.hidden = NO;
    self.doneButton.enabled = YES;
    
}



- (void) remindAtStartTime {
    NSDate *alertTime = self.datePicker.date;
    
    UILocalNotification *localNotification = [UILocalNotification new];
    if (localNotification) {
        localNotification.fireDate = alertTime;
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.repeatInterval = 0;
        localNotification.alertBody = @"You picked this time you fool! Go set a geofence";
        localNotification.applicationIconBadgeNumber = 1;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
}



@end
