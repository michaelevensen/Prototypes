//
//  SCWelcomeViewController.h
//  SCWelcome
//
//  Created by Michael Evensen on 5/13/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCWelcomeDiscoverViewController.h"
#import "SCTextView.h"
#import "SCButton.h"

@interface SCWelcomeViewController : UIViewController <UIPageViewControllerDataSource>

@property BOOL shouldHide;
@property int viewCount;

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) IBOutlet SCButton *startListeningButton;

// Bottom Stroke
@property (strong, nonatomic) IBOutlet UIView *bottomStroke;

@end
