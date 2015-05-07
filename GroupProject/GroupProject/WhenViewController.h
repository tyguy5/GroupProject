//
//  WhenViewController.h
//  GroupProject
//
//  Created by Dalton on 4/28/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface WhenViewController : UIViewController <UIPickerViewDelegate>

@property (nonatomic, strong) Entry *entry;
@property (nonatomic, strong) NSDate *startingDate;
@property (nonatomic, strong) NSDate *endingDate;


@end
