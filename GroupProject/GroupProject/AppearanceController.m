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
    
    [[UINavigationBar appearance] setBackgroundColor:[UIColor brownColor]];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor brownColor]];
    
    [[UITabBar appearance] setBarTintColor:[UIColor brownColor]];
    
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTranslucent:NO];
}


@end
