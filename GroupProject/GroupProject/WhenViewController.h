//
//  WhenViewController.h
//  GroupProject
//
//  Created by Dalton on 4/28/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"


@protocol WhenViewControllerDelegate;

@interface WhenViewController : UIViewController <UIPickerViewDelegate>

@property (nonatomic, strong) id <WhenViewControllerDelegate>delegate;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker2;

@end

@protocol WhenViewControllerDelegate <NSObject>

- (void) didSelectedDates: (NSDate *)firstDate andsecondDate: (NSDate *)secondDate;

@end