//
//  OptionsViewController.m
//  GroupProject
//
//  Created by Dalton on 4/25/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import "OptionsViewController.h"

@import MessageUI;


@interface OptionsViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation OptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)feedbackButtonTapped:(id)sender {
    
    MFMailComposeViewController *mailViewController = [MFMailComposeViewController new];
    mailViewController.mailComposeDelegate = self;
    
    // set up email address to dalton.purnell61@gmail.com so that it is pre-populated
    [mailViewController setToRecipients:@[@"dalton.purnell61@gmail.com"]];
    
    [self presentViewController:mailViewController animated:YES completion:nil];

}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
