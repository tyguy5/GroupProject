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
@property (weak, nonatomic) IBOutlet UILabel *dateSelectionText;



@end

@implementation WhenViewController
- (IBAction)whenViewDone:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dateSelectionText.text = @"";

    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
}





- (IBAction)saveButtonTapped:(id)sender {
    
    [self showSelectedDate];
//    self.entry = [[EntryController sharedInstance] createTimeStamp:self.datePicker.date];
    self.entry.timestamp = self.datePicker.date;
    
    [[EntryController sharedInstance] save];
    
    [self.tabBarController setSelectedIndex:1];

}


- (void)showSelectedDate {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMM YYYY HH:mm:ss"];

    
    self.dateSelectionText.text = [NSString stringWithFormat:@"%@", [formatter stringFromDate:self.datePicker.date]];
}

@end
