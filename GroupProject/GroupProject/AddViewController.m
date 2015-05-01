//
//  AddViewController.m
//  GroupProject
//
//  Created by Dalton on 4/26/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import "AddViewController.h"
#import "EntryController.h"

@interface AddViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *titleTextField;


@end

@implementation AddViewController

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
-(void)textFieldDidEndEditing:(UITextField *)textField {
    self.entry = [[EntryController sharedInstance] createEntryWithTitle:self.titleTextField.text];
}

-(void)updateWithEntry:(Entry *)entry {
    self.titleTextField.text = entry.titleOfEntry;
    
}

/*.text
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
