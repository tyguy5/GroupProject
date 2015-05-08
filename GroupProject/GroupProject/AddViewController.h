//
//  AddViewController.h
//  GroupProject
//
//  Created by Dalton on 4/26/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"
#import "WhenViewController.h"


@interface AddViewController : UIViewController <WhenViewControllerDelegate>

@property (strong, nonatomic) Entry *entry;

@end
