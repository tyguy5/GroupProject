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
@property (weak, nonatomic) IBOutlet UILabel *dateSelectionText;
@property (weak, nonatomic) IBOutlet UILabel *endDateSelectionText;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker2;



@end

@implementation WhenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.datePicker.hidden = YES;
    self.datePicker2.hidden = YES;
    
    self.dateSelectionText.text = @"";
    self.endDateSelectionText.text = @"";

}
- (IBAction)setStartTimeButtonTapped:(id)sender {
    
    self.datePicker.hidden = NO;
    self.datePicker.timeZone = [NSTimeZone localTimeZone];
    
    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
}

- (IBAction)setEndTimeButtonTapped:(id)sender {
    
    self.datePicker.hidden = YES;
    self.datePicker2.hidden = NO;
    self.datePicker2.timeZone = [NSTimeZone localTimeZone];
    
    
    self.datePicker2.datePickerMode = UIDatePickerModeDateAndTime;
    
}



- (IBAction)saveButtonTapped:(id)sender {
    
    [self showSelectedDate];
//    self.entry = [[EntryController sharedInstance] createTimeStamp:self.datePicker.date];
    self.entry.timestamp = self.datePicker.date;
    self.entry.endTimeStamp = self.datePicker2.date;
    
    [[EntryController sharedInstance] save];
    
}


- (void)showSelectedDate {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMM YYYY HH:mm:ss"];

    
    self.dateSelectionText.text = [NSString stringWithFormat:@"%@", [formatter stringFromDate:self.datePicker.date]];
}


- (void)showSelectedEndDate {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMM YYY HH:mm:ss"];
    
    
    self.endDateSelectionText.text = [NSString stringWithFormat:@"%@", [formatter stringFromDate:self.datePicker2.date]];
}

@end
