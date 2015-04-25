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

# pragma mark - feedback button mail compose view controller

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


# pragma mark - share button mail compose view controller

- (IBAction)shareButtonTapped:(id)sender {
    
    MFMailComposeViewController *shareViewController = [MFMailComposeViewController new];
    shareViewController.mailComposeDelegate = self;
    
    // set up email address to dalton.purnell61@gmail.com so that it is pre-populated
    [shareViewController setToRecipients:@[@"dalton.purnell61@gmail.com"]];
    
    [self presentViewController:shareViewController animated:YES completion:nil];
    
}

- (void)shareComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)rateButtonTapped:(id)sender {
    
}

@end
