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


@interface WhenViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker2;




@end

@implementation WhenViewController
- (IBAction)whenViewDone:(id)sender {
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
    
}

- (IBAction)setEndTimeButtonTapped:(id)sender {
    
    self.datePicker.hidden = NO;
    self.datePicker2.hidden = NO;
    
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



- (IBAction)saveButtonTapped:(id)sender {
    
    //    self.entry = [[EntryController sharedInstance] createTimeStamp:self.datePicker.date];
    self.entry.timestamp = self.datePicker.date;
    self.entry.endTimeStamp = self.datePicker2.date;
    
    [[EntryController sharedInstance] save];
    
}



@end
