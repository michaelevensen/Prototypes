//
//  SCWelcomeExploreViewController.h
//  SCWelcome
//
//  Created by Michael Evensen on 5/21/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCWelcomeAnimationViewController.h"

@interface SCWelcomeDiscoverViewController : SCWelcomeAnimationViewController

// Page Index
@property NSUInteger pageIndex;

// Original Position
@property CGPoint originalPosition;

// Feed
@property (strong, nonatomic) IBOutlet UIView *pageFrame;
@property (strong, nonatomic) IBOutlet UIView *pageContent;

// Feed Picker
@property (strong, nonatomic) IBOutlet UIView *feedPickerLabel;
@property (strong, nonatomic) IBOutlet UIImageView *feedPickerLogo;

@property CGPoint originalLogoValue;
@property CGPoint originalFeedPickerLabelValue;

// Highlight Circle
@property UIView *circleView;

@end
