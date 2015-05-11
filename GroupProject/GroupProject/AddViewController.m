//
//  AddViewController.m
//  GroupProject
//
//  Created by Dalton on 4/26/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import "AddViewController.h"
#import "EntryController.h"
#import "AppDelegate.h"
#import "WhenViewController.h"


static NSString *const setTimeSegue = @"setTime";
static NSString *const setLocationSeque = @"setLocation";

@interface AddViewController () <UITextFieldDelegate, WhenViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (strong, nonatomic) NSDate *firstDatePicker;
@property (strong, nonatomic) NSDate *secondDatePicker;

@end

@implementation AddViewController

#pragma mark - Custom Delegate
- (void)didSelectedDates:(NSDate *)firstDate andsecondDate:(NSDate *)secondDate{
    self.firstDatePicker = firstDate;
    self.secondDatePicker = secondDate;
    
    if (self.entry) {
        // TODO: Update the entry with these dates
    }
}



- (IBAction)addViewDone:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.entry) {
        // TODO: Update the entry
    } else {
        // TODO: Create a new entry
    }
    if (self.firstDatePicker == nil || self.secondDatePicker == nil) {
        [[EntryController sharedInstance] createEntryWithTitle:self.titleTextField.text createTimeStamp:nil andEndTime:nil];
    } else {
    [[EntryController sharedInstance] createEntryWithTitle:self.titleTextField.text createTimeStamp:self.firstDatePicker andEndTime:self.secondDatePicker];
    }
  }

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateWithEntry:self.entry];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.doneButton.enabled = NO;
}
-(void)textFieldDidEndEditing:(UITextField *)textField {
  // self.entry = [[EntryController sharedInstance] createEntryWithTitle:self.titleTextField.text];
   self.doneButton.enabled = YES;
}

-(void)updateWithEntry:(Entry *)entry {
    self.titleTextField.text = entry.titleOfEntry;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:setTimeSegue]) {
        WhenViewController *whenVC = segue.destinationViewController;
//        if (self.entry) {
//            // TODO: Set up date pickers to display current dates
//            whenVC.datePicker.date = self.entry.timestamp;
//            whenVC.datePicker2.date = self.entry.endTimeStamp;
//        }
        whenVC.delegate = self;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
