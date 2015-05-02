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
@property (weak, nonatomic) IBOutlet UILabel *dateSelectionText;
@property (weak, nonatomic) IBOutlet UILabel *endDateSelectionText;



@end

@implementation WhenViewController
- (IBAction)whenViewDone:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dateSelectionText.text = @"";
    self.endDateSelectionText.text = @"";
    

    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    self.datePicker.hidden = YES;
    
    self.datePicker2.datePickerMode = UIDatePickerModeDateAndTime;
    self.datePicker2.hidden = YES;
}

- (IBAction)setStartTimeButtonTapped:(id)sender {
    
    self.datePicker.hidden = NO;    
    
    
}

- (IBAction)setEndTimeButtonTapped:(id)sender {
    
    self.datePicker.hidden = YES;
    self.datePicker2.hidden = NO;
    
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


-(void)showSelectedEndDate {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMM YYYY HH:mm:ss"];
    
    self.endDateSelectionText.text = [NSString stringWithFormat:@"%@", [formatter stringFromDate:self.datePicker2.date]];
    
}

@end
