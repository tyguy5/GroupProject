//
//  ModelController.h
//  GroupProject
//
//  Created by TYLER on 4/23/15.
//  Copyright (c) 2015 Front Row Joes Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end

