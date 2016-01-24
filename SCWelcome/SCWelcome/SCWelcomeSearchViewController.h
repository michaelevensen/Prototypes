//
//  SCWelcomeSearchViewController.h
//  SCWelcome
//
//  Created by Michael Evensen on 5/21/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCWelcomeAnimationViewController.h"
#import "SCWelcomeFollowButton.h"

@interface SCWelcomeSearchViewController : SCWelcomeAnimationViewController

// Page Index
@property NSUInteger pageIndex;

// Original Position
@property CGPoint originalPosition;

// Page Content
@property (strong, nonatomic) IBOutlet UIView *pageContent;
@property (strong, nonatomic) IBOutlet UIView *pageFrame;

@property NSMutableArray *followButtons;

// Highlight Circle
@property UIView *circleView;

@end
