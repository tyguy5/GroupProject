//
//  WhenViewController.m
//  GroupProject
//
//  Created by Dalton on 4/28/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import "WhenViewController.h"
#import "EntryController.h"

@interface WhenViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *dateSelectionText;


@end

@implementation WhenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dateSelectionText.text = @"";
    
    
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
}

- (IBAction)saveButtonTapped:(id)sender {
    
    [self showSelectedDate];
    
    self.entry.timestamp = [NSDate date];
    
    [[EntryController sharedInstance] save];

}


- (void)showSelectedDate {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMM YYYY"];
    
    
    self.dateSelectionText.text = [NSString stringWithFormat:@"%@", [formatter stringFromDate:self.datePicker.date]];
}

@end