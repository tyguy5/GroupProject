//
//  AppearanceController.m
//  GroupProject
//
//  Created by Dalton on 4/28/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import "AppearanceController.h"
#import "TabBarController.h"

#import "LoginViewController.h"
#import "WelcomeViewController.h"

#import "OptionsViewController.h"
#import "AddViewController.h"

@import UIKit;

@implementation AppearanceController


+ (void)initializeAppearanceDefaults {
    
    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithRed:21/255.0 green:158/255.0 blue:123/255.0 alpha:1]];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:21/255.0 green:158/255.0 blue:123/255.0 alpha:1]];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:21/255.0 green:158/255.0 blue:123/255.0 alpha:1]];
    
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTranslucent:NO];
//    
//    [[UIView appearance] setBackgroundColor:[UIColor colorWithRed:222/255.0 green:214/255.0 blue:189/255.0 alpha:1]];
//
//    [[UITextView appearance] setBackgroundColor:[UIColor clearColor]];
//    
//    [[UITextView appearance] setTextColor:[UIColor colorWithRed:48/255.0 green:48/255.0 blue:35/255.0 alpha:1]];
//    
//    [[UILabel appearance] setBackgroundColor:[UIColor clearColor]];
//    
//    [[UILabel appearance] setTextColor:[UIColor colorWithRed:48/255.0 green:48/255.0 blue:35/255.0 alpha:1]];
//    
//    [[UIImageView appearance] setBackgroundColor:[UIColor clearColor]];
    
    


}


@end
